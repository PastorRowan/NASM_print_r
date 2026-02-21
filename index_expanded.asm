%line 5+1 shared.inc
[section .data]
 hex_chars db "0123456789ABCDEF"
 print_r_buffer db '0', 'x', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
 print_r_len db 2
 print_r_capacity equ 18

[section .text]
 print_r:
 mov rax, 1
 mov rdi, 1
 mov rsi, print_r_buffer
 movzx rdx, byte [print_r_len]
 syscall
 mov byte [print_r_len], 2
 ret

%line 7+1 push_ah.inc
[section .text]
 push_ah:


 mov bl, 0xF0
 and bl, ah
 shr bl, 4
 movzx rcx, bl
 mov bl, byte [hex_chars + rcx]
 movzx rcx, byte [print_r_len]
 mov byte [print_r_buffer + rcx], bl
 inc byte [print_r_len]


 mov bl, 0x0F
 and bl, ah
 movzx rcx, bl
 mov bl, byte [hex_chars + rcx]
 movzx rcx, byte [print_r_len]
 mov byte [print_r_buffer + rcx], bl
 inc byte [print_r_len]

 ret

%line 8+1 print_ah.inc
[section .text]
 print_ah:
 call push_ah
 call print_r
 ret

%line 8+1 push_ax.inc
[section .text]
 push_ax:
 call push_ah
 call push_al
 ret

%line 8+1 push_al.inc
[section .text]
 push_al:


 mov bl, 0xF0
 and bl, al
 shr bl, 4
 movzx rcx, bl
 mov bl, byte [hex_chars + rcx]
 movzx rcx, byte [print_r_len]
 mov byte [print_r_buffer + rcx], bl
 inc byte [print_r_len]


 mov bl, 0x0F
 and bl, al
 movzx rcx, bl
 mov bl, byte [hex_chars + rcx]
 movzx rcx, byte [print_r_len]
 mov byte [print_r_buffer + rcx], bl
 inc byte [print_r_len]

 ret

%line 8+1 print_al.inc
[section .text]
 print_al:
 call push_al
 call print_r
 ret

%line 8+1 print_ax.inc
[section .text]
 print_ax:
 call push_ax
 call print_r
 ret

%line 10+1 index.asm
[global print_ah]
[global print_al]
[global print_ax]







