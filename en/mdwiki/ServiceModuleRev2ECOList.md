# ServiceModuleRev2ECOList
## ECOs
 * place C56 across U21 pins 3 and 4. (478-9265-1-ND)
 * C55 & C58 removed (wrong foodprint, but not needed)
 * C608 (1276-1119-1-ND 10uF 603 part, but 202 pad) placed at C35's location (603 pad)
 * Wire from Zynq POR R230 to U209 pin 7 @R256
 * Change R257 to 5.1k and R258 to 12k [](attachments/)

(further fix with either new U209 or resistor divider on both inputs of U209)  (U209 diff inputs only work starting at about 1.3V, not 3.3 doh!) Possibly switch to using a TPS3895 for power up.

