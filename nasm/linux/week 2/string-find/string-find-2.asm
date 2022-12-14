; TRAN LONG VU
; STRING FINDER

; COMPILED WITH NASM + LD LINKER
; RUN ON UBUNTU LINUX.
; NOTE: ITERATION COMPLETE
; MISSING RECORDING FUNCTION.
;
; NOTE: FIX THE input function. infinite outputs
; weakness: if sub is end of substring, it is not counted.
%include "functions.asm"



SECTION .data
msg1        db      'motherstring?: ', 0h      ; message string asking user for input
msg2        db      'Substring?: ', 0h                       ; message string to use after user has entered their name
msg3        db      'found' , 0h 
space       db      ' '
SECTION .bss
    bigstring      resb    30
    substring         resb    12
    buffer resb 64
          ;size of position array
    position         resb 64
    
SECTION .text
global  _start
 
_start:
 
    ; message
    mov rax, msg1
    call sprint

    ; call input string
    mov rax , bigstring
    call sinput

    
    
 
    ; message2
    mov rax, msg2
    call sprint
    
    ; call input sub string
    mov rax , substring
    call sinput

    call _compareLoop
    ; compare here. 
    

    ; print count

    mov rax, r12 ; integer
    call itoa
    mov rax, buffer
    call sprintLF
    
    mov rax, position
    call sprintLF



    call  quit
    _compareLoop:
        .init:
        push rbx
        push rsi
        push rdi
        push r10
        push r11
        xor r12,r12 ; count

        mov rdi, substring
        mov rsi, bigstring
        mov r10,0 ; sub index
        mov r11,0 ; str index
        
        
        .bigLoop:
            mov r15b, byte [rdi+r10]; sub
            mov r14b, byte [rsi+r11]; big

            cmp r14b, 0xa; check null bigstring
            je .done ; end  
            ;if not, enter subLoop              
            .subLoop:
                cmp r15b, 0xa; if sub ends NULL, record
                je .record
                ; if not NULL? compare               

                cmp r15b, r14b; if [byte]: sub = big. 
                je .bothNext ; if equal:   
                ; if not equal
                jmp .resetSub
                jmp .bigNext 
            .record:
                ; record pos +count             
                ; .resetSub ; reset Sub
                ; record count  in R12.
                
                ; record position in: R13. (bigstring)
                push rax
                push rbx

                
                mov rax, r11
                add al, '0' ; convert to ascii itoa
                mov byte [position+r12], al ; buffer of pos
                


                pop rbx
                pop rax               
                inc r12
                jmp .resetSub
                
                
            .bigNext:
                inc r11
                jmp .bigLoop
                
            .bothNext:
                inc r11
                inc r10
                jmp .bigLoop
                
            .resetSub:
                xor r10, r10; sub[0]
                jmp .bigNext
                
            .done:
            

            pop r11
            pop r10
            pop rdi
            pop rsi
            pop rbx
            ret
    
                

            

            


    
