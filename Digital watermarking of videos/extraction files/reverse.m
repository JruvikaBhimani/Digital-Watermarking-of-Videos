
% 1st pseudo number generated using RC4 algorithm and second pseudo number
% generated using random number generator of MATLAB.

%function [a]=pseudo_1(im)
    %im=water_image.img;
    function reverse(path,key,loc)
   %{
     wait_bar=waitbar(0,'Modulating Watermark.....','CreateCancelBtn',...
            'setappdata(gcbf,''canceling'',1)');
        setappdata(wait_bar,'canceling',0)
     %}   
    f1=path;
    %f1=rgb2gray(f1);
    
    %imtool(f1);
    w=size(f1,1);
    h=size(f1,2);
    %disp(key);
    num=key;  %to find keylen
    keylen=0;
    
    while(num>0) % finding keylength
      keylen=keylen+1;
      num=num/10;
      num=fix(num);
    end

    i=keylen;
    k=zeros(1,keylen);
 
    while(key>0)    %converting complete integer key to an integer array.
       k(i)=(mod(key,10));
       key=fix(key/10);
       i=i-1;
    end
    
    randm=zeros(1,256);
    temp=zeros(1,256);
    
    for i=1:256        %initializing temp array iteratively with key.
       randm(i)=i-1;
       temp(i)=(k(mod(i-1,keylen)+1));
    end

    j=0;
    for i=1:256      %initial permutaion of s which uses key via temp array
       c=(j+randm(i)+temp(i));
       j=(mod(c,256));
       j=j+1;
       x=randm(j);     %swapping of s[i], s[j].
       randm(j)=randm(i);
       randm(i)=x;
    end
    
    i=1;j=1;
    value=zeros(w,h,'uint8');
    
    for i1=1:w                       % modulation of watermark
        for j1=1:h                  % for loop going til height & width of image
            
            i=(mod((i+1),256));
            i=i+1;
            j=(mod((j+randm(i)),256));
            j=j+1;
    
            x=randm(i);
            randm(i)=randm(j);
            randm(j)=x;
    
            y=(mod((randm(i)+randm(j)),256));
            y=y+1;
               
            pseudo_num=randm(y);
            
             if pseudo_num<=127
                pseudo_num=0;
            else
                pseudo_num=1;
            end
   
            binary_num1=dec2bin(pseudo_num,8);    
            binary_num2=dec2bin(f1(i1,j1),8);
                
            v=modulation(binary_num1,binary_num2);   %calling modulation function
                       
            vstr=int2str(v);
            v=bin2dec(vstr);
          %{
             if(v>=0 && v<=127)
                v=0;
            else
                v=255;
            end
            %}
            %v=v*rand(1,1);           % multiplication of 2nd pseudo number
           %v=round(v);
            if v==1
                v=255;
            end
           
            
            value(i1,j1)=v;          % final pixel value written in image
      
        end
        %{
         waitbar(i1/w);
         
          if getappdata(wait_bar,'canceling')
             break
          end
        %}
    end
    %delete(wait_bar);
    value=im2bw(value);
    %imtool(value);
    imwrite(value,loc);
    %imtool(value);
%uiputfile('*.jpeg','save','f:\m_img.jpeg');
% to be called from gui file....

%how to do parallel execution of files...????
