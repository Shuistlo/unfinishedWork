Ir = imread('rooster.jpg');
Ir = im2double(Ir);
Iro = rgb2gray(Ir);
Iw = imread('woods.png');
Iw = im2double(Iw);

Iwp1 = Iw(2:60,:); %this should be one pixel shift image piece
Iwp = Iw(1:59,:); %image fragment
whos
f=corr2(Iwp, Iwp1);
disp(f);

term = 1:29; %trying to make a vector of values 0 to 29
roos = [];
wood = [];
counter = 1;
while counter< 30
    roos(counter) = corr130(Iro, counter);
    wood(counter) = corr130(Iw, counter);
    counter = counter +1;
end

figure(1), subplot(2,2,1), scatter(term, roos); 
subplot(2,2,2), scatter(term, wood); 

%Plot a graph of shift vs correlation coefficient for both the rooster and the woods image.
%Include in your report a print out of this figure and a print out of your code. Briefly describe and
%explain the results you have obtained

gaus6 = fspecial('gaussian', 36,6);
gaus2 = fspecial('gaussian', 36,2);
DoG = gaus6 - gaus2;

Rconv = conv2(Iro, DoG, 'same');
Wconv = conv2(Iw, DoG, 'same');

counter = 1;

%Plot graphs of shift vs correlation coefficient for both the rooster and the woods image after
%convolution with both the DoG masks. Include in your report a print out of this figure. Briefly
%explain why the results for the two DoG masks differ, also explain why the current results differ
%from those in the previous section

while counter< 30
    roos(counter) = corr130(Rconv, counter);
    wood(counter) = corr130(Wconv, counter);
    counter = counter +1;
end

figure(2), subplot(2,2,1), scatter(term, roos); 
subplot(2,2,2), scatter(term, wood); 

gaus4 = fspecial('gaussian', 24, 4);
gaus05 = fspecial('gaussian', 24, 0.5);
DoG = gaus4 - gaus05;

Rconv = conv2(Iro, DoG, 'same');
Wconv = conv2(Iw, DoG, 'same');

counter = 1;
while counter< 29
    roos(counter) = corr130(Rconv, counter);
    wood(counter) = corr130(Wconv, counter);
    counter = counter +1;
end

subplot(2,2,3), scatter(term, roos); 
subplot(2,2,4), scatter(term, wood); 

%Plot graphs of shift vs correlation coefficient for both the rooster and the woods image after
%convolution with both the DoG masks. Include in your report a print out of this figure. Briefly
%explain why the results for the two DoG masks differ, also explain why the current results differ
%from those in the previous section.

gaus2 = fspecial('gaussian', 18, 2);
gaus3 = fspecial('gaussian', 18, 3);

gaus2(1:18) = gaus3(1:18);
counter = 2;
counterend = 18;
while(counter < counterend)
    gaus2(counter, 1) = gaus3(counter, 1);
    gaus2(counter,18) = gaus3(counter, 18);
    counter = counter + 1;
end
gaus2(18,:) = gaus3(18,:);

Rg1=conv2(Ir(:,:,1),gaus2,'same');
Gr1 = conv2(Ir(:,:,2),gaus2, 'same');
By1 = conv2(Ir(:,:,3),gaus2, 'same');
Yb1 = conv2(mean(Ir(:,:,1:2),3),gaus2, 'same');

figure(3), subplot(2,2,1), imagesc(Rg1); 
subplot(2,2,2), imagesc(Gr1);
subplot(2,2,3), imagesc(By1);
subplot(2,2,4), imagesc(Yb1);

%3.2.1:In your report include a print out of the figure with four subplots that you have just created.
%Briefly describe and explain the results you have obtained.

gaus2 = fspecial('gaussian', 18, 2);
Rg1=conv2(Ir(:,:,1),gaus2,'same');
Gr1 = conv2(Ir(:,:,2),gaus2, 'same');
By1 = conv2(Ir(:,:,3),gaus2, 'same');
Yb1 = conv2(mean(Ir(:,:,1:2),3),gaus2, 'same');

figure(4), subplot(2,2,1), imagesc(Rg1); 
subplot(2,2,2), imagesc(Gr1);
subplot(2,2,3), imagesc(By1);
subplot(2,2,4), imagesc(Yb1);

%3.2.2: In your report include a print out of the figure with four subplots that you have just created.
%Briefly describe and explain the results you have obtained.

Ie = imread('elephant.png');
Ie = im2double(Ie);
Ie = rgb2gray(Ie);


Igab = conv2(Ie, gab, 'valid');

gab90 = gabor(4,8,90,0.5,90);
Igab90 = conv2(Ie, gab90, 'valid');

%write a function in matlab
function c = corr130(img, s)
    I = img(1:60,1:30);
    Is = img(1:60, (1+s):(30+s));
    c = corr2(I,Is);
end
