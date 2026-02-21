
%ifndef PRINT_AL
%define PRINT_AL

%include "push_al.inc"
%include "shared.inc"

section .text
    print_al:
        call push_al
        call print_r
        ret

%endif
