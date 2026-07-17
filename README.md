# 32-bit 5-Stage Pipelined RISC-V Processor (RV32I)

A 32-bit five-stage pipelined RISC-V (RV32I) processor implemented in Verilog HDL. The processor supports the base integer instruction set with hazard detection, data forwarding, branch handling, and functional verification through simulation.

---

## Features

- 32-bit RV32I processor
- Five-stage pipeline
  - Instruction Fetch (IF)
  - Instruction Decode (ID)
  - Execute (EX)
  - Memory Access (MEM)
  - Write Back (WB)
- Data Hazard Detection
- Data Forwarding Unit
- Load-Use Hazard Stall
- Branch & Jump Support
- Immediate Generator
- Register File
- ALU
- Instruction Memory
- Data Memory
- Functional Verification
- FPGA Synthesis (Vivado)

| Feature | Status |
|---------|--------|
| ISA | RV32I |
| Pipeline | 5-Stage |
| Language | Verilog HDL |
| Hazard Detection | ✓ |
| Data Forwarding | ✓ |
| Branch & Jump Support | ✓ |
| FPGA Synthesis | ✓ |
| Timing Closure | ✓ @100 MHz |
---


## Supported Instructions

### R-Type
- ADD
- SUB
- AND
- OR
- XOR
- SLL
- SRL
- SRA
- SLT
- SLTU

### I-Type
- ADDI
- ANDI
- ORI
- XORI
- SLTI
- SLTIU
- SLLI
- SRLI
- SRAI

### Load
- LW
- LH
- LHU
- LB
- LBU

### Store
- SW
- SH
- SB

### Branch
- BEQ
- BNE
- BLT
- BGE
- BLTU
- BGEU

### Jump
- JAL
- JALR

### Upper Immediate
- LUI
- AUIPC

---

# Processor Architecture

<p align="center">
<img src="images/processor_architecture.png" width="900">
</p>

---

# Pipeline

```
        IF
         │
         ▼
        ID
         │
         ▼
        EX
         │
         ▼
        MEM
         │
         ▼
        WB
```

Pipeline registers:

- IF/ID
- ID/EX
- EX/MEM
- MEM/WB

---

# Hazard Handling

Implemented mechanisms:

- Data Forwarding
- Load-Use Hazard Detection
- Pipeline Stall
- Pipeline Flush
- Branch Redirection

---

# Repository Structure

```
.
├── rtl/                    # RTL source files
├── tb/                     # Testbench
├── mem/                    # Instruction memory initialization
├── constraints/            # FPGA constraint file
├── reports/                # Synthesis and utilization reports
├── images/
│   ├── Blockdiagram_32bit_risc.png
│   ├── simulation_waveform1.png
│   └── simulation_waveform2.png
└── README.md

```

---

# Verification

The processor was functionally verified using simulation.

Instruction verification includes:

- Arithmetic Instructions
- Logical Instructions
- Shift Instructions
- Load Instructions
- Store Instructions
- Branch Instructions
- Jump Instructions
- Upper Immediate Instructions

An integrated test program was executed to verify:

- Register Writeback
- Memory Read/Write
- Pipeline Forwarding
- Hazard Detection
- Branch Redirection
- Control Flow

---
# Functional Verification

The processor was functionally verified using Vivado Behavioral Simulation. The verification covers instruction execution through the five-stage pipeline, data forwarding, load/store operations, branch handling, hazard detection, and register write-back.

## Simulation Waveform 1

<p align="center">
  <img src="images/simulation_waveform1.png" alt="Pipeline Execution Waveform" width="1000">
</p>

**Signals observed**

- Program Counter (`pcF`, `pcD`, `pcE`)
- Instruction Fetch & Decode (`instrD`)
- Register File (`Rd1D`, `Rd2D`, `Rs1D`, `Rs2D`, `RdD`)
- Execute Stage (`Rd1E`, `Rd2E`, `SrcAE`, `SrcBE`)
- ALU Output (`ALUResultE`)
- Branch Target (`pc_imm`)
- Branch Decision (`BranchTaken`, `BranchCond`)
- Forwarding Unit (`ForwardAE`, `ForwardBE`)
- PC Selection (`PCSrcE`)

This waveform demonstrates correct instruction fetch, decode, execution, operand forwarding, ALU operation, and branch decision generation within the pipelined processor.

---

## Simulation Waveform 2

<p align="center">
  <img src="images/simulation_waveform2.png" alt="Memory and Hazard Verification Waveform" width="1000">
</p>

**Signals observed**

- Execute Stage (`Rd1E`, `Rd2E`, `SrcAE`, `SrcBE`)
- ALU Result (`ALUResultE`, `ALUResultM`)
- Memory Interface (`WriteDataM`, `ReadDataM`)
- Write-back Stage (`ResultW`, `RdW`, `RegWriteW`)
- Branch Control (`BranchTaken`, `BranchCond`, `PCSrcE`)
- Forwarding Control (`ForwardAE`, `ForwardBE`)
- Hazard Detection (`StallF`, `StallD`, `FlushD`, `FlushE`)

This waveform verifies memory read/write operations, register write-back, forwarding logic, branch control, and correct hazard handling through pipeline stall and flush mechanisms.
# Synthesis

Tool:

- AMD Vivado

Target FPGA:

- Artix-7 (xc7a200tfbg676-3)

Timing analysis and resource utilization reports are included in the `reports` directory.

---
## FPGA Synthesis Summary

The processor was synthesized using **AMD Vivado 2025.2** targeting the **Artix-7 XC7A200T (xc7a200tfbg676-3)** FPGA.

| Resource | Used | Utilization |
|----------|-----:|------------:|
| Slice LUTs | 1850 | 1.37% |
| Slice Registers | 1066 | 0.40% |
| Block RAM | 0 | 0.00% |
| DSP Slices | 0 | 0.00% |
| Global Clock Buffers (BUFG) | 1 | 3.13% |

The synthesis results indicate a compact implementation with low resource utilization, leaving ample FPGA resources available for future extensions such as caches, branch prediction, and additional peripherals.

## FPGA Implementation Results

The processor was successfully synthesized and implemented in **AMD Vivado 2025.2** targeting the **Artix-7 XC7A200T FPGA**.

### Timing Summary

| Metric | Value |
|--------|-------|
| Target Clock | 100 MHz |
| Clock Period | 10.000 ns |
| Worst Negative Slack (WNS) | +0.026 ns |
| Total Negative Slack (TNS) | 0.000 ns |
| Worst Hold Slack (WHS) | +0.088 ns |
| Timing Status | **PASS** |

All user-specified timing constraints were successfully met after place-and-route.

# Future Improvements

- Branch Prediction
- CSR Support
- Exception Handling
- Interrupt Support
- Multiplier / Divider Extension
- Cache Interface
- AXI4-Lite Interface

---

# Acknowledgements

The overall processor organization was developed with reference to publicly available educational resources on pipelined RISC-V processors. The RTL implementation, verification, debugging, and subsequent enhancements in this repository were independently developed.

---

# Author

**Sathwik B**

M.Tech – VLSI Design
