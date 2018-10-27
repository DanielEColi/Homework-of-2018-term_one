KEY1 BIT P3.2		;��P3.2��αָ������ΪKEY1
KEY1_State EQU 69H	;����ַ69H��αָ������ΪKEY1_State
DelayTimes_100MS EQU 6FH	;����ַ6FH��αָ������ΪDelayTimes_100MS

;*************************************
;--������ʼ--

ORG 0000H	;������ʼ��ַ�����򽫴Ӵ˴���ʼ����
LJMP START	;����ת����ת����š�START����

ORG 0100H	;����START�����ַ
START:
	MOV SP,#70H		;���ö�ջ����ջ�ռ��70H��7FH����16���ֽ�
	MOV P0,#0FFH	;Ϩ�������
	SETB P2.0		;������һ�������
	SETB P2.1
	SETB P2.2
	CLR  P2.3
START1:
	JNB KEY1,RUN1	;��KEY1������ʱ����ת��RUN1
	LJMP START1		;����ת����ת����š�START1����

;**************************************
;����Ϊ��ʱ����
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
	JNB KEY1,RUN2	;KEY1�����£�����RUN2
	MOV KEY1_State,#00H	;����KEY1_State��ֵΪ0
	MOV P0,#0FFH	;Ϩ�������
	LJMP RUN1		;����ת����ת����š�RUN1����

RUN2:
	MOV A,KEY1_State	;��KEY1_State��ֵ����A��
	CLR C				;C�Ĵ�������
	SUBB A,#10			;�Ƚ�A�Ƿ���ڻ����10
	JNC OVER			;������ڻ����10����ת��OVER��
	MOV A,KEY1_State	;�ٴν���KEY1_State��ֵ����A��
	INC KEY1_State		;����KEY1_State��ֵ
	MOV DPTR,#TAB		;DPTRָ��ָ��TAB
	MOVC A,@A+DPTR		;ȡ����Ӧ����Ҫ��ʾ������ܱ���
	MOV P0,A			;ʹ�������ʾ����
	MOV DelayTimes_100MS,#200	;��ʱ
	LCALL Delay100MS
	JMP RUN1			;��ת��RUN1��

OVER:
	MOV KEY1_State,#00H	;����KEY1_State��ֵ
	MOV P0,#0FFH		;Ϩ�������
	JMP START1			;��ת��START1��
;����ܵı���
TAB:
	DB 0x03,0x9f,0x25,0x0d,0x99,0x49,0x41,0x1f,0x01,0x09
END