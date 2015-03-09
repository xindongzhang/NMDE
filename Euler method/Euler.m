%% minX and maxX is the range of the domain
%% h is the length of the step\
%% f0 the initial value of myfun, expecially f0 = myfun(minX)
%% myfun is the right hand side function
function [X, F]= Euler(minX, maxX, h, f0, myfun)
N = (maxX - minX) / h;
%% handling exceptions
if N ~= floor(N)
    disp('input a appropriate h so that the N is an interger');
    return;
end

%% calculate the value on each node
F = zeros(1, N+1);
X = (0:N).*h + minX;
F(1) = f0;
for i = 2:N+1
    F(i) = F(i-1) + h * myfun(X(i));
end

%% end of the function
end




