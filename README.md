# Ripple Carry Counter – ECE 571 System Verilog For Verification Assignment

This repository contains multiple versions of a 4-bit Ripple Carry Counter using DFF- and TFF-based designs, implemented as part of ECE-571 at Portland State University.

## Description
Each version uses Toggle Flip-Flops (TFFs) built from D Flip-Flops (DFFs) to create a ripple counter. The testbenches apply reset and simulate counting with expected output checks.

## Differences Between Versions

- **Version 1**  
  Standard ripple carry counter with full TFF chain (`q0 → q1 → q2 → q3`). Uses basic stimulus and manual error checking via `$display`.

- **Version 2**  
  Breaks the TFF chain at `tff2` by feeding `1'b0` as its clock input. Tests reset behavior and validates output at fixed timestamps.

- **Version 3**  
  Similar to Version 2 but introduces a behavioral model (`q_beh`) to track expected counts dynamically and compare with DUT output on each clock cycle.

- **Version 4**  
  Full TFF chain restored (`q0 → q1 → q2 → q3`) with behavioral model included. Stronger validation using continuous comparison of DUT and reference counter.

> All testbenches use asynchronous reset and simulate toggling over time to validate counter functionality.
