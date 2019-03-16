function [res] = SequentialDiscriminants(a, b)
    res = [];
    j = 1;
    
    X = 1: max(max(a(:,1)), max(b(:,1)));
    Y = 1: max(max(a(:,2)), max(b(:,2)));
    while ~isempty(a(:,1)) || ~isempty(b(:,1))
        ia=randperm(length(a),1);
        randPointA = a(ia,:);
        ib=randperm(length(b),1);
        randPointB = b(ib,:);
        
        points = MED(X, Y, randPointA, randPointB);
        nab = 0;
        nba = 0;
        for i = 1:length(a(:,1))
            if points(a(i,1), a(i,2)) < 0
                nab = nab + 1;
            end
        end

        for i = 1:length(b(:,1))
            if points(b(i,1), b(i,2)) > 0
                nba = nba + 1;
            end
        end
        nab
        nba        
        if nab == 0 || nba == 0
           heather = "wrong"
           res(j) = points;
           j = j + 1;
        end
        
        if nab == 0
            i = 1;
            while i <= length(b(:,1))
                if points(b(i,1), b(i,2)) < 0
                    b(i,:) = [];
                else
                    i = i + 1;
                end
            end
        end 
        
        if nab == 0
            i = 1;
            while i <= length(a(:,1))
                if points(a(i,1), a(i,2)) > 0
                    a(i,:) = [];
                else
                    i = i + 1;
                end
            end
        end 
    end
end

