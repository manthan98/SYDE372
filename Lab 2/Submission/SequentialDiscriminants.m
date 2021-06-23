function [res, nabres, nbares] = SequentialDiscriminants(a, b)
    j = 1;
    X = 1: max(max(a(:,1)), max(b(:,1)));
    Y = 1: max(max(a(:,2)), max(b(:,2)));
    res = zeros(length(X),length(Y),0);
    nabres = 0;
    nbares = 0;
    while ~isempty(a(:,1)) && ~isempty(b(:,1))
        sizeA = length(a(:,1));
        sizeB = length(b(:,1));
        ia=randi([1 sizeA],1,1);
        randPointA = a(ia,:);
        ib=randi([1 sizeB],1,1);
        randPointB = b(ib,:);
        points = MED(X, Y, randPointA, randPointB);
        nab = 0;
        nba = 0;
        for k = 1:length(a(:,1)) 
            if points(a(k,1), a(k,2)) > 0
                nab = nab + 1;
            end
        end

        for k = 1:length(b(:,1))
            if points(b(k,1), b(k,2)) < 0
                nba = nba + 1;
            end
        end
        
        if nab == 0 || nba == 0
           res(:,:,j) = points;
           nabres(j) = nab;
           nbares(j) = nba;
           j = j + 1;
        
            if nab == 0
                i = 1;
                while i <= length(b(:,1))
                    if points(b(i,1), b(i,2)) > 0
                        b(i,:) = [];
                    else
                        i = i + 1;
                    end
                end
            end 

            if nba == 0
                c = 1;
                while c <= length(a(:,1))
                    if points(a(c,1), a(c,2)) < 0
                        a(c,:) = [];
                    else
                        c = c + 1;
                    end
                end
            end
        end
    end
end