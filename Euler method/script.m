%% this is the script of the Euler method
%% du/dt = f(u,t), st f(0) = 1 and 0<=x<=1
clear all;
close all;
clc;

minX = 0;maxX = 1;
step1 = 0.1;
step2 = 0.05;
f0 = 1;
[X1, F1] = Euler(minX, maxX, step1, f0, @Func);
[X2, F2] = Euler(minX, maxX, step2, f0, @Func);

plot(X1, F1, '*', X1, F1);
hold on
plot(X2, F2, 'o', X2, F2);
title('comparing Euler methods with different step')