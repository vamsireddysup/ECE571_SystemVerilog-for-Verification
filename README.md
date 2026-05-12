# ECE571: SystemVerilog for Verification

Course assignments and projects for ECE 571 — SystemVerilog for Verification, covering the complete SystemVerilog language for hardware verification from basic constructs to UVM fundamentals.

## Repository Structure

```
ece571_systemverilog-for-verification/
├── hw1/          # Homework 1 — SV fundamentals and data types
│   ├── hw1a-passing_selfcheck/   # Passing: self-check stimulus
│   ├── hw1b-failing_targeted/    # Failing: targeted test vectors
│   ├── hw1c-failing_bfm/         # Failing: bus functional model
│   └── hw1d-passing_bfm/         # Passing: bus functional model
├── hw2/          # Homework 2 — Classes, constraints, and coverage
│   ├── hw2_1a/   # Three design implementations (primitive, continuous, always_comb)
│   ├── hw2_1b/   # Directed testbench comparing all 3 designs
│   ├── hw2_1c/   # Randomized testbench comparing all 3 designs
│   └── hw2_2/    # Bug-finding exercise
└── README.md
```

## Topics Covered

### Homework 1 — SV Language Fundamentals
- Packed and unpacked arrays, queues, associative arrays
- `struct`, `union`, `enum` data types
- Procedural blocks: `always_comb`, `always_ff`, `always_latch`
- Interfaces, modports, and clocking blocks
- Tasks and functions: `automatic`, `void`

### Homework 2 — Object-Oriented Verification
- Classes: constructors, inheritance, virtual methods
- Randomization: `rand`, `randc`, constraint blocks
- Functional coverage: covergroup, coverpoint, bins, cross
- Inter-process communication: mailbox, semaphore, event
- Program blocks and scheduling regions

## Simulation

```bash
# Compile with VCS
vcs -sverilog hw1/<file>.sv -o simv
./simv

# Compile with QuestaSim
vlog hw1/*.sv
vsim -do "run -all" <tb_module>
```

## Tools

- **Synopsys VCS** / **Mentor QuestaSim**: Simulation
- **Synopsys Verdi**: Waveform debugging
- **SystemVerilog IEEE 1800-2017**

## Course Information

Portland State University — ECE 571: SystemVerilog for Verification
