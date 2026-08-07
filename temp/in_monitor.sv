class in_monitor extends uvm_monitor;
       `uvm_component_utils(in_monitor)

	virtual my_if.IN_MON vif;	
	uvm_analysis_port #(my_transaction) ap;

	my_transaction tr;
	
	function new(string name,uvm_component parent);
		super.new(name,parent);
		ap=new("ap",this);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(virtual my_if)::get(this,"","vif",vif))
			`uvm_fatal("NOVIF","vif is not set for monitor");
	endfunction

	task run_phase(uvm_phase phase);
		@(vif.cb_in_mon);
		forever
			collect_input();
	endtask

	task collect_input();
		my_transaction tr;
		begin
			tr=my_transaction::type_id::create("tr");
			@(vif.cb_in_mon);
			tr.OPA=vif.cb_in_mon.OPA; 
			`uvm_info("INPUT_MONITOR",$sformatf("Input MONITOR\n%s",tr.sprint()),UVM_NONE)
			ap.write(tr);
		end
	endtask

endclass

