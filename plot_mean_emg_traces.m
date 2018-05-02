function plot_mean_emg_traces(timeframe,EMGm,EMGsd)


plotShadedSD(timeframe,1000*horzcat(EMGm{:}),1000*horzcat(EMGsd{:}));
xlabel('Time (s)');
ylabel(['mean EMG (mV)']);
title('mean EMG trace');

