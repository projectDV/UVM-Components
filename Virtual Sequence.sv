//virtual sequence and virtual sequencer
class virtual_seq extends uvm_sequence#(uvm_sequence_item);
  'uvm_object_utils(virtual_seq)
  virtual_sequencer v_seqr;
  sequencer seqr;
  sequence_1 seq1;
  sequence_2 seq2;
  
  environment env;
  
    task body();
      assert($cast(m_sequencer,v_seqr));
      seqr=v_seqr.seqr;
    endtask
endclass
class sequence1 extends virtual_seq;
  `uvm_object_utils(sequence1);
  task body();
    super.body();
    seq1=sequence1::type_id::create("seq1");
    seq1.start(seqr);
  endtask
endclass
class sequence2 extends virtual_seq;
  `uvm_object_utils(sequence2)
  task body();
    super.body();
    seq2=sequence2::type_id::create("seq2");
    seq2.start(seqr);
  endtask
endclass
