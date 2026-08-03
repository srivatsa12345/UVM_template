class in_monitor extends uvm_monitor;
       `uvm_component_utils(in_monitor)
	virtual my_if.IN_MON vif;	
	uvm_analysis_port #(my_transaction) ap;

	function new(string name,uvm_component parent);
		super.new(name,parent);
		ap=new("ap",this);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(virtual my_if.IN_MON)::get(this,"","vif.in_mon",vif))
			`uvm_fatal("NOVIF","vif is not set for monitor");
	endfunction

	task run_phase(uvm_phase phase);
		my_transaction tr;
	endtask
endclass

	

