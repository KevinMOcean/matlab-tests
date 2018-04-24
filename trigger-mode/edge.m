% Running seven spectrometers with hardware triggering 

javaaddpath('C:\Program Files\Ocean Optics\OmniDriverSPAM\OOI_HOME\OmniDriver.jar');
wrap = com.oceanoptics.omnidriver.api.wrapper.Wrapper();
cnt = wrap.openAllSpectrometers();

if cnt > 0
    triggerSource = 1;
    % set edge for spectrometers found except master source
    for i = (triggerSource + 1):cnt
        % Set hardware edge trigger mode
        wrap.setExternalTriggerMode(4);
    end
    
    % request spectrum and wait for trigger
    parfor i = (triggerSource + 1):cnt
       s(i) = wrap.getSpectrum(i - 1);
       wrap.setStrobeEnable(i - 1, 1);
    end
end
