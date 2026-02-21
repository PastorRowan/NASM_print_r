
%ifndef PRINT_R
%define PRINT_R

%include "print_rax_routines.asm"

; PUBLIC API
global print_ah
global print_al
global print_ax
global print_eax
global print_rax

%endif



%define NO_TEST

%ifndef NO_TEST
%define NO_TEST

section .rodata
    tab_space_char db 9

section .text
    global _start

    print_tab_space:
        mov rax, 1
        mov rdi, 1
        mov rsi, tab_space_char
        mov rdx, 1
        syscall
        ret

    _start:

        mov ah, 0h12
        call print_ah

        call print_tab_space
    
        mov al, 0h12
        call print_al

        call print_tab_space

        mov ax, 0h1234
        call print_ax

        call print_tab_space

        mov eax, 0h12345678
        call print_eax

        call print_tab_space

        mov rax, 0h0123456789ABCDEF
        call print_rax

        ; exit gracefully
        mov rax, 60         ; rax = id of the syscall = exit syscall
        xor rdi, rdi        ; arg1 = rdi = exit status, setting to 0
        syscall

%endif
