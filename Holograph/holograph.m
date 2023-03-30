clear all
close all
clc
img = imread('File_name');
img = im2double(img);
d =0.985;                                   %the distence for the q func
z = d;                                      %the distance in the reference func
M = 5496;                                   %hologram column
N = 3672;                                   %hologram row

pixel_M = 2.4 * 10^(-6);                    %pixel column
pixel_N = 2.4 * 10^(-6);                    %pixel row
lambda = 633*10^(-9);                       %wavelength
tet = 0.0;                                  %the angle of the reference                      (angle)
A = 100;                                    %the amplitude                                   (wave ampitude)
img = A.*img;

figure(1);                                  %image of the object
imagesc(img);
title("image of the object");
[m,n]=meshgrid(-M/2:M/2-1,-N/2:N/2-1);      %grid for the q func

delta_pixel_M = lambda*d/(pixel_M*M);
delta_pixel_N =  lambda*d/(pixel_N*N);

reference=15*exp((2*i*pi*(tet*m.*pixel_M+tet*n.*pixel_N +z))/(lambda));        %the reference func   (reference amplitude, 0 in one of x,y)

img = img.*conj(reference);
