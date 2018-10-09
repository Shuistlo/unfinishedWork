%lab 1
help conv2 %should give you commands for conv2(I,H,Shape) I = image as matrix h = mask as matrix, shape = size + output
help fspecial % fspecial will generate masks commonly used in image processing 

%import rooster.jpg and boxes.pgm
%convert to greyscale: colormap('gray');
%convert to double data type: im2double();
%use fspecial on both to create masks