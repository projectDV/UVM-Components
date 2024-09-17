class seq_item extends uvm_sequence_item;
    `uvm_object_utils(seq_item)

    rand int addr;
    rand int data;
    rand bit wr_rd;
    
    constraint address{addr inside {[0:15]};}
    constraint data{data inside {[0:15]};}

    function new(string name="seq_item");
        super.new(name);
    endfunction
    function do_compare(uvm_object rhs, uvm_comparer comparer);
        seq_item txn;
        $cast(rhs,txn);
        return super.do_compare(rhs,comparer)&&
        data==txn.data&&
        addr==txn.addr&&
        wr_rd==txn.wr_rd;        
    endfunction
endclass
