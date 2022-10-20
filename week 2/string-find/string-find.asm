; STRING FINDER

; COMPILED WITH NASM + LD LINKER
; RUN ON UBUNTU LINUX.
; 1.
; INPUT of 2 strings.
; iterate through  both strings.
; 2.
;init to iterate strings
; iterate loop: 
; INIT
; array in RBP
; reset RAX 0?
; put str1 in rdi
; put str2 in rsi
; mov 16bit 2chars into rdx. 
;
; record POS function
; reserve stack. 8b
; reset rcx
;
; loop in loops. Loop thourugh 
;
;
;
;
;
;


; Example:
; "longcocakaca" & ca
; s1 and s2
; iterate "ca". starts with s2[0]. "c"
; cmp "c" with s1[0]. not match, loop skip.
; until cmp with s1[4]. "c" and "c". Match 
; cmp s2[1] = "a". with s1[5]. s1[curretn + 1]
; cmp "a" with "o". Not match. Skip loop. Back to S2[0]
; till "ca" match "ca". Record count +1 and position: 6.
; Record count +2 and pos: 11.
; check null/end of string
; end loop 
;
;
%include "functions.asm"

SECTION .data
msg1        db      'motherstring?: ', 0h      ; message string asking user for input
msg2        db      'Substring?: ', 0h                       ; message string to use after user has entered their name
msg3        db      'found ', 0h  
msg4        db      'none ', 0h  
SECTION .bss
    string1      resb    104
    string2      resb    12
    arr         resb    100
    size        resd    1 ; dword = 32b
SECTION .text
global  _start
 
_start:
 
    ; message
    mov rax, msg1
    call sprint

    ; call input string1
    mov rax , string1
    call sinput

    
    
 
    ; message
    mov rax, msg2
    call sprint

    ; call input sub string
    mov rax , string2
    call sinput
 
    ; compare here.
    
;    mov rdi, string2 ; ca
;    mov rsi, string1 ; longcakaca
;    call compare

;    cmp rax,9
;    jz  .yes
;    cmp rax,-1
;    jz  .no

;    .yes:
;    mov rax, msg3
;    call sprint
    
;    .no:
;    mov rax, msg4
;    call sprint




    mov     rax, string1    ; move our buffer into eax 
    call    sprint          ; call our print function

    mov     rax, string2     ; move our buffer into eax 
    call    sprint         ; print
 




    call    quit

