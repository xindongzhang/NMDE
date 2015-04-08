close all;
clear all;
clc;
addpath ./utils
addpath ./solvers
minX = 0;
maxX = 1;
h = 0.01;
N = (maxX-minX)/h;
[A, b] = genMatrix0(minX, maxX, h, 1, exp(1),@func0);
x = zeros(N+1,1);
x(1) = 1;
x(N+1) = exp(1);
x(2:N) = A\b;
plot(x)
