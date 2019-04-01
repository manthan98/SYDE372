function [res] = SplitArrays( arr )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    res1 = zeros(16,2);
    res2 = zeros(16,2);
    res3 = zeros(16,2);
    res4 = zeros(16,2);
    res5 = zeros(16,2);
    res6 = zeros(16,2);
    res7 = zeros(16,2);
    res8 = zeros(16,2);
    res9 = zeros(16,2);
    res10 = zeros(16,2);
    res = zeros(16,2,10);
    for j = 1:length(arr)
       if arr(3,j) == 1
           res1(arr(4,j),:) = [arr(1,j), arr(2,j)];
       elseif arr(3,j) == 2
           res2(arr(4,j),:) = [arr(1,j), arr(2,j)];
       elseif arr(3,j) == 3
           res3(arr(4,j),:) = [arr(1,j), arr(2,j)];
       elseif arr(3,j) == 4
           res4(arr(4,j),:) = [arr(1,j), arr(2,j)];
       elseif arr(3,j) == 5
           res5(arr(4,j),:) = [arr(1,j), arr(2,j)];
       elseif arr(3,j) == 6    
           res6(arr(4,j),:) = [arr(1,j), arr(2,j)];
       elseif arr(3,j) == 7
           res7(arr(4,j),:) = [arr(1,j), arr(2,j)];
       elseif arr(3,j) == 8
           res8(arr(4,j),:) = [arr(1,j), arr(2,j)];
       elseif arr(3,j) == 9
           res9(arr(4,j),:) = [arr(1,j), arr(2,j)];
       elseif arr(3,j) == 10
           res10(arr(4,j),:) = [arr(1,j), arr(2,j)];
       end    
    end
    res(:,:,1) = res1;
    res(:,:,2) = res2;
    res(:,:,3) = res3;
    res(:,:,4) = res4;
    res(:,:,5) = res5;
    res(:,:,6) = res6;
    res(:,:,7) = res7;
    res(:,:,8) = res8;
    res(:,:,9) = res9;
    res(:,:,10) = res10;
end

