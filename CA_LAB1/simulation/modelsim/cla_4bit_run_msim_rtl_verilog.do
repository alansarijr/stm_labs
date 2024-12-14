transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/CSE/STM/Projects/CA_LAB1 {D:/CSE/STM/Projects/CA_LAB1/cla_4bit.v}
vlog -vlog01compat -work work +incdir+D:/CSE/STM/Projects/CA_LAB1 {D:/CSE/STM/Projects/CA_LAB1/cla_16bit.v}
vlog -vlog01compat -work work +incdir+D:/CSE/STM/Projects/CA_LAB1 {D:/CSE/STM/Projects/CA_LAB1/cla_64bit.v}

