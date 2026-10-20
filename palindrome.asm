; Read a word from the keyboard and check if it is a palindrome
; Assembler: emu8086 / MASM

.model small
.stack 100h

.data
    prompt  db 'Enter a word: $'
    yes     db 13, 10, 'Palindrome$'
    no      db 13, 10, 'Not a palindrome$'
    buffer  db 50           ; max characters
            db ?            ; dos stores the length here
            db 50 dup(?)    ; the characters

.code
main proc
    mov ax, @data
    mov ds, ax

    lea dx, prompt
    mov ah, 09h
    int 21h

    lea dx, buffer          ; dos function 0Ah: buffered input
    mov ah, 0Ah
    int 21h

    xor cx, cx
    mov cl, buffer[1]       ; length of the word
    cmp cx, 1
    jbe is_pal              ; 0 or 1 character is a palindrome

    lea si, buffer + 2      ; first character
    mov di, si
    add di, cx
    dec di                  ; last character
    shr cx, 1               ; only need to compare half

compare:
    mov al, [si]
    cmp al, [di]
    jne not_pal
    inc si
    dec di
    loop compare

is_pal:
    lea dx, yes
    jmp print
not_pal:
    lea dx, no
print:
    mov ah, 09h
    int 21h

    mov ah, 4Ch
    int 21h
main endp

end main
