# HV_Pulser_Setup
# HV Pulser Setup
[BR](BR.md)There are two relevant features on the HV Pulser, the current sink and the current supply.

## Current Sink
[BR](BR.md)The current sink draws a fixed amount of current whenever power is supplied to the HV Pulser. The purpose of this is to provide a constant holding current across the load of the HV Pulser. Because the exact behavior of the load of the HV Pulser may be variable, the following equations describing the behavior of the current sink are provided. Assuming R17 = R18 = R19 = Remmiter the sink current (in amps) can be described by the equation below:
[BR](BR.md)Isink = ((12V * (R16Ohm / (R15Ohm + R16Ohm)) - .6V) * 3) / Remitter Ohm
[BR](BR.md)Assuming R15 and R16 are not changed and are 3.6kOhm and 1kOhm respectively, then the sink current (in amps) can be described by the equation below:
[BR](BR.md)Isink = 6.03V / Remitter Ohms
[BR](BR.md)The most effective value for this current will depend entirely on the exact physical properties of the exciter used in experimentation. Be prepared to make any necessary adjustments after taking measurements of the equipment used.


## Current Supply
[BR](BR.md)The HV Pulser has a current supply driven by the ON control signal. The purpose of this current supply is to offset the current drawn by the current sink discussed above. The value of this supply current (in amps) can be described by the equation below.
[BR](BR.md)Isupply = 1.5V / (resistance of R14 in Ohms)

## Control
[BR](BR.md)The purpose of the HV Pulser is to provide a switching output between 0V and some negative supply. For control of this switching output two signals are used, POS and NEG. The POS signal is used to control the high gate of this switching circuit and the NEG signal is used to control the low gate of this switching circuit. When the high gate is active, the output of the circuit is pulled to 0V. When the low gate is active, the output of the circuit is pulled to the negative supply. While this circuit can be operated over a wide range of voltages, it is expected the supply voltage will be -200V. With such a high supply voltage is *critically important* that the high gate and low gate are never active at the same time. This would cause a short between the supply voltage and ground and most likely destroy the circuit.

The following tables are provided for clarity of the control signals

|ON Signal|Current|
|-- ------|-------|
|HIGH|Isupply|
|LOW|0|


|POS Signal|High Gate|Vout|
|--- ------|---- ----|----|
|HIGH|Active|0V|
|LOW|Off|N/A|


|NEG Signal|Low Gate|Vout|
|--- ------|--- ----|----|
|HIGH|Off|N/A|
|LOW|Active|Vsupply|

 * *IMPORTANT:* The control for the Low Gate is inverted towards conventional logic. A LOW NEG signal activates the gate while a HIGH NEG signal turns off the gate. *at no time* should POS be HIGH while NEG is LOW. This means that the POS signal should never be HIGH while the NEG signal is LOW.

## Drift
[BR](BR.md)As shown in the control tables above, the system may have indeterminate behavior when both gate are off. During testing, the output would drift towards the supply voltage if the current supply was off. This is contrary to the logic discussed above but it is important to note the load used during testing does not have an ambient current draw like the experimental load will. This behavior is documented [HVPulser_RevA_Testing_2_25_20](ohm), please read this page as it further discusses the relationships between all of the control signals and the possible behaviors of the output.
