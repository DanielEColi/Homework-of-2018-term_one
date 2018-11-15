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
static const char *ng0 = "D:/FPGALab/product/Lab6/Code/decoder.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );
char *ieee_p_2592010699_sub_1837678034_503743352(char *, char *, char *, char *);


static void work_a_2263464102_1516540902_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    int t11;
    int t12;
    int t13;
    char *t14;
    int t16;
    char *t17;
    int t19;
    char *t20;
    int t22;
    char *t23;
    int t25;
    char *t26;
    int t28;
    char *t29;
    int t31;
    char *t32;
    int t34;
    char *t35;
    int t37;
    char *t38;
    int t40;
    char *t41;
    int t43;
    char *t44;
    int t46;
    char *t47;
    int t49;
    char *t50;
    int t52;
    char *t53;
    char *t55;
    char *t56;
    char *t57;
    char *t58;
    char *t59;

LAB0:    xsi_set_current_line(35, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1632U);
    t3 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 3560);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(36, ng0);
    t1 = (t0 + 5735);
    t6 = (t0 + 3656);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 4U);
    xsi_driver_first_trans_fast(t6);
    goto LAB3;

LAB5:    xsi_set_current_line(38, ng0);
    t2 = (t0 + 1352U);
    t5 = *((char **)t2);
    t2 = (t0 + 5739);
    t11 = xsi_mem_cmp(t2, t5, 8U);
    if (t11 == 1)
        goto LAB8;

LAB25:    t7 = (t0 + 5747);
    t12 = xsi_mem_cmp(t7, t5, 8U);
    if (t12 == 1)
        goto LAB9;

LAB26:    t9 = (t0 + 5755);
    t13 = xsi_mem_cmp(t9, t5, 8U);
    if (t13 == 1)
        goto LAB10;

LAB27:    t14 = (t0 + 5763);
    t16 = xsi_mem_cmp(t14, t5, 8U);
    if (t16 == 1)
        goto LAB11;

LAB28:    t17 = (t0 + 5771);
    t19 = xsi_mem_cmp(t17, t5, 8U);
    if (t19 == 1)
        goto LAB12;

LAB29:    t20 = (t0 + 5779);
    t22 = xsi_mem_cmp(t20, t5, 8U);
    if (t22 == 1)
        goto LAB13;

LAB30:    t23 = (t0 + 5787);
    t25 = xsi_mem_cmp(t23, t5, 8U);
    if (t25 == 1)
        goto LAB14;

LAB31:    t26 = (t0 + 5795);
    t28 = xsi_mem_cmp(t26, t5, 8U);
    if (t28 == 1)
        goto LAB15;

LAB32:    t29 = (t0 + 5803);
    t31 = xsi_mem_cmp(t29, t5, 8U);
    if (t31 == 1)
        goto LAB16;

LAB33:    t32 = (t0 + 5811);
    t34 = xsi_mem_cmp(t32, t5, 8U);
    if (t34 == 1)
        goto LAB17;

LAB34:    t35 = (t0 + 5819);
    t37 = xsi_mem_cmp(t35, t5, 8U);
    if (t37 == 1)
        goto LAB18;

LAB35:    t38 = (t0 + 5827);
    t40 = xsi_mem_cmp(t38, t5, 8U);
    if (t40 == 1)
        goto LAB19;

LAB36:    t41 = (t0 + 5835);
    t43 = xsi_mem_cmp(t41, t5, 8U);
    if (t43 == 1)
        goto LAB20;

LAB37:    t44 = (t0 + 5843);
    t46 = xsi_mem_cmp(t44, t5, 8U);
    if (t46 == 1)
        goto LAB21;

LAB38:    t47 = (t0 + 5851);
    t49 = xsi_mem_cmp(t47, t5, 8U);
    if (t49 == 1)
        goto LAB22;

LAB39:    t50 = (t0 + 5859);
    t52 = xsi_mem_cmp(t50, t5, 8U);
    if (t52 == 1)
        goto LAB23;

LAB40:
LAB24:    xsi_set_current_line(55, ng0);

LAB7:    goto LAB3;

