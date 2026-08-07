interface my_if(input logic clk, input logic rst);

	clocking cb_drv@(posedge clk);
		default input #1 output #1;
	endclocking
	clocking cb_in_mon@(posedge clk);
		default input #1 output #1;
		input rst;
	endclocking
	clocking cb_out_mon@(posedge clk);
		default input #1 output #1;
	endclocking

	modport DRV(clocking cb_drv);
	modport IN_MON(clocking cb_in_mon);
	modport OUT_MON(clocking cb_out_mon);

endinterface
