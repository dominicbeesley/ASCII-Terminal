create_clock -name clk27 -period 37.037 -waveform {0 18.518} [get_ports {clk27}] -add

create_generated_clock -name clk100 -source [get_ports {clk27}] -master_clock clk27 -divide_by 27 -multiply_by 100 [get_nets {clk100}]
create_generated_clock -name clk50 -source [get_nets {clk27}] -master_clock clk27 -divide_by 27 -multiply_by 50 [get_nets {clk50}]

set_operating_conditions -grade c -model fast -speed 6 -setup


set_multicycle_path -from [get_pins { U5/*/* }] -to [get_pins { U5/*/* }] -setup -end 16
set_multicycle_path -from [get_pins { U5/*/* }] -to [get_pins { U5/*/* }] -hold -end 15

