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


x = 0:30;
y = [];
counter = 0;
while counter< 
    
end

scatter(x,y);
