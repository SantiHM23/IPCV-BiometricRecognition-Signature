clear all;
close all;
clc;

n_users = 50;
n_sessions = 4;
n_genuine_signs = 4;
genuine_signatures = [1, 2, 6, 7];
n_signatures = n_sessions * n_genuine_signs;
n_parameters = 5;
N = 1; %Values to be tested: 1, 4 and 12

% Calculation for Impostor Scores
for umod = 1:n_users
    name = sprintf('../DB/u10%02ds0001_sg0001.mat', umod);
    load(name);
    test = featureExtractor(x,y,p);
    for uimp = 1:n_users
        if uimp ~= umod
            counter_signatures = 1;
                for s = 1:n_sessions
                    for g = 1:n_genuine_signs
                        sign = genuine_signatures(g);
                        nameimp = sprintf('../DB/u10%02ds%04d_sg%04d.mat', uimp, s, sign);
                        load(nameimp);
                        Model(counter_signatures, :) = featureExtractor(x,y,p);
                        counter_signatures = counter_signatures + 1;
                    end
                end
            if uimp < umod
                ImpostorScores(umod, uimp) = Matcher(test, Model(1:N,:));
            elseif uimp > umod
                ImpostorScores(umod, uimp-1) = Matcher(test, Model(1:N,:));
            end
        end
    end
end