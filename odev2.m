% Kanal kontrollü
I = imread('C:\Users\ASUS\Desktop\zebra.jpg');
imshow(I);
[m,n,d] = size(I);
if(d==3)
    I=rgb2gray(I);
end

% Aydýnlatma Fonksiyonu
gamma_1 = 0.2;
r=double(I)/255;
s = r.^gamma_1;
Is=uint8(s*255);
figure_1 = imshow(Is); 
imhist(Is);
title('Parlak Resim');

% % Karartma Fonksiyonu
gamma_2 = 2;
r_2=double(I)/255;
s_2 = r_2.^gamma_2;
Is_2=uint8(s_2*255);
figure_2 = imshow(Is_2); 
title('Karartýlmýþ Resim');

% Kontrast Daraltma (Düþük Kontrast)
I_k = round((I_k+128)*(128+40))/2;
imshow(I_k);
imhist(I_k);

% Histogram Eþitleme
max_r=256;

aralik=zeros(256,1);
for i=0:255
    aralik(i+1)=sum(sum(I_k==i));
end
p=aralik/(size(I_k,1)*size(I_k,2));
s=(max_r-1)*cumsum(p);
s=round(s);
son_hal=uint8(zeros(size(I_k)));
for k=1:size(s,1)
    son_hal(I_k==k-1)=s(k);
end
imshow(son_hal);
imhist(son_hal);
