.global startUnrealMode
.intel_syntax noprefix
startUnrealMode:   
    
startUnrealMode:   
   xor ax, ax 
   mov  cr0, eax
   jmp 0x8:pmode
pmode:
   mov  bx, 0x10          ; select descriptor 2, instead of 1
   mov  ds, bx            ; 10h = 10000b
 
   and al,0xFE            ; back to realmode
   mov  cr0, eax          ; by toggling bit again
