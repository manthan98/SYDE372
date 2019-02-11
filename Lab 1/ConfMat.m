function [confusion_matrix, exp_error_rate] = ConfMat(starting_x, starting_y, Z, z_A, z_B, z_C)

    %inputs are as follows:
    %starting_x - 
    %starting_y - 
    %Z - contour map, positive values denote "B" predictions, negative
    %values denote "A" predictions
    %z_A - sample points belonging to the A class
    %z_B - sample points belonging to the B class
    %z_C - sample points belonging to the C class (optional)
    
    if nargin < 6
        %stores num correct predictions for class a (actually a and classified as a)
        a_correct = 0;
        %stores num incorrect predictions for class a (actually a but classified as b)
        a_wrong = 0;
        b_correct = 0;
        b_wrong = 0;
        for i = 1:size(z_A, 1)
            %find the column index of the point in the Z matrix we must check
            %by comparing the x value of the current point to the first x value
            %in the X matrix
            %Assumes that the X/Y matrices increment by 0.2
            col_ind = int16((z_A(i, 1) - starting_x)/0.2 + 1);
            row_ind = int16((z_A(i, 2) - starting_y)/0.2 + 1);
            if Z(row_ind, col_ind) > 0
                a_wrong = a_wrong + 1;
            else
                a_correct = a_correct + 1;
            end
        end
        for i = 1:size(z_B, 1)
            %find the column index of the point in the Z matrix we must check
            %by comparing the x value of the current point to the first x value
            %in the X matrix
            %Assumes that the X/Y matrices increment by 0.2
            col_ind = int16((z_B(i, 1) - starting_x)/0.2 + 1);
            row_ind = int16((z_B(i, 2) - starting_y)/0.2 + 1);
            if Z(row_ind, col_ind) > 0
                b_correct = b_correct + 1;
            else
                b_wrong = b_wrong + 1;
            end
        end

        %overall the confusion matrix should look like the following 

        %|classified correcly as a     a but classified as b    |
        %|b but classified as a        classified correctly as b|

        confusion_matrix = [a_correct b_wrong;a_wrong b_correct];
        exp_error_rate = (a_wrong + b_wrong) / (a_correct + b_correct);
    else
        a_correct = 0;
        a_pred_b = 0;
        a_pred_c = 0;
        b_correct = 0;
        b_pred_a = 0;
        b_pred_c = 0;
        c_correct = 0;
        c_pred_a = 0;
        c_pred_b = 0;
        
        for i = 1:size(z_A, 1)
            %find the column index of the point in the Z matrix we must check
            %by comparing the x value of the current point to the first x value
            %in the X matrix
            %Assumes that the X/Y matrices increment by 0.2
            col_ind = int16((z_A(i, 1) - starting_x)/0.2 + 1);
            row_ind = int16((z_A(i, 2) - starting_y)/0.2 + 1);
            switch Z(row_ind, col_ind)
                case 1
                    a_correct = a_correct + 1;
                case 2
                    a_pred_b = a_pred_b + 1;
                case 3
                    a_pred_c = a_pred_c + 1;
            end
        end
        
        for i = 1:size(z_B, 1)
            %find the column index of the point in the Z matrix we must check
            %by comparing the x value of the current point to the first x value
            %in the X matrix
            %Assumes that the X/Y matrices increment by 0.2
            col_ind = int16((z_B(i, 1) - starting_x)/0.2 + 1);
            row_ind = int16((z_B(i, 2) - starting_y)/0.2 + 1);
            switch Z(row_ind, col_ind)
                case 1
                    b_pred_a = b_pred_a + 1;
                case 2
                    b_correct = b_correct + 1;
                case 3
                    b_pred_c = b_pred_c + 1;
            end
        end
        
        for i = 1:size(z_C, 1)
            %find the column index of the point in the Z matrix we must check
            %by comparing the x value of the current point to the first x value
            %in the X matrix
            %Assumes that the X/Y matrices increment by 0.2
            col_ind = int16((z_C(i, 1) - starting_x)/0.2 + 1);
            row_ind = int16((z_C(i, 2) - starting_y)/0.2 + 1);
            switch Z(row_ind, col_ind)
                case 1
                    c_pred_a = c_pred_a + 1;
                case 2
                    c_pred_b = c_pred_b + 1;
                case 3
                    c_correct = c_correct + 1;
            end
        end
        
        confusion_matrix = [a_correct b_pred_a c_pred_a;a_pred_b b_correct c_pred_b;a_pred_c b_pred_c c_correct];
        exp_error_rate = (a_pred_b + a_pred_c + b_pred_a + b_pred_c + c_pred_a + c_pred_b)/(a_correct + b_correct + c_correct);
    end
end

