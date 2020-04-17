#int i= 0, j = 3, r;
#i++; j--
# j = -j;
#r = i-j; 


.data
i: .long 0
j: .long 3

.bss
.comm r,4,4

.text #code segment
.global main

main: 
	incl i #i++
	decl j #j--
	negl j # j = -j
	
	movl i, %eax #i->eax
	subl j, %eax #i-j->eax
	
	movl %eax, r #i-j->r
	
#LINUX EXIT
#movl $0 , %ebx #return 0
movl r, %ebx #return r (lowest byte)
movl $1, %eax
int $0x80


