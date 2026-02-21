
%ifndef PRINT_R
%define PRINT_R

%include "print_ah.inc"
%include "print_al.inc"
%include "print_ax.inc"

; PUBLIC API
global print_ah
global print_al
global print_ax

%endif

%define NO_TEST

%ifndef NO_TEST

section .text
    global _start

    exit:
        mov rax, 60         ; rax = id of the syscall = exit syscall
        xor rdi, rdi        ; arg1 = rdi = exit status, setting to 0
        syscall

    _start:

        ; mov ah, 0hFF
        ; call print_ah
    
        ; mov al, 0h0F
        ; call print_al
    
        mov ax, 0hFF00
        call print_ax

        jmp exit

%endif
