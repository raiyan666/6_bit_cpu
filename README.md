# 🧠 6-bit CPU Design in Verilog

This project showcases a simple yet functional **6-bit CPU** architecture designed using **Verilog HDL**, ideal for educational purposes, digital logic design demonstrations, and VLSI portfolio projects.

## ⚙️ Components

- **Program Counter (PC)**: Manages instruction sequencing.
- **6-bit ALU**:
  - Arithmetic: `ADD`, `SUB`
  - Logic: `XOR`, `OR`
  - Bitwise: `Shift Right`
- **Register File**:
  - Two general-purpose registers: `A` and `B`
- **Instruction Set**:
  - `LOAD`, `STORE`, `ADD`, `SUB`, `JMP`, `NOP`
- **FSM Controller**:
  - Five states: `START`, `ONE`, `TWO`, `THREE`, `FINISH`

## 💻 Tools & Technologies

- `Verilog HDL` – for designing all digital modules
- `Testbenches` – for verifying module functionality
- `OpenLane` – for synthesis with **130nm Skywater PDK**
  - RTL Synthesis
  - Floorplanning
  - Power Analysis
  - GDSII Layout
  - Heatmap generation

## 📂 File Structure

```plaintext
├── src/
│   ├── ALU.v
│   ├── ALU_ADD_SUB_Nbit.v
│   ├── ALU_SHL_Nbit.v
│   ├── Register_File.v
│   ├── FSM_Controller.v
│   └── CPU_Top.v
├── testbench/
│   └── ALU_tb.v
├── synthesis/
│   ├── reports/
│   └── layout/
└── README.md
