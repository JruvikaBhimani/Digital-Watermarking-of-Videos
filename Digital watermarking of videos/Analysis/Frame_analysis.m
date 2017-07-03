function [total_PSNR] = Frame_analysis(path1,path2)

%path1='F:\B.E. Project\bin\extraction\original\frame';
%path2='F:\B.E. Project\bin\extraction\modulated\frame';

total_PSNR=0;
no=1;

while 1
  % disp(no);
    num=int2str(no);
    path_org=strcat(path1,'\frame',num,'.jpeg');
    path_mod=strcat(path2,'\frame',num,'.jpeg');
    
    
    if exist(path_org) && exist(path_mod)
        Frame1=imread(path_org);
        Frame2=imread(path_mod);
        M=size(Frame1,1);
        N=size(Frame1,2);
        diff_add=0;
        for i=1:M
            for j=1:N
                diff=Frame1(i,j)-Frame2(i,j);
                diff=diff*diff;
                diff_add=double(diff_add+diff);

            end
        end
        %imtool(a);
        %disp(diff_add);
        MSE=double(diff_add/(M*N));

        %disp('MSE: '); disp(MSE);

        PSNR=10*log10((255*255)/MSE);

        no=no+1;
        total_PSNR=total_PSNR+PSNR;
        %disp(total_PSNR);
        %{
        if no==101
            break;       
        end
        %}
    else
        break;
    end
end

no=no-1;
total_PSNR = (total_PSNR/no);
%disp('PSNR:'); disp(total_PSNR);
%tooo high average PSNR shld be 37.72db

