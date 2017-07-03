function [sum] = extracted_correlation(path_w,path_e)
%path_w='C:\Users\HP\Desktop\logo.jpg';
%path_e='C:\Users\HP\Desktop\New folder\a2.jpeg';

img1=imread(path_w);
img1=im2bw(img1);
no=1;sum=0;
while 1
    n=int2str(no);
    pathe=strcat(path_e,'\a',n,'.jpeg');
   
    if exist(pathe)
        img2=imread(pathe);
        img2=im2bw(img2);
        %imtool(img1);
        %imtool(img2);
        sum1=0;
        sum2=0;

        for i=1:size(img1,1)
            for j=1:size(img1,2)
                a=img1(i,j);
                b=img2(i,j);
                sum1=(sum1+a*b);
                sum2=(sum2+a*a);
            end
        end
        %disp(sum1);
        %disp(sum2);
        %disp(i);
        %disp(j);
        nc=double(sum1/sum2);
        sum=sum+nc;
        no=no+1;
        else
                break;
    end
end
no=no-1;
sum=sum/no;

%disp('nc: '); disp(nc);