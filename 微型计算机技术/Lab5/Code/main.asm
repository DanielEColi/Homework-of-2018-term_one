KEY1 BIT P3.2		;将P3.2用伪指令命名为KEY1
KEY1_State EQU 69H	;将地址69H用伪指令命名为KEY1_State
DelayTimes_100MS EQU 6FH	;将地址6FH用伪指令命名为DelayTimes_100MS

;*************************************
;--主程序开始--

ORG 0000H	;定义起始地址，程序将从此处开始运行
LJMP START	;长跳转，跳转到标号“START”处

ORG 0100H	;定义START程序地址
START:
	MOV SP,#70H		;设置堆栈，堆栈空间从70H到7FH，共16个字节
	MOV P0,#0FFH	;熄灭数码管
	SETB P2.0		;点亮第一个数码管
	SETB P2.1
	SETB P2.2
	CLR  P2.3
START1:
	JNB KEY1,RUN1	;当KEY1被按下时，跳转到RUN1
	LJMP START1		;长跳转，跳转到标号“START1”处

;**************************************
;以下为延时函数
;
Delay100Ms:
	MOV R7,DelayTimes_100MS

	Delay100Ms_1:  MOV R6,#30
	Delay100Ms_2:  MOV R5,#200
	Delay100Ms_3:  DJNZ R5,Delay100Ms_3
					DJNZ R6,Delay100Ms_2
					DJNZ R7,Delay100Ms_1
RET

RUN1:
	JNB KEY1,RUN2	;KEY1被按下，跳到RUN2
	MOV KEY1_State,#00H	;否则将KEY1_State赋值为0
	MOV P0,#0FFH	;熄灭数码管
	LJMP RUN1		;长跳转，跳转到标号“RUN1”处

RUN2:
	MOV A,KEY1_State	;将KEY1_State的值传到A中
	CLR C				;C寄存器清零
	SUBB A,#10			;比较A是否大于或等于10
	JNC OVER			;如果大于或等于10，跳转到OVER处
	MOV A,KEY1_State	;再次将将KEY1_State的值传到A中
	INC KEY1_State		;递增KEY1_State的值
	MOV DPTR,#TAB		;DPTR指针指向TAB
	MOVC A,@A+DPTR		;取出相应的需要显示的数码管编码
	MOV P0,A			;使数码管显示数字
	MOV DelayTimes_100MS,#200	;延时
	LCALL Delay100MS
	JMP RUN1			;跳转到RUN1处

OVER:
	MOV KEY1_State,#00H	;重置KEY1_State的值
	MOV P0,#0FFH		;熄灭数码管
	JMP START1			;跳转到START1处
;数码管的编码
TAB:
	DB 0x03,0x9f,0x25,0x0d,0x99,0x49,0x41,0x1f,0x01,0x09
END