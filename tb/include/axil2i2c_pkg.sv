package axil2i2c_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"
  `include "axil2i2c_config.sv"

  `include "axil2i2c_virtual_sequence.sv"
  `include "axil2i2c_test_sequencers.sv"

  `include "axil2i2c_predictor.sv"
  `include "axil2i2c_scoreboard.sv"
  `include "axil2i2c_coverage.sv"

  `include "axil2i2c_env.sv"
  `include "axil2i2c_env_pkg.sv"

  `include "axil2i2c_base_test.sv"
  `include "axil2i2c_smoke_test.sv"
  `include "axil2i2c_sanity_test.sv"
  `include "axil2i2c_regression_test.sv


  // FIFO-related parameters
  parameter CMD_FIFO_DEPTH = 32;
  parameter WRITE_FIFO_DEPTH = 32;
  parameter READ_FIFO_DEPTH = 32;

  // Register addresses
  parameter STATUS_REG_ADDR = 4'h0;
  parameter CMD_REG_ADDR = 4'h4;
  parameter DATA_REG_ADDR = 4'h8;
  parameter PRESCALE_REG_ADDR = 4'hC;

  // Status Register Bits (4'h0)
  parameter BUSY_BIT            = 0;    // busy when performing I2C operation
  parameter BUS_CONTROL_BIT     = 1;    // has control of active bus
  parameter BUS_ACTIVE_BIT      = 2;    // bus is active
  parameter MISSED_ACK_BIT      = 3;    // ACK pulse from slave not seen
  // [7:4] reserved
  parameter CMD_FIFO_EMPTY_BIT  = 8;    // command FIFO empty
  parameter CMD_FIFO_FULL_BIT   = 9;    // command FIFO full
  parameter CMD_FIFO_OVF_BIT    = 10;   // command FIFO overflow
  parameter WR_FIFO_EMPTY_BIT   = 11;   // write FIFO empty
  parameter WR_FIFO_FULL_BIT    = 12;   // write FIFO full
  parameter WR_FIFO_OVF_BIT     = 13;   // write FIFO overflow
  parameter RD_FIFO_EMPTY_BIT   = 14;   // read FIFO empty
  parameter RD_FIFO_FULL_BIT    = 15;   // read FIFO full
  // [31:16] reserved

  // Command Register Bits (4'h4)
  parameter CMD_ADDR_LSB        = 0;    // Start of 7-bit address field
  parameter CMD_ADDR_MSB        = 6;    // End of 7-bit address field
  // bit 7 reserved
  parameter CMD_START_BIT       = 8;    // issue I2C start
  parameter CMD_READ_BIT        = 9;    // start read
  parameter CMD_WRITE_BIT       = 10;   // start write
  parameter CMD_WRITE_MULT_BIT  = 11;   // start block write
  parameter CMD_STOP_BIT        = 12;   // issue I2C stop
  // [15:13] reserved

  // Data Register Bits (4'h8)
  parameter DATA_LSB           = 0;    // Start of 8-bit data field
  parameter DATA_MSB           = 7;    // End of 8-bit data field
  parameter DATA_VALID_BIT     = 8;    // indicates valid read data
  parameter DATA_LAST_BIT      = 9;    // indicates last byte of block write
  // [31:10] reserved

  // Prescale Register Bits (4'hC)
  parameter PRESCALE_LSB       = 0;    // Start of prescale value
  parameter PRESCALE_MSB       = 15;   // End of prescale value
  // [31:16] reserved

  // Additional parameters for field widths
  parameter DATA_WIDTH         = 8;    // Width of data field [7:0]
  parameter PRESCALE_WIDTH     = 16;   // Width of prescale field [15:0]
  parameter ADDR_WIDTH         = 7;    // Width of I2C address field [6:0]

  function automatic int calc_prescale(int clk_freq, int i2c_freq);
      return (clk_freq/(i2c_freq * 4));
  endfunction

  // Function to check if command is valid
  function automatic bit is_valid_cmd(bit [4:0] cmd);
      return (cmd[CMD_START_BIT] || cmd[CMD_READ_BIT] || 
              cmd[CMD_WRITE_BIT] || cmd[CMD_WRITE_MULTIPLE_BIT] || 
              cmd[CMD_STOP_BIT]);
  endfunction
endpackage
