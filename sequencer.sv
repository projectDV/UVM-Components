//uvm_sequencer
class sequencer extedns uvm_sequencer#(seq_item);
    `uvm_component_utils(sequencer)

    uvm_blocking_get_import#(seq_item) get_imp;
    function new(string name="sequencer",uvm_compnent parent);
        super.new(name,parent);
        get_imp=new(this);
    endfunction
    function build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction 
endclass
