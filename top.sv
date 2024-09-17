module top;
    bit  clock,rst;

    clk=0;
    forever begin
        clk =~clk;
    end
    //Interface
    if i(clk);
    //dut
    my_design DUT ( .clk(i.clk),
                    .wr_rd(i.wr_rd),
                    .rst(i.rst),
                    .data(i.data),
                    .addr(i.addr),
                    .data_out(i.data_out));
    initial begin
        uvm_config_db#(virtual if)::set(null,"*","top_vif",i);
    end
endmodule