LAB8:    xsi_set_current_line(39, ng0);
    t53 = (t0 + 5867);
    t55 = (t0 + 3656);
    t56 = (t55 + 56U);
    t57 = *((char **)t56);
    t58 = (t57 + 56U);
    t59 = *((char **)t58);
    memcpy(t59, t53, 4U);
    xsi_driver_first_trans_fast(t55);
    goto LAB7;

LAB9:    xsi_set_current_line(40, ng0);
    t1 = (t0 + 5871);
    t5 = (t0 + 3656);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_fast(t5);
    goto LAB7;

LAB10:    xsi_set_current_line(41, ng0);
    t1 = (t0 + 5875);
    t5 = (t0 + 3656);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_fast(t5);
    goto LAB7;

LAB11:    xsi_set_current_line(42, ng0);
    t1 = (t0 + 5879);
    t5 = (t0 + 3656);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_fast(t5);
    goto LAB7;

LAB12:    xsi_set_current_line(43, ng0);
    t1 = (t0 + 5883);
    t5 = (t0 + 3656);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_fast(t5);
    goto LAB7;

LAB13:    xsi_set_current_line(44, ng0);
    t1 = (t0 + 5887);
    t5 = (t0 + 3656);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_fast(t5);
    goto LAB7;

LAB14:    xsi_set_current_line(45, ng0);
    t1 = (t0 + 5891);
    t5 = (t0 + 3656);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_fast(t5);
    goto LAB7;

LAB15:    xsi_set_current_line(46, ng0);
    t1 = (t0 + 5895);
    t5 = (t0 + 3656);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_fast(t5);
    goto LAB7;

LAB16:    xsi_set_current_line(47, ng0);
    t1 = (t0 + 5899);
    t5 = (t0 + 3656);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_fast(t5);
    goto LAB7;

LAB17:    xsi_set_current_line(48, ng0);
    t1 = (t0 + 5903);
    t5 = (t0 + 3656);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_fast(t5);
    goto LAB7;

LAB18:    xsi_set_current_line(49, ng0);
    t1 = (t0 + 5907);
    t5 = (t0 + 3656);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_fast(t5);
    goto LAB7;

LAB19:    xsi_set_current_line(50, ng0);
    t1 = (t0 + 5911);
    t5 = (t0 + 3656);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_fast(t5);
    goto LAB7;

LAB20:    xsi_set_current_line(51, ng0);
    t1 = (t0 + 5915);
    t5 = (t0 + 3656);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_fast(t5);
    goto LAB7;

LAB21:    xsi_set_current_line(52, ng0);
    t1 = (t0 + 5919);
    t5 = (t0 + 3656);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_fast(t5);
    goto LAB7;

LAB22:    xsi_set_current_line(53, ng0);
    t1 = (t0 + 5923);
    t5 = (t0 + 3656);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_fast(t5);
    goto LAB7;

LAB23:    xsi_set_current_line(54, ng0);
    t1 = (t0 + 5927);
    t5 = (t0 + 3656);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_fast(t5);
    goto LAB7;

LAB41:;
}

static void work_a_2263464102_1516540902_p_1(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(60, ng0);

LAB3:    t2 = (t0 + 1832U);
    t3 = *((char **)t2);
    t2 = (t0 + 5696U);
    t4 = ieee_p_2592010699_sub_1837678034_503743352(IEEE_P_2592010699, t1, t3, t2);
    t5 = (t1 + 12U);
    t6 = *((unsigned int *)t5);
    t7 = (1U * t6);
    t8 = (4U != t7);
    if (t8 == 1)
        goto LAB5;

LAB6:    t9 = (t0 + 3720);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 4U);
    xsi_driver_first_trans_fast_port(t9);

LAB2:    t14 = (t0 + 3576);
    *((int *)t14) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(4U, t7, 0);
    goto LAB6;

}


extern void work_a_2263464102_1516540902_init()
{
	static char *pe[] = {(void *)work_a_2263464102_1516540902_p_0,(void *)work_a_2263464102_1516540902_p_1};
	xsi_register_didat("work_a_2263464102_1516540902", "isim/decoder_tb_isim_beh.exe.sim/work/a_2263464102_1516540902.didat");
	xsi_register_executes(pe);
}
