function [A, b] = genMatrix0(minX, maxX, h, u0, u1, myfun)
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
        A(i, i) = minX+h*i+2/h^2;
        A(i,i+1) = -1/h^2;
        b(i) = myfun(minX+h*(i-1)) + u0/h^2;
        continue;
    end
    if i == N-1
        A(i,i) = minX+h*i+2/h^2;
        A(i, i-1) = -1/h^2;
        b(i) = myfun(minX+h*(i-1)) + u1/h^2;
        continue;
    end
    A(i,i-1) = -1.0 / h^2;
    A(i,i) = (minX + h*i) + 2.0 / h^2;
    A(i,i+1) = -1.0 / h^2;
    b(i) = myfun(minX+h*(i-1));
end