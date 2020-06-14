% teste pca_ica com imagem

a = imread('s1.jpg','jpg');
a = round((double(a(:,:,1))+double(a(:,:,2))+double(a(:,:,3)))/3);
[tx, ty]=size(a);
% Converte de Uint8 para double array
Ia=double(a);
tamanho = (tx*ty);
u1 = reshape(Ia,1,tamanho);
%--------------------------------------------------------------------------
b=imread('s2.jpg','jpg');
b=round((double(b(:,:,1))+double(b(:,:,2))+double(b(:,:,3)))/3);
[tx, ty]=size(b);
% Converte de Uint8 para double array
Ib=double(b);
tamanho = (tx*ty);
u2 = reshape(Ib,1,tamanho);
%--------------------------------------------------------------------------
u = [double(u1); double(u2)];
a = rand(2);

x = a * u;

[y,w] = pca_ica(x);

y1 = reshape(y(1,:),128,128);
y2 = reshape(y(2,:),128,128);


figure(1);
subplot(1,2,1); imagesc(Ia); title('Imagem 1');axis square; 
subplot(1,2,2); imagesc(Ib); title('Imagem 2');axis square;
colormap gray;

figure(2);
subplot(1,2,1); imagesc(y1); title('Imagem 1');axis square; 
subplot(1,2,2); imagesc(y2); title('Imagem 2');axis square;
colormap gray;


