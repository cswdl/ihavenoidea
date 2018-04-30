; you should declare this function as :
; extern void entering_v86(uint32_t ss, uint32_t esp, uint32_t cs, uint32_t eip);
global entering_v86

entering_v86:
   mov ebp, esp               ; save stack pointer

   push dword  [ebp+4]        ; ss
   push dword  [ebp+8]        ; esp
   pushfd                     ; eflags
   or dword [esp], (1 << 17)  ; set VM flags
   push dword [ebp+12]        ; cs
   push dword  [ebp+16]       ; eip
   iret
