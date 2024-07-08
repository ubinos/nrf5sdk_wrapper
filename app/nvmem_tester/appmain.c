/*
 * Copyright (c) 2021 Sung Ho Park
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <ubinos.h>

#include <ubinos/ubidrv/nvmem.h>

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

#define TEST_DATA_SIZE (1024 * 2 + 512)

#define TEST_COUNT 3

static uint8_t _test_data_buf[TEST_DATA_SIZE];
static uint8_t _test_read_buf[TEST_DATA_SIZE];

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

    printf("\n\n\n");
    printf("================================================================================\n");
    printf("nvmem_tester (build time: %s %s)\n", __TIME__, __DATE__);
    printf("================================================================================\n");
    printf("\n");

    printf("FLASH_USER_START_ADDR = 0x%08lx\n", (uint32_t) FLASH_USER_START_ADDR);
    printf("FLASH_USER_END_ADDR   = 0x%08lx\n", (uint32_t) FLASH_USER_END_ADDR);
    printf("\n");

    for (i = 0; i < TEST_COUNT; i++)
    {
        printf("nvmem test %ld : ", i);

        for (j = 0; j < TEST_DATA_SIZE; j++)
        {
            if (i % 2 == 0)
            {
                _test_data_buf[j] = j % 0x100;
            }
            else
            {
                _test_data_buf[j] = 0xff - (j % 0x100);
            }
        }
        uerr = nvmem_update(FLASH_USER_START_ADDR, _test_data_buf, TEST_DATA_SIZE);
        assert(uerr == UBI_ERR_OK);

        memset(_test_read_buf, 0, TEST_DATA_SIZE);
        uerr = nvmem_read(FLASH_USER_START_ADDR, _test_read_buf, TEST_DATA_SIZE);
        assert(uerr == UBI_ERR_OK);

        if (strncmp((const char *) _test_read_buf, (const char *) _test_data_buf, TEST_DATA_SIZE) == 0)
        {
            printf("success");
        }
        else
        {
            printf("fail");
        }

        printf("\n");
    }
}

