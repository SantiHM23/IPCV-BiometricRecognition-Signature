function [T] = Ttotal(x)

samples_per_sec = 200;
T = size(x,2)/samples_per_sec;