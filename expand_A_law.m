function x = expand_A_law(y, A)
%EXPAND_A_LAW Th?c hi?n m? r?ng (expansion) A-law.
%   x = expand_A_law(y, A) nh?n ??u vào là tín hi?u ?ã ???c nén y và
%   tham s? A, tr? v? tín hi?u sau khi m? r?ng x theo công th?c A-law.
%
% Công th?c nén A-law th??ng ???c ??nh ngh?a nh? sau:
%   F(x) = sign(x) * { A*|x|/(1+log(A)), n?u |x| < 1/A
%                      (1+log(A*|x|))/(1+log(A)), n?u 1/A <= |x| <= 1 }
%
% Do ?ó, hàm m? r?ng (inverse function) ???c tính nh? sau:
%   N?u |y| < 1/(1+log(A)) thì
%       x = sign(y) * |y|*(1+log(A))/A;
%   N?u |y| >= 1/(1+log(A)) thì
%       x = sign(y) * exp(|y|*(1+log(A))-1)/A;
%
% L?u ý: ? ?ây s? d?ng log là logarith t? nhiên (log base e).

    % Tính ng??ng cho hàm m? r?ng
    threshold = 1 / (1 + log(A));
    
    % Kh?i t?o x có cùng kích th??c v?i y
    x = zeros(size(y));
    
    % Tr??ng h?p 1: |y| < threshold
    idx = abs(y) < threshold;
    x(idx) = sign(y(idx)) .* abs(y(idx)) * (1 + log(A)) / A;
    
    % Tr??ng h?p 2: |y| >= threshold
    idx = abs(y) >= threshold;
    x(idx) = sign(y(idx)) .* exp(abs(y(idx)) * (1 + log(A)) - 1) / A;
end
