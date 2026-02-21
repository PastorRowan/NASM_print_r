
%ifndef PUSH_AH
%define PUSH_AH

%include "shared.inc"

section .text
    push_ah:

        ; High nibble
        mov bl, 0xF0
        and bl, ah                                          ; mask high bits
        shr bl, 4
        movzx rcx, bl
        mov bl, byte [hex_chars + rcx]                           ; get ASCII character
        movzx rcx, byte [print_r_len]
        mov byte [print_r_buffer + rcx], bl            ; store first hex digit
        inc byte [print_r_len]

        ; Low nibble
        mov bl, 0x0F
        and bl, ah                                  ; mask high bits
        movzx rcx, bl
        mov bl, byte [hex_chars + rcx]              ; get ASCII character
        movzx rcx, byte [print_r_len]
        mov byte [print_r_buffer + rcx], bl      ; store first hex digit
        inc byte [print_r_len]

        ret

%endif
