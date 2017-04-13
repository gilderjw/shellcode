.section .text
.intel_syntax noprefix
.global main

main:
    mov  edx,0x08080808         # not length of string yet, need to shift
    shr edx, 24                 # edx = 8
    
    push 0x21535345             # ESS!
    push 0x43435553             # SUCC
    mov ecx,esp
    
    mov ebx,0x01010101          # use stdio as file descriptor
    shr ebx, 24                 # ebx = 1

    mov eax,0x04040404          # fwrite system call
    shr eax, 24                 # eax = 4

    int 0x80                    # call kernel

    mov eax, 0x01010101         # exit system call
    shr eax, 24                 # eax = 3

    int 0x80
