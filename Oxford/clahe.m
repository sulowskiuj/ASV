clear all
close all
clc
%% Library and paths
run ../vlfeat-0.9.18/toolbox/vl_setup
dataset_dir = './Oxford_dataset/';
Lname = {'bark','bikes','boat','graf','leuven','trees','ubc','wall'};


%% apply clahe to each image
tic
for i = 1:8
    for j = 1:6
        fprintf('i:%d  j:%d\n',i,j);
        path_to_read = [dataset_dir,Lname{i},'/img',num2str(j),'.ppm'];
        path_to_save = [dataset_dir,Lname{i},'/img',num2str(j),'_c.ppm'];
        im1 = imread(path_to_read);
        [rows, columns, numberOfColorBands] = size(im1);
        
        if numberOfColorBands == 3
            im1_gray = rgb2gray(im1);
        else
            img1_gray = im1;
        end
        
        im1_clahed = adapthisteq(im1_gray,'clipLimit',0.02,'Distribution','rayleigh');
        imwrite(im1_clahed, path_to_save, 'ppm');
    end
end
fprintf('time cost: %.2f mins\n',toc/60);