function Params = stimdefARMIN_old(EXP);
% stimdefARMIN - definition of stimulus and GUI for ARMIN stimulus paradigm
%    P=stimdefARMIN(EXP) returns the definition for the ARMIN
%    stimulus paradigm. The definition P is a GUIpiece that can be rendered
%    by GUIpiece/draw. Stimulus definition like stimmdefARMIN are usually
%    called by StimGUI, which combines the parameter panels with
%    a generic part of stimulus GUIs. The input argument EXP contains 
%    Experiment definition, which co-determines the realization of
%    the stimulus: availability of DAC channels, calibration, recording
%    side, etc.
%
%    See also stimGUI, stimDefDir, Experiment, makestimARMIN, stimparamsARMIN.

PairStr = ' Pairs of numbers are interpreted as [left right].';
ClickStr = ' Click button to select ';
%==========Carrier frequency GUIpanel=====================
Fsweep = FrequencyStepperARMIN('flip frequency', EXP, '', '', 'nobinaural');
% ---SAM
% Sam = SAMpanel('SAM', EXP);
% Sam = sameextent(Sam,Fsweep,'X'); % adjust width of Mod to match Fsweep

% Noise
Noise = NoisePanelARMIN('noise param', EXP);
% ---Durations
Dur = DurPanel('-', EXP);
% ---Pres
Pres = PresentationPanel_XY('Freq','SPL');
% ---Summary
summ = Summary(17);

%====================
Params=GUIpiece('Params'); % upper half of GUI: parameters
Params = add(Params, summ);
Params = add(Params, Fsweep, nextto(summ), [10 0]);
% Params = add(Params, Sam, below(Fsweep), [0 6]);
Params = add(Params, Noise, nextto(Fsweep), [10 0]);
Params = add(Params, Dur, below(Fsweep) ,[0 10]);
Params = add(Params, Pres, nextto(Dur) ,[5 0]);
Params = add(Params, PlayTime, below(Dur) , [0 7]);




