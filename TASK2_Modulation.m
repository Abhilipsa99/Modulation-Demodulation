clc;
clear all;
close all;
a=audiorecorder(8000,8,1);
disp('Start Recording')
recordblocking(a,10);
disp('Recorded');
b=getaudiodata(a);
folder=uigetdir(path,'Save the file');
file=input('Enter the File Name: ','s');
filename=strcat(file,'.wav');
filename=strcat(folder,'\',filename);
disp('The path for the saved file is: ');
disp(filename);
audiowrite(filename,b,10000);
[y,Fs]=audioread(filename);
get(a)
Ac=10;
fs=8000; %SAMPLING FREQUENCY
fc=2000; %CARRIER FREQUENCY
t=[1:10*fs]'/fs;
wc=2*pi*fc*t;
c=Ac*cos(wc); %CARRIER SIGNAL
k=menu('Select the type of Modulation','Amplitude Modulation','Frequency Modulation');
switch k
    case 1
        v=modulate(y,fc,fs,'am');
        x=demod(v,fc,fs,'am');
        subplot(4,1,1);
        plot(t',y);
        xlabel('Time');
        ylabel('Amplitude');
        title('INPUT SIGNAL');
        subplot(4,1,2);
        plot(t(1:200),c(1:200))
        xlabel('Time');
        ylabel('Amplitude');
        title('CARRIER SIGNAL');
        grid on;
        subplot(4,1,3);
        plot(t',v)
        xlabel('Time');
        ylabel('Amplitude');
        title('AMPLITUDE MODULATED SIGNAL');
        grid on;
        subplot(4,1,4);
        plot(t',x)
        xlabel('Time');
        ylabel('Amplitude');
        title('AMPLITUDE DEMODULATED SIGNAL');
        grid on;
        pause(5);
        sound(x)
    case 2
        v=modulate(y,fc,fs,'fm');
        x=demod(v,fc,fs,'fm');
        subplot(4,1,1);
        plot(t',y);
        xlabel('Time');
        ylabel('Amplitude');
        title('INPUT SIGNAL');
        subplot(4,1,2);
        plot(t(1:200),c(1:200))
        xlabel('Time');
        ylabel('Amplitude');
        title('CARRIER SIGNAL');
        grid on;
        subplot(4,1,3);
        plot(t',v)
        xlabel('Time');
        ylabel('Amplitude');
        title('FREQUENCY MODULATED SIGNAL');
        grid on;
        subplot(4,1,4);
        plot(t',x)
        xlabel('Time');
        ylabel('Amplitude');
        title('FREQUENCY DEMODULATED SIGNAL');
        grid on;
        pause(5);
        sound(x)
end