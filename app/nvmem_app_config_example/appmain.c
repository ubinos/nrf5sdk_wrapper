/*
 * Copyright (c) 2021 Sung Ho Park
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <ubinos.h>

#include <ubinos/ubidrv/nvmem.h>

#include <checksum.h>

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <stdint.h>
#include <assert.h>

/* Definition for NVMEM */
extern char __flash2_start__; /* Set by linker.  */
extern char __flash2_size__; /* Set by linker.  */

#define FLASH_USER_START_ADDR   ((uint8_t *) (&__flash2_start__))
#define FLASH_USER_END_ADDR     ((uint8_t *) ((ptrdiff_t) (&__flash2_start__) + (ptrdiff_t) (&__flash2_size__) - 1))

#define FLASH_BYTE_DATA_LEN 16

typedef struct _app_config_data_t {
    int32_t int_data;
    float float_data;
    uint8_t byte_datas[FLASH_BYTE_DATA_LEN];
} app_config_data_t;

typedef struct _app_config_t {
    app_config_data_t data;
    uint32_t crc32;
} app_config_t;

#define TEST_COUNT 10

static void root_func(void * arg);

int appmain(int argc, char * argv[])
{
    int r;
    (void) r;

    r = task_create(NULL, root_func, NULL, task_getmiddlepriority() + 1, 0, "root");
    ubi_assert(r == 0);

    ubik_comp_start();

    return 0;
}

static void root_func(void * arg)
{
    uint32_t i, j;
    ubi_err_t uerr;


    app_config_t app_config;
    app_config_t app_config_ref;
    uint32_t crc32;

    printf("\n\n\n");
    printf("================================================================================\n");
    printf("nvmem_app_config_example (build time: %s %s)\n", __TIME__, __DATE__);
    printf("================================================================================\n");
    printf("\n");

    printf("FLASH_USER_START_ADDR = 0x%08lx\n", (uint32_t) FLASH_USER_START_ADDR);
    printf("FLASH_USER_END_ADDR   = 0x%08lx\n", (uint32_t) FLASH_USER_END_ADDR);
    printf("\n");

    task_sleepms(100);

    memset(&app_config, 0, sizeof(app_config_t));
    uerr = nvmem_read(FLASH_USER_START_ADDR, (uint8_t *) &app_config, sizeof(app_config_t));
    assert(uerr == UBI_ERR_OK);
    crc32 = crc_32((uint8_t *) &app_config.data, sizeof(app_config_data_t));
    printf("nvmem app config example : saved config test:\n");
        printf("    crc       : 0x%02lx : ", app_config.crc32);
    if (crc32 == app_config.crc32)
    {
        printf("ok\n");
        printf("    int_data  : %ld\n", app_config.data.int_data);
        printf("    float_data: %f\n", app_config.data.float_data);
        printf("    byte_datas: 0x");
        for (j = 0; j < FLASH_BYTE_DATA_LEN; j++)
        {
            printf(" %02x", app_config.data.byte_datas[j]);
        }
        printf("\n\n");
    }
    else
    {
        printf("error\n\n");
    }

    for (i = 0; i < TEST_COUNT; i++)
    {
        printf("nvmem app config example : save and load test : %ld : ", i);

        app_config.data.int_data = i;
        app_config.data.float_data = 3.14 / i;
        for (j = 0; j < FLASH_BYTE_DATA_LEN; j++)
        {
            app_config.data.byte_datas[j] = j % 0x100;
        }
        app_config.crc32 = crc_32((uint8_t *) &app_config.data, sizeof(app_config_data_t));

        memcpy(&app_config_ref, &app_config, sizeof(app_config_t));

        uerr = nvmem_update(FLASH_USER_START_ADDR, (uint8_t *) &app_config, sizeof(app_config_t));
        assert(uerr == UBI_ERR_OK);

        memset(&app_config, 0, sizeof(app_config_t));
        uerr = nvmem_read(FLASH_USER_START_ADDR, (uint8_t *) &app_config, sizeof(app_config_t));
        assert(uerr == UBI_ERR_OK);

        if (strncmp((const char *) &app_config_ref, (const char *) &app_config, sizeof(app_config_t)) == 0)
        {
            printf("success");
        }
        else
        {
            printf("fail");
        }

        printf("\n");
    }

    printf("\nend.\n");
}

