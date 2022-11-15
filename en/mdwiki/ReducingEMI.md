# ReducingEMI
### From TI Reducing EMI: http://www.ti.com/lit/an/szza009/szza009.pdf

===Sources of noise:
1. IC's I/O pins
  A. Noise from clock switching within IC appears as glitches on a static output. Caused by common impedance of the shared pins that supply each power and ground.
2. Power-supply system
  A. Includes voltage regulation and bypass capacitors at both regulator and microcomputer. Source of all RF energy in system (feed clocked circuits inside IC with current required for switching)
3. Oscillator circuit
  A. Oscillator swings rail to rail. In addition to fundamental freq, harmonics included due to the output buffer being digital, which squares the sine wave.
  B. *Solution:* proper separation between crystal and tank circuits from other componenets and traces on PCB, *_AND*_ loop areas are kept small.

===SMD vs. TH Components

 * SMDs are better than leaded devices because of the reduced inductances and closer component placements available.
 * *Generally leaded capacitors all go self-resonant (more inductive than capacitive) at ~80MHz.*
 * Thus designs with only TH parts should not be considered as highly.

===





### From Reducing Noise https://ece480group6.files.wordpress.com/2012/11/low-noise-printed-circuit-board-design.pdf

### Reducing Impedance
 * Avoid Long Traces
 * Avoid Cutting the ground plane
   * If neccecary run a long trace along the outside of the board to avoid cutting the ground plane in half

### Avoiding stray capacitance
