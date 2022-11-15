# LV_Mixer_Setup
# LV Mixer Setup
[BR](BR.md)There are two relevant features on the LV Mixer, the offset set by RV1 and the peak-peak voltage set by RV2.
 * Note: The polarity of the electrolytic capacitor C1 printed on the board is backwards. For proper polarity, the capacitor is mounted backwards with respect to the polarity printed onboard.

## Offset
[BR](BR.md)RV1 (connected to the emitter of Q4, or directly left of the RevA label on the board) adjusts the upper edge of the output voltage. When setting up the LV Mixer, RV1 should be adjusted such that the measured voltage at the upper edge of the LV Mixer output is the same as the offset voltage supplied to the ToF Adapter Board.

## Peak-Peak
[BR](BR.md)RV2 (in series with R24 connected to U3, or directly bellow the RevA label on the board) adjusts the voltage difference between the upper and lower edge of the LV Mixer output. Adjustments made to RV2 only affect the lower edge of this output. This means the peak-peak voltage always acts with respect to the offset voltage, not a midpoint of the output. RV2 should be adjusted until the voltage difference between the upper and lower edge of the output matches the peak-peak voltage supplied to the LV Mixer.

## Control
[BR](BR.md)After tuned as specified above. The upper edge of the LV Mixer output equals the supplied offset voltage and the lower edge of the LV Mixer output equals the supplied offset voltage plus the supplied peak-peak voltage. When the ON control signal is HIGH, the output sits at the upper edge. When the ON control signal is LOW, the output sits at the lower edge. The following table is provided for clarity.

|ON signal|LV Mixer Output|
|-- ------|-- ----- ------|
|HIGH|Supplied Offset Voltage|
|LOW|Supplied Offset Voltage + Supplied Peak-Peak Voltage|


## Oscillation
[BR](BR.md)During the initial testing of the LV Mixer the output was oscillating. This was resolved by increasing the capacitance of the feedback resistor C2 bettween pins 2&3 of Op-Amp LM6134 U1. If oscillation is still present, consider replacing C2 with a 0.01uF capacitor.
