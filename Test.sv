class base_test extends uvm_test;
  `uvm_component_utils(base_test)
  virtual sequence vseq;
  environment env;
    function new(string name="base_test", uvm_component parent);
      super.new(name,parent);
    endfunction
    function build_phase(uvm_phase phase);
      super.build_phase(phase);
      env=environment::type_id::create("env",this);
      vseq=sequence::type_id::create("vseq",this);
        endfunction
endclass
  class tests_1 extends base_test;
    `uvm_component_utils(tests_1)
    v_sequence_1 vseq_1;
    function new(string name="tests_1",uvm_component parent);
      super.new(name, parent);
      endfunction
    function build_phase(uvm_phase phase);
      super.build_phase(phase);
    endfunction
    task run_phase(uvm_phase phase);
      super.run_phase(phase);
      phase.raise_objection(this);
      vseq_1=v_sequence_1::type_id::create("vseq_1",this);
      vseq_1.start(env.vseqr);
      phase.drop_objection(this);
    endtask
endclass
class tests_2 extends base_test;
  `uvm_component_utils(tests_2)
    v_sequence_1 vseq_1;
  function new(string name="tests_2",uvm_component parent);
      super.new(name, parent);
      endfunction
    function build_phase(uvm_phase phase);
      super.build_phase(phase);
    endfunction
    task run_phase(uvm_phase phase);
      super.run_phase(phase);
      phase.raise_objection(this);
      vseq_2=v_sequence_2::type_id::create("vseq_2",this);
      vseq_2.start(env.vseqr);
      phase.drop_objection(this);
    endtask
endclass
      
        
          
        
