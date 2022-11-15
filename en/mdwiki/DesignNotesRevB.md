# DesignNotesRevB
Design problems found in Rev B

 * Pad under DRV2667 is not grounded and does not have thermal vias per page 37 of the datasheet
 * The boost capacitor (C2, C16 etc) is not rated for high voltage (should be 250V X7R or X5R type)
   * Only available in 1206 but the footprint is big enough
   * E.g. !DigiKey 732-12118-1-ND (Wurth 885342208004 CAP CER 0.1UF 250V X7R 1206)
 * The bulk capacitor (C6 etc) should be X5R or X7R type and probably rated higher than 6.3V
