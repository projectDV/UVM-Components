//uvm_driver
class driver extends uvm_driver#(txn);
  transaction txn;
  virtual interface vif;
  uvm_tlm_port#(txn) get_port;
  driver_cfg cfg;
    
    function new(string name="driver",uvm_component parent);
      txn=new();
      get_port=new();
      cfg=new();
    endfunction
    function build_phase(uvm_phase phase);
    	super.build_phase;
      if(!uvm_config_db(virtual interface)::get(this,"","vif",cfg))
        `uvm_info("casting passed")
       else
         `uvm_error("casting failed");
    endfunction
        function connect_phase(uvm_phase phase);
          super.connect_phase(phase)
          this.vif=cfg.vif;
        endfunction
        task run_phase(uvm_phase phase);
          super.run_phase(phase);
          forever begin
          seq_item_port.get_next_item(txn);
            drive();
          seq_item_port.item_done();
          end
        endtask
        task drive();
          fork 
          @(vif.drv_cb);
          vif.a<=txn.a;
          join_none
        endtask
endclass
