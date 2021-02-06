class agt_in extends uvm_agent;
    monr_in monr_in;
    drv drv;
    my_sequencer sqr;

    uvm_analysis_port #(my_transaction) ap;

    `uvm_component_utils(agt_in);

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction //new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        monr_in = monr_in::type_id::create("monr_in",this);
        drv = drv::type_id::create("drv",this);
        sqr = my_sequencer::type_id::create("sqr",this);
    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        //the connection of seqencer and dirver
        drv.seq_item_port.connect(sqr.seq_item_export);
        //ap
        this.ap = monr_in.mon_ap;
    endfunction

endclass //agt_in 