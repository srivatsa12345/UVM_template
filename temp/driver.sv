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
		forever begin
			seq_item_port.get_next_item(req);
			drive(req);
			seq_item_port.item_done();
		end
	endtask
endclass

task drive(my_transaction req);
	begin
		`uvm_info("DRIVER",$sformatf("DRV:\n%s",req.sprint()),UVM_NONE)
		@(vif.cb_drv);
		vif.cb_drv.OPA<=req.OPA; 
		vif.cb_drv.OPB<=req.OPB; 
		vif.cb_drv.CE<=req.CE; 
		vif.cb_drv.MODE<=req.MODE; 
		vif.cb_drv.CIN<=req.CIN; 
		vif.cb_drv.CMD<=req.CMD; 
		vif.cb_drv.INP_VALID<=req.INP_VALID;
	end
endtask
