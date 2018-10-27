LED1 BIT P2.4	;��P2.4��αָ������ΪLED1
LED2 BIT P2.5	;��P2.5��αָ������ΪLED2
LED3 BIT P2.6	;��P2.6��αָ������ΪLED3
LED4 BIT P2.7	;��P2.7��αָ������ΪLED4

KEY1 BIT P3.2	;��P3.2��αָ������ΪKEY1

KEY1_State EQU 69H		;����ַ69H��αָ������ΪKEY1_State

DelayTimes_2MS EQU 6FH	;����ַ6FH��αָ������ΪDelayTimes_100MS

;*************************************
;--������ʼ--
ORG 0000H	;������ʼ��ַ�����򽫴Ӵ˴���ʼ����
LJMP START	;����ת����ת����š�START����

ORG 0100H	;����START�����ַ
START:
	MOV SP,#70H	;���ö�ջ����ջ�ռ��70H��7FH����16���ֽ�
	SETB LED1	;Ϩ��LED1
	SETB LED2	;Ϩ��LED2
	SETB LED3	;Ϩ��LED3
	SETB LED4	;Ϩ��LED4

	LJMP START1	;����ת����ת����š�START1����

START1:
	LCALL SCANKEY	;����SCANKEY����

	LJMP START1	;����ת����ת����š�START1����


;**************************************
;����Ϊ��ʱ����
;
Delay2Ms:
	MOV R7,DelayTimes_2MS

	Delay2Ms_1:  MOV R6,#30
	Delay2Ms_2:  MOV R5,#200
	Delay2Ms_3:  DJNZ R5,Delay2Ms_3
					DJNZ R6,Delay2Ms_2
					DJNZ R7,Delay2Ms_1
RET	;�Ӻ�������

;-------------------
;ɨ�谴������
;-------------------
SCANKEY:
	JB KEY1, UP
	DOWN:
		MOV DelayTimes_2MS,#1
		LCALL Delay2Ms	;��ʱ2ms������ȥ��
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
			LCALL LEDRUN	;����LEDRUN����
	UP:
		RET

LEDRUN:
	MOV A, KEY1_State	;ɢת���
	RL A
	ADD A, KEY1_State
	MOV DPTR, #KEY1_Flash
	JMP @A+DPTR
	KEY1_Flash:
		LJMP KEY1_Flash0	;����ת����ת����š�KEY1_Flash0����
		LJMP KEY1_Flash1	;����ת����ת����š�KEY1_Flash1����
		LJMP KEY1_Flash2	;����ת����ת����š�KEY1_Flash2����
		LJMP KEY1_Flash3	;����ת����ת����š�KEY1_Flash3����
		LJMP KEY1_Flash4	;����ת����ת����š�KEY1_Flash4����
	RET

	KEY1_Flash0:
		CLR LED1	;LED1��ȫ��
		CLR LED2
		CLR LED3
		CLR LED4
		RET
    KEY1_Flash1:
		SETB LED1	;LED1��
		CLR  LED2	;LED2��
		CLR  LED3	;LED3��
		CLR  LED4	;LED4��
		RET
	KEY1_Flash2:
		SETB LED1	;LED1��
		SETB LED2	;LED2��
		CLR  LED3	;LED3��
		CLR  LED4	;LED4��
		RET
	KEY1_Flash3:
		SETB LED1	;LED1��
		SETB LED2	;LED2��
		SETB LED3	;LED3��
		CLR  LED4	;LED4��
		RET
	KEY1_Flash4:
		SETB LED1	;LED1��ȫ��
		SETB LED2
		SETB LED3
		SETB LED4
		RET
END
