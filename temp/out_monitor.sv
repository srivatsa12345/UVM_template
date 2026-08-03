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
		@(vif.cb_out_mon);
		forever
			collect_output();
	endtask
endclass

task collect_output();
	my_transaction tr;
	begin
		tr=my_transaction::type_id::create("tr");
		@(vif.cb_out_mon);
		tr.RES=vif.cb_out_mon.RES; 
		tr.COUT=vif.cb_out_mon.COUT; 
		tr.OFLOW=vif.cb_out_mon.OFLOW; 
		tr.G=vif.cb_out_mon.G; 
		tr.E=vif.cb_out_mon.E; 
		tr.L=vif.cb_out_mon.L; 
		tr.ERR=vif.cb_out_mon.ERR;
		tr.rst=vif.cb_out_mon.rst;
		`uvm_info("OUTPUT_MONITOR",$sformatf("Output MONITOR\n%s",tr.sprint()),UVM_NONE)
		ap.write(tr);
	end
endtask


