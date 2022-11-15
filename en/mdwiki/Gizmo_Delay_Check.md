# Gizmo_Delay_Check
## Gizmo Delay Check
Tried different delay settings and used 'scope to measure how much delay the gizmo introduced.

## Coarse Setting
Expect step-size of 17.5 ps.  Measure a stepsize of 17.86 +/- 0.01 ps so all seems OK:[BR](BR.md)
<img src="measureDelay_AfterFix.png">

## Fine Setting
Strong non-linear behaviour seen. Need at least a third-order polynomial to fit it:[BR](BR.md)
<img src="measureFineDelay_AfterFix.png">[BR](BR.md)
Should be able to use coarse settings to get within 17.8 ps of target time, then can use fine setting with approximate step size of 11.1 fs.[BR](BR.md)

## History: Delays Before Fix
In original code, all signals from parallel port were opposite of what they should've been (i.e. positive going should have been negative going).[BR](BR.md)
We think this is due to the non-documented use of inverters.[BR](BR.md)
This configuration showed the strange behaviour in the plots below, which was fixed when the signals were inverted.[BR](BR.md)
Red and green lines in the coarse plot were taken at different times.[BR](BR.md)
<img src="measureDelay.png">
<img src="measureFineDelay.png">

