			#include<p18F4550.inc>
loop_cnt1		set 0x01
loop_cnt2		set	0x02

			org	0x00
			goto start
			org 0x08
			retfie
			org 0x18
			retfie
			
showD			bsf PORTD, 0, A
			bsf PORTD, 1, A
			bsf PORTD, 2, A
			bsf PORTD, 3, A
			bsf PORTD, 4, A
			bsf PORTD, 5, A
			return
			
showE			bsf PORTD, 0, A
			bsf PORTD, 3, A
			bsf PORTD, 4, A
			bsf PORTD, 5, A
			bsf PORTD, 6, A
			return
			
show9			bsf	PORTD, 0, A
			bsf PORTD, 1, A
			bsf PORTD, 2, A
			bsf PORTD, 3, A
			bsf PORTD, 5, A
			bsf PORTD, 6, A
			return
			
show6			bsf	PORTD, 0, A
			bsf PORTD, 2, A
			bsf PORTD, 3, A
			bsf PORTD, 4, A
			bsf PORTD, 5, A
			bsf PORTD, 6, A
			return
			
show5			bsf PORTD, 0, A
			bsf PORTD, 2, A
			bsf PORTD, 3, A
			bsf PORTD, 5, A
			bsf PORTD, 6, A
			return
			
show3			bsf PORTD, 0, A
			bsf PORTD, 1, A
			bsf PORTD, 2, A
			bsf PORTD, 3, A
			bsf PORTD, 6, A
			return
			

offLED		clrf	PORTD, A
			return
			
dup_nop		macro	kk
			variable	i
i=0			
			while	i < kk
			nop
i+=1		
			endw
			endm
			
delay33ms		movlw	d'150' ;33sec delay subroutine for
			movwf	loop_cnt2, A ;20MHz
again1		movlw	d'50'
			movwf	loop_cnt1, A
again2		dup_nop	d'22'
			decfsz	loop_cnt1, F, A
			bra again2
			decfsz	loop_cnt2, F, A
			bra again1
			nop 
			return
			
start			CLRF	TRISD, A
			CALL	offLED
			CALL	delay33ms
			CALL	showD
			CALL	delay33ms
			CALL	offLED
			CALL	delay33ms
			CALL	showE
			CALL	delay33ms
			CALL	offLED
			CALL	delay33ms
			CALL	show9
			CALL	delay33ms
			CALL	offLED
			CALL	delay33ms
			CALL	show6
			CALL	delay33ms
			CALL	offLED
			CALL	delay33ms
			CALL	show5
			CALL	delay33ms
			CALL	offLED
			CALL	delay33ms
			CALL	show3
			CALL	delay33ms
			CALL	offLED
			CALL	delay33ms
			CALL	show3
			CALL	delay33ms
			BRA 	start
			
			END
			
			