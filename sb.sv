//SB
class scoreboard extends uvm_scoreboard;
    //fact_reg
    uvm_analysis_import#(trans)ap;
    trans write_txn,read_txn;
    int mem[int];

    //function new();
    function build_phase(uvm_phase);
        super.build_phase(phase);
        write_txn=trans::type_id::create("write_txn",this);
        mem=new();
        ap=new();
    endfunction
    task run_phase(ucvm_phase phase);
        fork
            forever begin
                ap.get(write_txn);
                write_mem(write_txn);
            end
            forever begin
                check_data(read_txn);
            end
        join
    endtask
    function void write_mem(trans wd);
        if(wd.write)
            mem[wd.addr]=wd.data;
    endfunction
    function void check_data(trans rd);
        if(read_mem(rd)) begin
            if(rd.data==mem[rd.addr])
                `uvm_info("SCOrEBOARD", "PASS", UVM_LOW);
            else
                `uvm_error("FAIL");
        end
    endfunction
    function bit read_mem(ref trans rd);
        if(mem.exists(rd.addr))
            rd.data=mem[rd.addr];
            return 1;
        else
            return 0;
    endfunction
endclass
