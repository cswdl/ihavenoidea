.global startUnrealMode
.intel_syntax noprefix
startUnrealMode:   
    
startUnrealMode:   
   xor ax, ax 
   mov  cr0, eax
   jmp 0x8:pmode
pmode:
   mov  bx, 0x10 
   mov  ds, bx
   and al,0xFE
   mov  cr0, eax
