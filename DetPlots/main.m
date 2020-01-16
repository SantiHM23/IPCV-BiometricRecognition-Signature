clear all;
close all;
clc;

% load('../DB/u1006s0004_sg0002.mat')
% load true_scores
% load impostor_scores
% 
% t = 0:1/200:(size(x,2)-1)/200;
% 
% subplot(2,2,1); plot(x,y);
% subplot(2,2,2); plot(t,x);
% subplot(2,2,3); plot(t,y);
% subplot(2,2,4); plot(t,p);

%We will extract five global parameters of each signature, so each
%signature will be represented by a feature vector of size 5
%FeatVect = featureExtractor(x,y,p);

% load GenuineScores_1
% load ImpostorScores_1
% load GenuineScores_4
% load ImpostorScores_4
% load GenuineScores_12
% load ImpostorScores_12

load GenuineScores_12
load ImpostorScores_12

Gen = reshape(GenuineScores,1,[]);
Imp = reshape(ImpostorScores,1,[]);

Gen = -Gen;
Imp = -Imp;

[EER]=Eval_Det(Gen,Imp,'r');
