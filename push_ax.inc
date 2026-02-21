
%ifndef PUSH_AX
%define PUSH_AX

%include "push_ah.inc"
%include "push_al.inc"

section .text
    push_ax:
        call push_ah
        call push_al
        ret

%endif
