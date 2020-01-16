clear all;
close all;
clc;

n_users = 50;
n_sessions = 4;
n_genuine_signs = 4;
genuine_signatures = [1, 2, 6, 7];
n_signatures = n_sessions * n_genuine_signs;
n_parameters = 5;

BiosecurIDparameters = zeros(n_users, n_signatures, n_parameters);

for u = 1:n_users
    counter_signatures = 1;
    for s = 1:n_sessions
        for g = 1:n_genuine_signs
            sign = genuine_signatures(g);
            name = sprintf('../DB/u10%02ds%04d_sg%04d.mat', u, s, sign);
            load(name);
            BiosecurIDparameters(u, counter_signatures, :) = featureExtractor(x,y,p);
            counter_signatures = counter_signatures + 1;
        end
    end
end

for param = 1:n_parameters
    figure();
    histogram(BiosecurIDparameters(:,:,param), 'Normalization', 'probability');
end
