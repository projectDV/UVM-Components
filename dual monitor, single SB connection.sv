//monitor_1
uvm_analysis_port#(txn)mon_port_1;
//run_phase
mon_port_1.write_input_1(txn);
//monitor_2
uvm_analysis_port#(txn)mon_port_2;
//run_phase
mon_port_2.write_input_2(txn);

//SB
`uvm_analysis_imp_decl(input_1)
`uvm_analysis_imp_decl(input_2)
class scoreboard;
    uvm_analysis_import_input_1#(txn,scoreboard)mon_port_1;
    uvm_analysis_import_input_2#(txn,scoreboard)mon_port_2;

    trans q_1[$];    
    trans q_2[$];

    function new(string name="scoreboard", uvm_component parent);
        super.new(name,parent);
        mon_port_1=new("mon_port_1",this);
        mon_port_2=new("mon_port_2",this);
    endfunction
    virtual function void write_input_1(trans txn);
        q_1.push_back(txn);
        compare();
    endfunction
    virtual function void write_input_2(trans txn);
        q_2.push_back(txn);
        compare();
    endfunction
    //Compare logic
endclass
