
%ifndef PRINT_AH
%define PRINT_AH

%include "push_ah.inc"
%include "shared.inc"

section .text
    print_ah:
        call push_ah
        call print_r
        ret

%endif
