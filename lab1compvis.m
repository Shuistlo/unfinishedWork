Ir = imread('rooster.jpg');
Ir = rgb2gray(Ir);
Ir = im2double(Ir);
Iw = imread('woods.png');
Iw = im2double(Iw);

Iwp1 = Iw(2:60,:); %this should be one pixel shift image piece
Iwp = Iw(1:59,:); %image fragment
whos
f=corr2(Iwp, Iwp1);
disp(f);

%write a function in matlab
function c = corr130(img, s)
    I = img(1:60,:);
    Is = img((1+s):(60+s),:);
    c = corr2(I,Is);
end

term = 0:29; %trying to make a vector of values 0 to 29
roos = 0:29;
wood = 0:29;
counter = 0;
while counter< 30
    roos(counter) = corr130(Ir, counter);
    wood(counter) = corr130(Iw, counter);
    counter = counter +1;
end

scatter(term, roos); %plot these correctly in the same figure
scatter(term, wood);

%Plot a graph of shift vs correlation coefficient for both the rooster and the woods image.
%Include in your report a print out of this figure and a print out of your code. Briefly describe and
%explain the results you have obtained

gaus6 = fspecial('gaussian', 5,6);
gaus2 = fspecial('gaussian', 5,2);
DoG = gaus6 - gaus2;

Rconv = conv2(Ir, DoG, 'same');
Wconv = conv2(Iw, DoG, 'same');

counter = 0;
while counter< 30
    roos(counter) = corr130(Rconv, counter);
    wood(counter) = corr130(Wconv, counter);
    counter = counter +1;
end

scatter(term, roos); %plot these properly
scatter(term, wood);

gaus4 = fspecial('gaussian', 5, 4);
gaus05 = fspecial('gaussian', 5, 0.5);
DoG = gaus4 - gaus05;

Rconv = conv2(Ir, DoG, 'same');
Wconv = conv2(Iw, DoG, 'same');

counter = 0;
while counter< 30
    roos(counter) = corr130(Rconv, counter);
    wood(counter) = corr130(Wconv, counter);
    counter = counter +1;
end

scatter(term, roos); %plot these properly
scatter(term, wood);

%Plot graphs of shift vs correlation coefficient for both the rooster and the woods image after
%convolution with both the DoG masks. Include in your report a print out of this figure. Briefly
%explain why the results for the two DoG masks differ, also explain why the current results differ
%from those in the previous section.
