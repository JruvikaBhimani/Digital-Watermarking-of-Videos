
function Cropping (val, flag)

path='F:\B.E. Project\bin\attacks\frames\frame';

mkdir('F:\B.E. Project\bin\attacks\attacked_frames\cropping');
no=1;

while 1
    path1=strcat(path,int2str(no),'.jpeg');
    path2=strcat('F:\B.E. Project\bin\attacks\attacked_frames\cropping\frame',int2str(no),'.jpeg');
    
    if exist(path1)
        img=imread(path1);
        
        len=size(img,1)*size(img,2);  % 1 is x, 2 is y of spatial domain
       
        fin_size=val*len/100;
       
        if flag==1 %left
            fin_size=round(fin_size/size(img,1));
            
           clear fin_img;
            for i=1:size(img,1)
                for j=fin_size:size(img,2)
                    fin_img(i,j-fin_size+1)=img(i,j);
                 
                 end
            end
            
            fin_img=padarray(fin_img,[0 fin_size-1],'pre');
                        
        elseif flag==2 %right
            fin_size=round(fin_size/size(img,1));
            clear fin_img;
            
            
            for i=1:size(img,1)
                for j=1:size(img,2)-fin_size
                    
                    fin_img(i,j)=img(i,j);
                  
                end
            end
            fin_img=padarray(fin_img,[0 fin_size],'post');
            
            
        elseif flag==3 %top
            fin_size=round(fin_size/size(img,2));
           
            clear fin_img;
            for i=fin_size:size(img,1)
                for j=1:size(img,2)
                    
                    fin_img(i,j)=img(i,j);
                  
                end
            end
            
             
        elseif flag==4 %bottom
            fin_size=round(fin_size/size(img,2));
            clear fin_img;
            
            for i=1:size(img,1)-fin_size
                for j=1:size(img,2)
                   
                    fin_img(i,j)=img(i,j);
                  
                end
            end
            fin_img=padarray(fin_img,[fin_size 0],'post');
            
        else %four sides
            fin_size=fin_size/4;
            fin_size=round(fin_size);
            
            fin_size1=fin_size/size(img,2);
            fin_size1=round(fin_size1);
            
            fin_size2=fin_size/(size(img,2)-fin_size1);
            fin_size2=round(fin_size2);
            
           
            for i=fin_size1:size(img,1)-fin_size1
                for j=fin_size2:size(img,2)-fin_size2
                    fin_img(i,j)=img(i,j);
                end
            end
            disp(fin_size1);
            disp(fin_size2);
             
            %fin_img=padarray(fin_img,[size(img,1)-fin_size1 0],'pre');
           fin_img=padarray(fin_img,[33 30]);
           %fin_img=padarray(fin_img,[0 size(img,2)-fin_size1],'post');
           %fin_img=padarray(fin_img,[0 size(img,2)-fin_size1],'pre');
           imtool(fin_img);
        end
        %fin_img=imresize(fin_img,[size(img,1) size(img,2)]);
        imwrite(fin_img,path2);
        no=no+1;
        clear fin_img;
      
    else
        break;
    end
end