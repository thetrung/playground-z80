CC=z80asm
default: build view

build: hello system out_char hello_rev4

view:
	ls -lh *.bin

hello: hello.asm
	${CC} hello.asm -o=hello.bin

system: system.asm
	${CC} system.asm -o=system.bin

out_char: out_char.asm
	${CC} out_char.asm -o=out_char.bin

hello_rev4: hello_rev4.asm
	${CC} hello_rev4.asm -o=hello_rev4.bin

clean:
	rm -rf *.bin

