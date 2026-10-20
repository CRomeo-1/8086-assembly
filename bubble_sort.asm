; Bubble sort an array of bytes in ascending order, then print it
; Assembler: emu8086 / MASM

.model small
.stack 100h

.data
    arr     db 9, 4, 7, 1, 8, 2, 6, 3, 5, 0
    len     equ 10
    msg1    db 'Before: $'
    msg2    db 13, 10, 'After:  $'

.code
main proc
    mov ax, @data
    mov ds, ax

    lea dx, msg1
    call print_str
    call print_array

    ; ---- bubble sort ----
    mov cx, len - 1         ; outer loop: n-1 passes
outer:
    push cx
    lea si, arr
inner:
    mov al, [si]
    cmp al, [si+1]
    jbe no_swap             ; already in order
    xchg al, [si+1]         ; swap the two elements
    mov [si], al
no_swap:
    inc si
    loop inner
    pop cx
    loop outer

    lea dx, msg2
    call print_str
    call print_array

    mov ah, 4Ch             ; exit to DOS
    int 21h
main endp

; prints the string at DS:DX (ends with $)
print_str proc
    mov ah, 09h
    int 21h
    ret
print_str endp

; prints every element of arr as a digit followed by a space
print_array proc
    lea si, arr
    mov cx, len
next:
    mov dl, [si]
    add dl, '0'             ; number -> ascii
    mov ah, 02h
    int 21h
    mov dl, ' '
    int 21h
    inc si
    loop next
    ret
print_array endp

end main
