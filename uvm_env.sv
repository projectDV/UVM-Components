class env;
    //components
    generator gen;
    driver drv;
    monitor mon;
    scorboard sb;
    ref_model rm;
    //vif
    virtual interface vif;
    //mailboxes
    mailbox#(txn)gen2drv,mon2rm,mon2sb,rm2sb;
    //new instantiation
    function new(mailbox#(txn) gen2drv,mon2rm,mon2sb,rm2sb,virutal interface vif);
       
    endfunction
    task build();
        gen=new(gen2drv);
        drv=new(gen2drv,vif);
        mon=new(vif,mon2rm,mon2sb);
        sb=new(rm2sb,mon2rm);
        rm=new(rm2sb,mon2rm);
    endtask
    task start();
        gen.start();
        drv.start();
        mon.start();
        rm.start();
        sb.start();
    endtask
    task run();
        start();
    endtask
endclass
