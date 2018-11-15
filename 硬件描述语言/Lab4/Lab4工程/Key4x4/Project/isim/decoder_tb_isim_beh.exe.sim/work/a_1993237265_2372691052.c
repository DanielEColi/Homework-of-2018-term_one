/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/FPGALab/product/Lab6/Code/decoder_tb.vhd";



static void work_a_1993237265_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(45, ng0);
    t2 = (t0 + 3424);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(46, ng0);
    t2 = (t0 + 1808U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 2600);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(47, ng0);
    t2 = (t0 + 3424);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(48, ng0);
    t2 = (t0 + 1808U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 2600);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_1993237265_2372691052_p_1(char *t0)
{
    char *t1;
    char *t2;
    int64 t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int64 t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 3040U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(56, ng0);
    t3 = (100 * 1000LL);
    t2 = (t0 + 2848);
    xsi_process_wait(t2, t3);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(57, ng0);
    t2 = (t0 + 3488);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(58, ng0);
    t2 = (t0 + 1808U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t8 = (t3 * 1000000);
    t2 = (t0 + 2848);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(59, ng0);
    t2 = (t0 + 5532);
    t5 = (t0 + 3552);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(60, ng0);
    t2 = (t0 + 1808U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t8 = (t3 * 1000000);
    t2 = (t0 + 2848);
    xsi_process_wait(t2, t8);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB12:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 5540);
    t5 = (t0 + 3552);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(62, ng0);
    t2 = (t0 + 1808U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t8 = (t3 * 1000000);
    t2 = (t0 + 2848);
    xsi_process_wait(t2, t8);

LAB18:    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

LAB16:    xsi_set_current_line(63, ng0);
    t2 = (t0 + 5548);
    t5 = (t0 + 3552);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(64, ng0);
    t2 = (t0 + 1808U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t8 = (t3 * 1000000);
    t2 = (t0 + 2848);
    xsi_process_wait(t2, t8);

LAB22:    *((char **)t1) = &&LAB23;
    goto LAB1;

LAB17:    goto LAB16;

LAB19:    goto LAB17;

LAB20:    xsi_set_current_line(65, ng0);
    t2 = (t0 + 5556);
    t5 = (t0 + 3552);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(66, ng0);
    t2 = (t0 + 1808U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t8 = (t3 * 1000000);
    t2 = (t0 + 2848);
    xsi_process_wait(t2, t8);

LAB26:    *((char **)t1) = &&LAB27;
    goto LAB1;

LAB21:    goto LAB20;

LAB23:    goto LAB21;

LAB24:    xsi_set_current_line(67, ng0);
    t2 = (t0 + 5564);
    t5 = (t0 + 3552);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(68, ng0);
    t2 = (t0 + 1808U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t8 = (t3 * 1000000);
    t2 = (t0 + 2848);
    xsi_process_wait(t2, t8);

LAB30:    *((char **)t1) = &&LAB31;
    goto LAB1;

LAB25:    goto LAB24;

LAB27:    goto LAB25;

LAB28:    xsi_set_current_line(69, ng0);
    t2 = (t0 + 5572);
    t5 = (t0 + 3552);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(70, ng0);
    t2 = (t0 + 1808U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t8 = (t3 * 1000000);
    t2 = (t0 + 2848);
    xsi_process_wait(t2, t8);

LAB34:    *((char **)t1) = &&LAB35;
    goto LAB1;

LAB29:    goto LAB28;

LAB31:    goto LAB29;

LAB32:    xsi_set_current_line(71, ng0);
    t2 = (t0 + 5580);
    t5 = (t0 + 3552);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(74, ng0);

LAB38:    *((char **)t1) = &&LAB39;
    goto LAB1;

LAB33:    goto LAB32;

LAB35:    goto LAB33;

LAB36:    goto LAB2;

LAB37:    goto LAB36;

LAB39:    goto LAB37;

}


extern void work_a_1993237265_2372691052_init()
{
	static char *pe[] = {(void *)work_a_1993237265_2372691052_p_0,(void *)work_a_1993237265_2372691052_p_1};
	xsi_register_didat("work_a_1993237265_2372691052", "isim/decoder_tb_isim_beh.exe.sim/work/a_1993237265_2372691052.didat");
	xsi_register_executes(pe);
}
