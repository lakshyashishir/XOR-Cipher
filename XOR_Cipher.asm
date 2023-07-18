section .data
    stringInput db 'Enter the string for encryption : '
    stringInputLen equ $-stringInput

    chInput db 'Enter a character for encryption (only first character will be considered) : '
    chInputLen equ $-chInput

    result db 'The encrypted string is : '
    resultLen equ $-result

    newline db 0ah, 10
    newlineLen equ $-newline

section .bss
    string resb 100 
    char resb 1 
    
section .text
    global _start

_start:

    ; Write the input headline
    mov rax, 1
    mov rdi, 1
    mov rsi, stringInput
    mov rdx, stringInputLen
    syscall

    ; Get the string input
    mov rax, 0
    mov rdi, 0
    mov rsi, string
    mov rdx, 100
    syscall

    ; Write the input headline
    mov rax, 1
    mov rdi, 1
    mov rsi, chInput
    mov rdx, chInputLen
    syscall

    ; Get the char input
    mov rax, 0
    mov rdi, 0
    mov rsi, char
    mov rdx, 1
    syscall
    
    mov rsi, string
    mov rdi, char

loop:
    mov al, [rsi]
    xor al, [rdi]
    mov [rsi], al
    inc rsi
    cmp byte [rsi+1], 0
    jne loop

    ; Write the result headline
    mov rax, 1
    mov rdi, 1
    mov rsi, result
    syscall

    ; Write the result
    mov rax, 1
    mov rdi, 1
    mov rdx, rsi
    mov rdx, 100
    syscall

    ; Write a newline
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, newlineLen
    syscall

    ; Exit the program
    mov rax, 60
    xor rdi, rdi
    syscall
