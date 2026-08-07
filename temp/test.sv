class test extends uvm_test;
	`uvm_component_utils(test);
	environment env;
	sequneces seq;

	function new (string name,uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		env=environment::type_id::create("env",this);
	endfunction

	task run_phase(uvm_phase phase);
		phase.raise_objection(this);
		seq=sequences::type_id::create("seq");
		seq.start(env.a_ag.sqr);
		phase.drop_objection(this);
	endtask
endclass


