vlib work

vlog gray_counter.sv
vlog tb_counter.sv

vsim -voptargs=+acc work.tb_gray_counter -l sim_log.txt

add wave -r *

run -all