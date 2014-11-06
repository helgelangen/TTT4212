clear all

load('PassiveLosses_2-3GHz.mat')
%Load files from ads
load('ThirdOrdIMD_h_sim_2_35.txt')
load('ThirdOrdIMD_h_sim_2_4.txt')
load('ThirdOrdIMD_h_sim_2_45.txt')
load('ThirdOrdIMD_l_sim_2_35.txt')
load('ThirdOrdIMD_l_sim_2_4.txt')
load('ThirdOrdIMD_l_sim_2_45.txt')
load('Pload_sim_2_35.txt')
load('Pload_sim_2_4.txt')
load('Pload_sim_2_45.txt')
load('S21_sim.txt')
load('freq_sim.txt')

%Calculate the different losses
Out_loss(1)=(OutputLoss(4)+OutputLoss(5))/2;
Out_loss(2)=(OutputLoss(5)+OutputLoss(6))/2;
Out_loss(3)=OutputLoss(4);


filenames = ['2tone_Gruppe1_2_35GHz.mat';'2tone_Gruppe1_2_4GHz.mat' 0;'2tone_Gruppe1_2_45GHz.mat'];
iDrains = zeros(3,81);
iGates = zeros(3,81);
Outputpowers = zeros(3,81);
Outputpowers_f1 = zeros(3,81);
Outputpowers_f2 = zeros(3,81);
Inputpowers = zeros(3,81);
TOIMDhs = zeros(3,81);
TOIMDls = zeros(3,81);
TOIMDPow_hs = zeros(3,81);
TOIMDPow_ls = zeros(3,81);
for i=1:3
    load(filenames(i,1:end));
    iDrains(i,1:end) = iDrain;
    iGates(i,1:end) = iGate;
    Outputpowers(i,1:end) = OutputPower-Out_loss(i);
    Outputpowers_f1(i,1:end) = OutputPower_f1-Out_loss(i);
    Outputpowers_f2(i,1:end) = OutputPower_f2-Out_loss(i);
    Inputpowers(i,1:end) = InputPower;
    TOIMDhs(i,1:end) = TOIMDh;
    TOIMDls(i,1:end) = TOIMDl;
    TOIMDPow_hs(i,1:end) = TOIMDPow_h;
    TOIMDPow_ls(i,1:end) = TOIMDPow_l;
end
tdfread('S-param.s2p','\t');

plot(Outputpowers(2,1:end),TOIMDhs(2,1:end),Outputpowers(2,1:end),TOIMDls(2,1:end),[38 38],[-55 -15]);


