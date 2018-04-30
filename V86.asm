.intel_syntax noprefix

global entering_v86

entering_v86:
   mov ebp, esp               
   push dword  [ebp+4]        
   push dword  [ebp+8]        
   pushfd 
   or dword [esp], (1 << 17) 
   push dword [ebp+12] 
   push dword  [ebp+16]
   iret
