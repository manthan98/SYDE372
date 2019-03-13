function [ res ] = ML2D_Parzen( X, Y, pa, pb, pc )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

    res = zeros(size(X));
    for i = 1:size(X, 1)
        for j = 1:size(Y, 2)
            if pa(i, j) >= pb(i, j) && pa(i, j) >= pc(i, j)
                res(i, j) = 1;
            elseif pb(i, j) >= pa(i, j) && pb(i, j) >= pc(i, j)
                res(i, j) = 2;
            else
                res(i, j) = 3;
            end
        end
    end

end

