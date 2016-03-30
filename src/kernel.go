package kernel

import "terminal"

/*
 * i686-elf-gccgo -static -Werror -nostdlib -nostartfiles -nodefaultlibs -c kernel.go -o kernel.go.o
 */

func Main() {
	terminal.Init()
	terminal.Color = terminal.MakeColor(terminal.White, terminal.Black)
	terminal.Clear()

	terminal.Row = 0
	terminal.Column = 0

	terminal.Print("Hello, Kernel World!\n")
}
