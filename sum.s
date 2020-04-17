#r = a+b

.data#initialized global data
a: .long 2
b: .long 3

.bss #uniniatilized global data
.comm r,4,4 #int r
#4,4 ->ya que es long

.text #code segment
.global main #so the OS can call the main

main:
	movl a, %eax  #a->eax
	addl b, %eax #b +eax ->eax
	movl %eax, r #eax ->r
	
#LINUX EXIT
#movl $0 , %ebx #return 0
movl r, %ebx #return r (lowest byte)
movl $1, %eax
int $0x80
