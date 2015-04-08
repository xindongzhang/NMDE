function [A, b] = genMatrix1(minX, maxX, h, u0, u1, myfun, func_p, func_r, func_q)
N = (maxX - minX) / h;
%% handling exceptions
if N ~= floor(N)
    disp('input a appropriate h so that the N is an interger');
    return;
end

%% generate matrix
A = zeros(N-1, N-1);
b = zeros(N-1, 1);

for i = 1:N-1
    if i == 1
        x = minX+h*i+2/h^2;
        A(i, i+1) = -1 / h^2 .* func_p(x);
        A(i,i) = 2 / h^2 .* func_p(x) + func_r(x) / h + func_q(x);
        b(i) = myfun(minX+h*(i-1)) + u0/h^2;
        continue;
    end
    if i == N-1
        x = minX+h*i+2/h^2;
        A(i,i) = 2 / h^2 .* func_p(x) + func_r(x) / h + func_q(x);
        A(i, i-1) = -1 / h^2 .* func_p(x) - func_r(x) / h;
        b(i) = myfun(minX+h*(i-1)) + u1/h^2;
        continue;
    end
    x = minX+h*i+2/h^2;
    A(i,i-1) = -1 / h^2 .* func_p(x) - func_r(x) / h;
    A(i,i) = 2 / h^2 .* func_p(x) + func_r(x) / h + func_q(x);
    A(i,i+1) = -1 / h^2 .* func_p(x);
    b(i) = myfun(minX+h*(i-1));
end