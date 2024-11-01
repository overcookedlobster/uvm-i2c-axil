package i2c_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  `include "i2c_interface.sv"
  `include "i2c_agent.sv"
  `include "i2c_driver.sv"
  `include "i2c_monitor.sv"
  `include "i2c_sequencer.sv"
  `include "i2c_responder.sv"
  `include "i2c_base_sequence.sv"
  `include "i2c_response_sequence.sv"

endpackage
