package kernel

import "terminal"

func Main() {
	terminal.Init()
	terminal.Color = terminal.MakeColor(terminal.White, terminal.Black)
	terminal.Clear()

	terminal.Row = 0
	terminal.Column = 0

	terminal.Print("Hello, Kernel World!\n")
}
