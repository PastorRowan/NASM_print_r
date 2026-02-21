
%ifndef SHARED
%define SHARED

section .data
    hex_chars db "0123456789ABCDEF"
    print_r_buffer db '0', 'x', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    print_r_len db 2
    print_r_capacity equ 18

section .text
    print_r:
        mov rax, 1                  ; rax = syscall.write
        mov rdi, 1                  ; arg1 = rax = file descriptor for syscall = 1 = stdout
        mov rsi, print_r_buffer     ; arg2 = rsi = start of message = first message
        movzx rdx, byte [print_r_len]        ; arg3 = rdx = length of the first message
        syscall
        mov byte [print_r_len], 2
        ret

%endif
