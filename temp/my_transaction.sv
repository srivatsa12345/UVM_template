class my_transaction extends uvm_sequence_item;
	rand bit [DW-1:0] OPA, OPB; 

	bit rst;

	function new (string name="my_trans");
		super.new(name);
	endfunction

	`uvm_object_utils_begin(my_transaction)
		`uvm_field_int(rst, UVM_ALL_ON)
	`uvm_object_utils_end
endclass

