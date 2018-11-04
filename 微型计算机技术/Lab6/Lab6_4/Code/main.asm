LED1 BIT P2.4   ;设置LED1的引脚为P2.4
LED2 BIT P2.5   ;设置LED2的引脚为P2.5
LED3 BIT P2.6   ;设置LED3的引脚为P2.6
LED4 BIT P2.7   ;设置LED4的引脚为P2.7

BEEP BIT P1.0   ;设置蜂鸣器的引脚为P1.0

DelayTimes_100MS EQU 6FH  ;设置延时计数器存放的寄存器
P1M0 EQU 092H             ;端口配置寄存器
P1M1 EQU 091H             ;端口配置寄存器

;*************************************
;--主程序开始--
ORG 0000H       ;程序入口0000H
LJMP MAIN       ;长跳转到MAIN
ORG 0003H       ;中断服务函数0在内存中的位置为0003H
LJMP INT0_ISR   ;长跳转到中断服务函数0

ORG 1000H       ;MAIN函数写在1000H的位置
MAIN:
	MOV SP,#70H   ;修改SP指针的指向
  CLR IT0       ;设置为电平触发
  CLR PX0       ;设置优先级
  SETB EX0      ;外部中断使能
  SETB EA       ;中断总开关
  MOV P1M1,#00H     ;配置为默认
	MOV P1M0,#01H     ;配置蜂鸣器端口为推挽输出
	CLR BEEP      ;关闭蜂鸣器
	LJMP START1   ;长跳转到START1处

START1:
	LCALL WATERLED  ;调用流水灯函数
	LJMP  START1    ;长跳转到START1

;**************************************
;延时100MS函数  

Delay100MS:
	MOV R7, DelayTimes_100MS
	Delay100MS_1:  MOV R6,#10
	Delay100MS_2:  MOV R5,#150
	Delay100MS_3:  MOV R4,#200
	Delay100MS_4:  DJNZ R4,Delay100MS_4
					DJNZ R5,Delay100MS_3
					DJNZ R6,Delay100MS_2
					DJNZ R7,Delay100MS_1
RET
;**************************************
				
;**************************************
;流水灯函数
        
WATERLED:
  CLR  LED1
	SETB LED2
	SETB LED3
	SETB LED4
	MOV DelayTimes_100MS,#10
	LCALL Delay100MS

	SETB  LED1
	CLR   LED2
	SETB  LED3
	SETB  LED4
	MOV DelayTimes_100MS,#10
	LCALL Delay100MS

	SETB  LED1
	SETB  LED2
	CLR   LED3
	SETB  LED4
	MOV DelayTimes_100MS,#10
	LCALL Delay100MS

	SETB  LED1
	SETB  LED2
	SETB  LED3
	CLR   LED4
	MOV DelayTimes_100MS,#10
	LCALL Delay100MS
RET
;**************************************

;**************************************
;中断服务函数0

ORG 2000H
INT0_ISR:
	PUSH PSW    ;将PSW状态字压栈
	PUSH ACC    ;将ACC压栈
	CLR  RS0    ;修改工作寄存器组
	SETB RS1
;*********************
;中断服务函数主要内容
	MOV R0,#6
TWEET:	
	CPL BEEP                ;蜂鸣器取反
	MOV DelayTimes_100MS,#5 ;延时500ms
	LCALL Delay100MS        ;调用延时函数
  DJNZ R0,TWEET
;*********************
	POP ACC   ;将ACC出栈
	POP PSW   ;将PSW状态字出栈
RETI     ;中断服务函数结束
;**************************************


END	