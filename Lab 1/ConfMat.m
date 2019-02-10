function [confusion_matrix] = ConfMat(starting_x, starting_y, Z, z_A, z_B)
%CONFMAT Summary of this function goes here
%   Detailed explanation goes here

    %inputs are as follows:
    %starting_x - 
    %starting_y - 
    %Z - contour map, positive values denote "B" predictions, negative
    %values denote "A" predictions
    %z_A - sample points belonging to the A class
    %z_B - sample points belonging to the B class
    
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
end

