class out_monitor extends uvm_monitor;
       `uvm_component_utils(out_monitor)
	virtual my_if.OUT_MON vif;	
	uvm_analysis_port #(my_transaction) ap;

	function new(string name,uvm_component parent);
		super.new(name,parent);
		ap=new("ap",this);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(virtual my_if.OUT_MON)::get(this,"","vif.out_mon",vif))
			`uvm_fatal("NOVIF","vif is not set for monitor");
	endfunction

	task run_phase(uvm_phase phase);
		my_transaction tr;
	endtask
endclass

	

