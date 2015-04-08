close all;
clear all;
clc;
addpath ./utils
addpath ./solvers
minX = 0;
maxX = 1;
h = 0.1;
N = (maxX-minX)/h;
[A, b] = genMatrix1(minX, maxX, h, 0, 0, @func0, @func_p, @func_r, @func_q);
x = zeros(N+1,1);
x(2:N) = A\b;
plot(x)
