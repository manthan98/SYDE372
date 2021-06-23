function [ points ] = ClassifySequentialDiscriminants(a,b,sequentialDiscriminants, nab, nba)
    X = 1: max(max(a(:,1)), max(b(:,1)));
    Y = 1: max(max(a(:,2)), max(b(:,2)));
    points = zeros(length(X), length(Y));
    for i = 1:length(X)
        for k = 1:length(Y)
            j = 1;
            while j < size(sequentialDiscriminants,3) + 1
                if sequentialDiscriminants(i,k,j) > 0
                    if nab(j) == 0
                        points(k,i) = 1;
                        j = size(sequentialDiscriminants,3) + 2;
                    else
                        j = j + 1;
                    end
                elseif sequentialDiscriminants(i,k,j) < 0
                    if nba(j) == 0
                        points(k,i) = -1;
                        j = size(sequentialDiscriminants,3) +  2;
                    else
                        j = j + 1;
                    end
                else
                    j = j + 1;
                end
            end
        end
    end
end