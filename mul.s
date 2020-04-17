#ejercicio de la pagina 32
#==Equivalencia en C ======
# #define N 10
#int i = 2, j= 3, k=6, r;
#r =(i+j) * (k+ (-2)) + N;
#r = (5)*(4) + 10 = 30

N=10 #define N 10

.data 
i: .long 2 #int i = 2
j: .long 3 #int j = 3
k: .long 6 #int k = 6

.bss  #uninitialized global data
.comm r,4,4 #variable de 4 bytes(long) alineada a 4 bytes-->int r;

.text #code segment
.global main #so the OS call main

main: #main(){
	movl i, %eax #i->eax
	addl j, %eax #i+j->eax
	movl %eax, r #i+j->r
	
	movl k, %eax #k->eax
	addl $-2, %eax #k + (-2) ->eax
	imull r, %eax #(i+j) * (k+(-2)) -->eax
	#operando destino de imul ha de ser registro
	addl $N, $eax
	
	movl %eax, r #the result goes to r
    
    #LINUX EXIT
	#movl $0, %ebx #return 0
	movl r, %ebx #return r, its lowest byte
	movl $1, %eax
	int $0x80
