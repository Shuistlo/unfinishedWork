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

elephant1 = imread('elephant.png');
elephant1 = im2double(elephant1);
elephant1 = mat2gray(elephant1);

gab = gabor(4,8,90,0.5,0);
Igab = conv2(elephant1, gab, 'valid');

gab90 = gabor(4,8,90,0.5,90);
Igab90 = conv2(elephant1, gab90, 'valid');
effort = L2(Igab, Igab90);

figure(5), subplot(1,3,1), imagesc(Igab); colorbar
subplot(1,3,2), imagesc(effort); colorbar
subplot(2,2,3), imagesc(By1);
subplot(2,2,4), imagesc(Yb1);

% making all the required convolutions using gabor masks
% naming variables: convxpy = convolution with mask with orientation = x and
% phase = x
conv0p0 = conv2(elephant1,gabor(4,8,0,0.5,0),'valid');
conv0p90 = conv2(elephant1,gabor(4,8,0,0.5,90),'valid');
conv0 = L2(conv0p0,conv0p90);
conv15p0 = conv2(elephant1,gabor(4,8,15,0.5,0),'valid');
conv15p90 = conv2(elephant1,gabor(4,8,15,0.5,90),'valid');
conv15 = L2(conv15p0,conv15p90);
conv30p0 = conv2(elephant1,gabor(4,8,30,0.5,0),'valid');
conv30p90 = conv2(elephant1,gabor(4,8,30,0.5,90),'valid');
conv30 = L2(conv30p0,conv30p90);
conv45p0 = conv2(elephant1,gabor(4,8,45,0.5,0),'valid');
conv45p90 = conv2(elephant1,gabor(4,8,45,0.5,90),'valid');
conv45 = L2(conv45p0,conv45p90);
conv60p0 = conv2(elephant1,gabor(4,8,60,0.5,0),'valid');
conv60p90 = conv2(elephant1,gabor(4,8,60,0.5,90),'valid');
conv60 = L2(conv60p0,conv60p90);
conv75p0 = conv2(elephant1,gabor(4,8,75,0.5,0),'valid');
conv75p90 = conv2(elephant1,gabor(4,8,75,0.5,90),'valid');
conv75 = L2(conv75p0,conv75p90);
conv90p0 = conv2(elephant1,gabor(4,8,90,0.5,0),'valid');
conv90p90 = conv2(elephant1,gabor(4,8,90,0.5,90),'valid');
conv90 = L2(conv90p0,conv90p90);
conv105p0 = conv2(elephant1,gabor(4,8,105,0.5,0),'valid');
conv105p90 = conv2(elephant1,gabor(4,8,105,0.5,90),'valid');
conv105 = L2(conv105p0,conv105p90);
conv120p0 = conv2(elephant1,gabor(4,8,120,0.5,0),'valid');
conv120p90 = conv2(elephant1,gabor(4,8,120,0.5,90),'valid');
conv120 = L2(conv120p0,conv120p90);
conv135p0 = conv2(elephant1,gabor(4,8,135,0.5,0),'valid');
conv135p90 = conv2(elephant1,gabor(4,8,135,0.5,90),'valid');
conv135 = L2(conv135p0,conv135p90);
conv150p0 = conv2(elephant1,gabor(4,8,150,0.5,0),'valid');
conv150p90 = conv2(elephant1,gabor(4,8,150,0.5,90),'valid');
conv150 = L2(conv150p0,conv150p90);
conv165p90 = conv2(elephant1,gabor(4,8,165,0.5,90),'valid');
conv165 = L2(conv165p0,conv165p90);


figure(1);
% Section 4.1
% Plot image of convolution with orientation = 90 phase = 0
subplot(1,3,1), imagesc(conv90p0); colorbar

% Section 4.2
% Combine the mask with orientation = 90 phase 90 with the mask from 4.1
% using L2 norm for each element in the matrix. Use this combined mask to
% convolve.
subplot(1,3,2), imagesc(conv90); colorbar

% Section 4.3
% Make complex cells for the orientations [0, 15, 30, ..., 165] (i.e. do
% 4.2 for all the other orientations). Then combine these results by taking
% max at each pixel.

% First we make a 3D matrix where the 3rd dimension is the orientation and
% we store all convolutions in there
Ic = cat(3,conv0,conv15,conv30,conv45,conv60,conv75,conv90,conv105,conv120,conv135,conv150,conv165);

% Next we combine all convolutions by taking the max at each pixel.
result = max(Ic, [], 3);

subplot(1,3,3), imagesc(result); colorbar

%write a function in matlab
function c = corr130(img, s)
    I = img(1:60,1:30);
    Is = img(1:60, (1+s):(30+s));
    c = corr2(I,Is);
end

function y = L2(A,B)
    n = size(A);
    n = n(1);
    C = zeros(n,n);
    for i=1:1:n
       for j=1:1:n
           C(i,j) = sqrt(A(i,j)^2+B(i,j)^2);
       end
    end
    y = C;
end
