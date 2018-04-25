% Running seven spectrometers with software triggering 

javaaddpath('C:\Program Files\Ocean Optics\OmniDriverSPAM\OOI_HOME\OmniDriver.jar');
wrap = com.oceanoptics.omnidriver.api.wrapper.Wrapper();
cnt = wrap.openAllSpectrometers();

% perallocate buffers
s = zeros(2048, cnt);
free = 0;
edge = 3;
topmax = 8;

if cnt > 0
    num = cnt - 1;
    for i=0:num
        wrap.setExternalTriggerMode(i, free);
        fprintf("trigger %i set mode %i.\n", i, free);
    end
    for i=0:num
        wrap.setExternalTriggerMode(i, edge);
        fprintf("trigger %i set mode %i.\n", i, edge);
    end

    while(topmax > 0)
        for i=1:cnt
            x = i - 1;
            s(:,i) = wrap.getSpectrum(x);
        end
        topmax = topmax - 1;
        fprintf("run number %i\n", topmax);
    end
end
