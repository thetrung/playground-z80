CC=z80asm
default: build view

build: hello system

view:
	ls -lh *.bin

hello: hello.asm
	${CC} hello.asm -o hello.bin

system: system.asm
	${CC} system.asm -o system.bin

clean:
	rm -rf *.bin

