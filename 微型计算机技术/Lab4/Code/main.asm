LED1 BIT P2.4	;将P2.4用伪指令命名为LED1
LED2 BIT P2.5	;将P2.5用伪指令命名为LED2
LED3 BIT P2.6	;将P2.6用伪指令命名为LED3
LED4 BIT P2.7	;将P2.7用伪指令命名为LED4

KEY1 BIT P3.2	;将P3.2用伪指令命名为KEY1

KEY1_State EQU 69H		;将地址69H用伪指令命名为KEY1_State

DelayTimes_2MS EQU 6FH	;将地址6FH用伪指令命名为DelayTimes_100MS

;*************************************
;--主程序开始--
ORG 0000H	;定义起始地址，程序将从此处开始运行
LJMP START	;长跳转，跳转到标号“START”处

ORG 0100H	;定义START程序地址
START:
	MOV SP,#70H	;设置堆栈，堆栈空间从70H到7FH，共16个字节
	SETB LED1	;熄灭LED1
	SETB LED2	;熄灭LED2
	SETB LED3	;熄灭LED3
	SETB LED4	;熄灭LED4

	LJMP START1	;长跳转，跳转到标号“START1”处

START1:
	LCALL SCANKEY	;调用SCANKEY函数

	LJMP START1	;长跳转，跳转到标号“START1”处


;**************************************
;以下为延时函数
;
Delay2Ms:
	MOV R7,DelayTimes_2MS

	Delay2Ms_1:  MOV R6,#30
	Delay2Ms_2:  MOV R5,#200
	Delay2Ms_3:  DJNZ R5,Delay2Ms_3
					DJNZ R6,Delay2Ms_2
					DJNZ R7,Delay2Ms_1
RET	;子函数返回

;-------------------
;扫描按键函数
;-------------------
SCANKEY:
	JB KEY1, UP
	DOWN:
		MOV DelayTimes_2MS,#1
		LCALL Delay2Ms	;延时2ms，按键去抖
		JB KEY1, PRESS
			JMP DOWN
		PRESS:
			MOV A, KEY1_State
			ADD A, #1
			MOV KEY1_State, A
			CLR C
			SUBB A, #4
			JB CY, NORESET
				MOV KEY1_State, #0
			NORESET:
				MOV A, #0
			LCALL LEDRUN	;调用LEDRUN函数
	UP:
		RET

LEDRUN:
	MOV A, KEY1_State	;散转语句
	RL A
	ADD A, KEY1_State
	MOV DPTR, #KEY1_Flash
	JMP @A+DPTR
	KEY1_Flash:
		LJMP KEY1_Flash0	;长跳转，跳转到标号“KEY1_Flash0”处
		LJMP KEY1_Flash1	;长跳转，跳转到标号“KEY1_Flash1”处
		LJMP KEY1_Flash2	;长跳转，跳转到标号“KEY1_Flash2”处
		LJMP KEY1_Flash3	;长跳转，跳转到标号“KEY1_Flash3”处
		LJMP KEY1_Flash4	;长跳转，跳转到标号“KEY1_Flash4”处
	RET

	KEY1_Flash0:
		CLR LED1	;LED1灯全亮
		CLR LED2
		CLR LED3
		CLR LED4
		RET
    KEY1_Flash1:
		SETB LED1	;LED1灭
		CLR  LED2	;LED2亮
		CLR  LED3	;LED3亮
		CLR  LED4	;LED4亮
		RET
	KEY1_Flash2:
		SETB LED1	;LED1灭
		SETB LED2	;LED2灭
		CLR  LED3	;LED3亮
		CLR  LED4	;LED4亮
		RET
	KEY1_Flash3:
		SETB LED1	;LED1灭
		SETB LED2	;LED2灭
		SETB LED3	;LED3灭
		CLR  LED4	;LED4亮
		RET
	KEY1_Flash4:
		SETB LED1	;LED1灯全灭
		SETB LED2
		SETB LED3
		SETB LED4
		RET
END
