
%ifndef PRINT_AX
%define PRINT_AX

%include "push_ax.inc"
%include "shared.inc"

section .text
    print_ax:
        call push_ax
        call print_r
        ret

%endif
