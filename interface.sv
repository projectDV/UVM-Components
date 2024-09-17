interface if(input bit clk);
    logic [31:0]data,addr;
    bit rst;
    wire [31:0]data_out

    clocking wr_cb@(posedge clk)
        default input #1 output #1;
        output data;
        output addr;
        output wr_rd;
        output rst;
    endclocking
    clocking rd_cb@(posedge clk)
        default input #1 output #1;
        input data_out;
    endclocking

    modport wr_mp(clocking wr_cb);
    modport rd_mp(clocking rd_cb);
endinterface
