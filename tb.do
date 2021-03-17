#Cria biblioteca do projeto
vlib work

#compila projeto: todos os aquivo. Ordem é importante
vcom proc_func.vhd testbench.vhd

#Simula (work é o diretorio, testbench é o nome da entity)
vsim -t ns work.testbench

#Mostra forma de onda
view wave

#Adiciona ondas espec�ficas
# -radix: binary, hex, dec
# -label: nome da forma de onda

add wave    -height 15 -divider Inteiros
add wave    -radix dec -label a /a
add wave    -radix dec -label b /b
add wave    -radix dec -label c /c
add wave    -radix dec -label d /d
add wave    -radix dec -label e /e
add wave    -radix dec -label f /f
add wave    -radix dec -label g /g
add wave    -radix dec -label h /h

add wave    -radix dec -height 15 -divider Sa�da
add wave    -radix dec -label ave /ave
add wave    -radix dec -label max /max
add wave    -radix dec -label min /min
add wave    -radix dec -label dividendo /dividendo
add wave    -radix dec -label divisor /divisor
add wave    -radix dec -label res /res
add wave    -radix dec -label tipo /tipo

#Simula at� um 500ns
run 100ns

wave zoomfull
write wave wave.ps
