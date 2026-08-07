class scoreboard extends uvm_scoreboard;
	`uvm_component_utils(scoreboard);
	uvm_analysis_imp_fifo #(my_transaction)in_fifo;
	uvm_analysis_imp_fifo #(my_transaction)out_fifo;

	int TOTAL,MISMATCH,MATCH;

	function new(string name, uvm_component parent);
		super.new(name,parent);
		in_fifo=new("in_fifo",this);
		out_fifo=new("out_fifo",this);
	endfunction
	
	task run_phase(uvm_phase phase);
		my_transaction inp_mon_xn;
		my_transaction out_mon_xn;
		forever begin
			fork 
				in_fifo.get(inp_mon_xn);
				out_fifo.get(out_mon_xn);
			join
			ref_model(inp_mon_xn);
			validate_outputs(inp_mon_xn,out_mon_xn);
		end
	endtask

	task validate_outputs(my_transaction inp, my_transaction out);
	endtask

	task compare_results();
		`uvm_info("SCOREBOARD",$sformatf("Total clock Cycles Checked:%0d\n Total cycles matched:%0d\n Total cycles failes:%0d",TOTAL,MATCH,MISMATCH),UVM_NONE);
	endtask

	task ref_model(my_transaction inp);
	endtask
	
endclass
