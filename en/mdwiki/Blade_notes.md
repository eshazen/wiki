# Blade_notes
Historical notes for blades


| ID  | Location                    | Remote Access? | ---------- | CM? | Cirex | Notes | ECOs |
| --  | --------                    | ------ ------- | ---------- | --- | ----- | ----- | ---- |
| 001 | BU (assembly room)          | no             |      | K   | 98716 | Hard-wired 12V on, misc on, zynq bank IO on. Pulldown on zynq_en. 1k pulldown on U15 pin 1. Jumper on switch en to 3.3V. Removed R35 and R40. Test paused after zynq booted successfully. | 1, 2 |
| 002 | BU (in Shelf for now)       | no             |      | -   | 98724 | for show. Test paused after zynq booted successfully. Test completed. | 1, 2|
| 003 | BU (assembly room)          | no             |      | -   |       | 1k pulldown on U15. switch fix. J28 has a connector, should be removed. LEDs lit up incorrectly, same as SM004. Stopped testing. | 1, 2 |
| 004 | BU (table)                  | no             |      | -   | 98719 | Resistor between R95 and R92 came off before step "put in zynq." LEDs lit up incorrectly. Stopped testing. Trial 2: Numerous LEDs lit up incorrectly at the same step (6: put in zynq). Stopped again. | 1, 2|
| 005 | Cornell                     | no             |      | -   | 98720 | LEDs hot-wired permanently on. Test completed. | 1, 2|
| 006 | BU                          | yes            |      | K+V | 98721 | Test paused after zynq booted successfully. Test completed. | 1, 2|
| 007 | Amherst                     | -              |      | -   | 98723 | Missing LED after all ECOs completed. Resoldered new LED. Test completed. | 1, 2|
| 008 | CERN TIF                    | no             |      | -   | 98717 | Missing LED after all ECOs completed. Resoldered new LED. Test paused after zynq booted successfully. Test completed. | 1, 2|
| 009 | Cornell                     | -              |      | -   | 98725 | Test paused after zynq booted successfully. Test completed. | 1, 2|
| 010 | CERN TIF                    | -              |      | ?   | 98718 | Test paused after zynq booted successfully. Test completed. | 1, 2|
