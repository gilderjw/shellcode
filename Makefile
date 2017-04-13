
CC_FLAGS = -masm=intel -m32 -c
CC = gcc
LD_FLAGS = -m32

.PHONY: get_chars

all: odfhex shellcode print elf get_chars

odfhex: 
	g++ odfhex.cpp -o odfhex

shellcode: shellcode.s
	$(CC) $(CC_FLAGS) shellcode.s -o shellcode.o

print: 
	objdump -d shellcode.o -M intel | tee shellcode.dump

elf:
	gcc shellcode.o -m32 -o shellcode

get_chars:
	./odfhex shellcode.dump

clean:
	rm shellcode.o shellcode shellcode.dump 
