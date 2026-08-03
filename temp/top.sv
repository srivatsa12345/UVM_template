`include "package.sv"
`include "interface.sv"
module top;
	import uvm_pkg::*;
	import pkg::*;
	
	bit clk,rst;
	always #5 clk=~clk;

	my_if vif(.clk(clk),.rst(rst));
	
	initial begin
		uvm_config_db#(virtual my_if.DRV)::set(null,"uvm_test_top.env.a_ag.drv","vif.drv",vif.DRV);
		uvm_config_db#(virtual my_if.IN_MON)::set(null,"uvm_test_top.env.a_ag.in_mon","vif.in_mon",vif.IN_MON);
		uvm_config_db#(virtual my_if.OUT_MON)::set(null,"uvm_test_top.env.p_ag.out_mon","vif.out_mon",vif.OUT_MON);
		run_test("test");
	end
endmodule
