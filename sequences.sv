class sequences extends uvm_sequence #(my_transaction);
	
	`uvm_object_utils(sequences)

	function new (string name);
		super.new(name);
	endfunction

	task body();
		req=my_transaction::type_id::create("req");
		start_item(req);
		if(req.randomize())
			`uvm_info("SEQ",$sformatf("OPA=%0d, OPB=%0d, CE=%0b, MODE=%0b, CIN=%0b, CMD=%0d, INP_VALID=%0b", OPA, OPB, CE, MODE, CIN, CMD, INP_VALID),UVM_MEDIUM)
		else 
			`uvm_error("SEQ","SEQ failed");
		finish_item(req);
	endtask
endclass

		
