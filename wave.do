onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Top_tb/i1/MyPC/CLK
add wave -noupdate /Top_tb/i1/MyPC/START
add wave -noupdate /Top_tb/i1/MyPC/HALT
add wave -noupdate /Top_tb/i1/MyPC/Branch
add wave -noupdate /Top_tb/i1/MyPC/Zero
add wave -noupdate /Top_tb/i1/MyPC/AbsoluteAddr
add wave -noupdate -radix decimal /Top_tb/i1/MyPC/PC
add wave -noupdate /Top_tb/i1/MyCtr/opcode
add wave -noupdate -radix decimal {/Top_tb/i1/MyRegFile/RF[14]}
add wave -noupdate -color Pink {/Top_tb/i1/MyRegFile/RF[13]}
add wave -noupdate -radix decimal {/Top_tb/i1/MyRegFile/RF[0]}
add wave -noupdate -radix unsigned {/Top_tb/i1/MyRegFile/RF[1]}
add wave -noupdate -childformat {{{/Top_tb/i1/MyRegFile/RF[0]} -radix decimal} {{/Top_tb/i1/MyRegFile/RF[1]} -radix decimal}} -subitemconfig {{/Top_tb/i1/MyRegFile/RF[0]} {-height 15 -radix decimal} {/Top_tb/i1/MyRegFile/RF[1]} {-height 15 -radix decimal}} /Top_tb/i1/MyRegFile/RF
add wave -noupdate /Top_tb/i1/MyDataMem/MyMemory
add wave -noupdate /Top_tb/i1/MyPC/PROG_STATE
add wave -noupdate /Top_tb/i1/MyPC/NEXT_PROG_STATE
add wave -noupdate /Top_tb/i1/MyRegFile/CLK
add wave -noupdate /Top_tb/i1/MyRegFile/ReadAddr
add wave -noupdate /Top_tb/i1/MyRegFile/RegWriteAddr
add wave -noupdate /Top_tb/i1/MyRegFile/ReadRegEn
add wave -noupdate /Top_tb/i1/MyRegFile/WriteRegEn
add wave -noupdate /Top_tb/i1/MyRegFile/WriteACCEn
add wave -noupdate /Top_tb/i1/MyRegFile/ACCWrite
add wave -noupdate /Top_tb/i1/MyRegFile/ACCRead
add wave -noupdate /Top_tb/i1/MyRegFile/ReadDataOut
add wave -noupdate /Top_tb/i1/MyALU/ALUOp
add wave -noupdate /Top_tb/i1/MyALU/A
add wave -noupdate /Top_tb/i1/MyALU/B
add wave -noupdate /Top_tb/i1/MyALU/Result
add wave -noupdate /Top_tb/i1/MyALU/Zero
add wave -noupdate /Top_tb/i1/MyDataMem/CLK
add wave -noupdate /Top_tb/i1/MyDataMem/DataAddress
add wave -noupdate /Top_tb/i1/MyDataMem/MemStatus
add wave -noupdate /Top_tb/i1/MyDataMem/DataIn
add wave -noupdate /Top_tb/i1/MyDataMem/DataOut
add wave -noupdate /Top_tb/i1/MyCtr/Instr
add wave -noupdate /Top_tb/i1/MyCtr/ReadRegEn
add wave -noupdate /Top_tb/i1/MyCtr/WriteRegEn
add wave -noupdate /Top_tb/i1/MyCtr/WriteACCEn
add wave -noupdate /Top_tb/i1/MyCtr/Branch
add wave -noupdate /Top_tb/i1/MyCtr/ALUOp
add wave -noupdate /Top_tb/i1/MyCtr/ALUSrcA
add wave -noupdate /Top_tb/i1/MyCtr/ALUSrcB
add wave -noupdate /Top_tb/i1/MyCtr/MemStatus
add wave -noupdate /Top_tb/i1/MyCtr/MemToReg
add wave -noupdate /Top_tb/i1/MyCtr/HALT
add wave -noupdate /Top_tb/i1/MyCtr/flag
add wave -noupdate /Top_tb/i1/MyLUTPC/ReadData
add wave -noupdate /Top_tb/i1/MyLUTPC/PCAddr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4104025 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 297
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {4725 ns}
