clear
%%membaca File dan Meresize
I = imread ('sawah1.JPG');
i = imresize(I, [281 500]);

%%Memisahkan Citra Menjadi 3 Layer (Red Green Blue)
R = i(:,:,1);
G = i(:,:,2);   
B = i(:,:,3);

%%Mengubah Citra RGB Menjadi HSV
rgbtohsv = rgb2hsv(i);

%%memisahkan citra hsv menjadi 3 layer HSV
H = rgbtohsv(:,:,1);
S = rgbtohsv(:,:,2);
V = rgbtohsv(:,:,3);

%%rata2 HSV
mh = mean(mean(H));
ms = mean(mean(S));
mv = mean(mean(V));

%%rata2 RGB
mr = mean(mean(R));
mg = mean(mean(G));
mb = mean(mean(B));

%%Mengubah citra menjadi citra merah hijau biru
Red = cat(3,R,G*0,B*0);
Green = cat(3,R*0,G,B*0);
Blue = cat(3,R*0,G*0,B);

figure(1);
subplot(2,2,1); imshow(I); title('Citra Asli');
subplot(2,2,2); imshow(i); title('Citra Resize');
subplot(2,2,3); imhist(i); title('Histogram Gambar');
subplot(2,2,4); imshow(rgbtohsv); title('Citra hsv');

figure(2);
subplot(2,2,1); imshow(Red); title('Citra Merah');
subplot(2,2,2); imshow(Green); title('Citra Hijau');
subplot(2,2,3); imshow(Blue); title('Citra Biru');

xlswrite('Citra H.xlsx', H);
xlswrite('Citra R.xlsx', R);
xlswrite('Citra G.xlsx', G);
xlswrite('Citra B.xlsx', B);



