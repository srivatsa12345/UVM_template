class driver extends uvm_driver#(my_transaction);
	`uvm_component_utils(driver)
	virtual my_if.DRV vif;

	function new(string name,uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(virtual my_if.DRV)::get(this,"","vif.drv",vif))
			`uvm_fatal("NOVIF", "vif not found in driver")
	endfunction
	
	task run_phase(uvm_phase phase);

	endtask
endclass

