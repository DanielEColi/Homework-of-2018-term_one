LED1 BIT P2.4	;将P2.4用伪指令命名为LED1
LED2 BIT P2.5	;将P2.5用伪指令命名为LED2
LED3 BIT P2.6	;将P2.6用伪指令命名为LED3
LED4 BIT P2.7	;将P2.7用伪指令命名为LED4

BEEP BIT P1.0   ;将P1.0用伪指令命名为BEEP

DelayTimes_100MS EQU 6FH  ;将地址6FH用伪指令命名为DelayTimes_100MS
P1M0 EQU 092H             ;端口配置寄存器
P1M1 EQU 091H             ;端口配置寄存器

;************************************************
;--主程序开始--
ORG 0000H     ;定义起始地址，程序将从此处开始运行
LJMP START    ;长跳转，跳转到标号“START”处

ORG 0100H     ;定义START程序地址

START:
  	MOV SP, #70H    ;设置堆栈，堆栈空间从70H到7FH，共16个字节
	MOV P1M1,#00H     ;配置为默认
	MOV P1M0,#01H     ;配置蜂鸣器端口为推挽输出

	SETB LED1   ;熄灭LED1
	SETB LED2   ;熄灭LED2
	SETB LED3   ;熄灭LED3
	SETB LED4   ;熄灭LED4

  	START1:
  		LCALL LEDRUN  ;调用跑马灯程序
		LJMP  START1    ;跳转回START1，重新执行以上程序

;*************************************************
;以下均为子程序
;*************************************************
;---------------
;   延时100MS子程序
;   入口参数：DelayTimes_100MS，延时多少个100MS
;---------------
Delay100MS:
	MOV R7, DelayTimes_100MS

Delay100MS_1:	MOV R6,#10
Delay100MS_2:   MOV R5,#150
Delay100MS_3:   MOV R4,#200
Delay100MS_4:   DJNZ R4,Delay100MS_4
				DJNZ R5,Delay100MS_3
				DJNZ R6,Delay100MS_2
				DJNZ R7,Delay100MS_1
RET   ;子程序返回

;---------------
;跑马灯子程序
;---------------
LEDRUN:
	CPL LED1
	SETB BEEP
	MOV DelayTimes_100MS,#10  ;设置需要延时多少个100MS
	LCALL Delay100MS          ;调用延时100MS子程序

	CPL LED2
	CLR  BEEP
	MOV DelayTimes_100MS,#10  ;设置需要延时多少个100MS
	LCALL Delay100MS          ;调用延时100MS子程序

	CPL LED3
	SETB BEEP
	MOV DelayTimes_100MS,#10  ;设置需要延时多少个100MS
	LCALL Delay100MS          ;调用延时100MS子程序

	CPL LED4
	CLR  BEEP
	MOV DelayTimes_100MS,#10  ;设置需要延时多少个100MS
	LCALL Delay100MS          ;调用延时100MS子程序
RET

END ;汇编程序结束
