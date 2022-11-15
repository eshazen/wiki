# TofMeeting1Jun2020
*Status of all the boards, and qty working or expected to be working for each:*[BR](BR.md)
 * 3 working LV Mixer RevA boards
 * 3 working preamp RevA boards
 * 1 working adapter board RevA board, 1 working adapter board RevB board, 1 should work after small surgery adapter board RevB
 * 1 working HV RevA board, 1 working HV RevB board, 1 not working HV RevB board problem not identified
 * 2 working filament supply RevB boards, 1 working filament supply RevA


*What work would need to be done in the EDF:*[BR](BR.md)
 * small surgery on adapter board mentioned above
 * set boards in enclosures, For filament supply this also means setting up high current BJT on heat spreader
 * try to salvage HV RevB board mentioned above
 * make molex connectors mentioned below


*Power supplies we expect our Chinese colleagues to provide:*[BR](BR.md)
 * +5V fixed supply up to X Amps for inside ToF box
 * -6V fixed supply up to X Amps for inside ToF box
 * adjustable up to ~2V supply up to X Amps for LV Mixer
 * HV supply up to 200V
 * If the HV supply is adjustable and stable at 20V then no need for a LV supply, if not then an additional supply will be needed for the LV box adjustable up to 20V

*Cabling we expect our Chinese colleagues to provide:*[BR](BR.md)
 * DB9 cable connecting preamp to ToF box
 * DB15 cable connecting ToF box to LV or HV box
 * BNC connecting HV/LV to filament supply
 * BNC to power supply for ~2v into supply for LV Mixer mentioned above
 * BNC into preamp
 * 2 BNC from filament supply to filament
 * for fixed +5V, -6V, and HV/LV supplies into the ToF box I will make molex plugs with leads they can connect to how they see fit

*Pricing for the enclosures (you did provide this for the FP express already):*[BR](BR.md)

|Enclosure|Price($USD)|
|---------|-----------|
|LV|135.54|
|HV|135.87|
|preamp|118.92|
|filament|164.53|
|ToF|127.97 + cuts|
|Total|682.83 + cuts|


*Rough estimate of additional work and cost to get from where we are to 4 sets of working electronics (installed + spare in China, ditto for here):*[BR](BR.md)
 * 1 more preamp revA board needed ($120 run of 3 at oshpark), 1 set of parts $35
 * 1 more LV Mixer revA board needed ($200 run of 3 at oshpark), 1 set of parts $70
How creative do we want to be? I know the quick board modifications to translate a RevA into a RevB if we want to avoid ordering another run of the following boards
 * 1 Set of parts for Filament supply $100
 * 1 or 2 sets of parts for HV board ~$90 per set, will take detailed inventory of what I have tonight
 * 1 or 2 sets of parts for adapter board ~$60 per set will take detailed inventory of what I have tonight. I need to double check but if ElBat lab can supply 3.3V then RevA will still work for adapter. If not, will have to order more RevB boards
For work I can get all boards assembled, modified and tested in a single week if I'm working in the EDF and don't hit any major roadblocks.
 * How do we want to fit our boards into enclosures at ElBat lab?

adding everything up above, $700 to $1000 rough estimate
