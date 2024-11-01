package axil_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  // 1. Forward Declaration
  typedef class axil_seq_item;
  typedef class axil_sequence;
  typedef class axil_base_sequence;
  typedef class axil_write_sequence;
  typedef class axil_read_sequence;
  typedef class axil_driver;
  typedef class axil_monitor;
  typedef class axil_sequencer;
  typedef class axil_agent;

  // 2. Type definitions
  // Transaction types 
  typedef enum {WRITE, READ} axil_op_t;

  // Status/Error types
  typedef enum {AXI_OKAY, AXI_ERROR} axi_resp_t;

  // Config types
  typedef bit [31:0] addr_t;
  typedef bit [31:0] data_t;

  // 3. Implementation includes
  `include "axil_seq_item.sv"
  `include "axil_sequence.sv"
  `include "axil_base_sequence.sv"
  `include "axil_write_sequence.sv"
  `include "axil_read_sequence.sv"
  `include "axil_driver.sv"
  `include "axil_monitor.sv"
  `include "axil_sequencer.sv"
  `include "axil_agent.sv"
endpackage
