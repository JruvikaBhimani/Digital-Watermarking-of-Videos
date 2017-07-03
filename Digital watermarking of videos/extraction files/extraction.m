function extraction(numFrames,img_path)
%{
[filename,pathname]=uigetfile({'*.jpg;*.jpeg;*.jpe;*.jfif','JPEG(*.jpg;*.jpeg;*.jpe;*.jfif)';...
    '*.png','PNG(*.png)';...
    '*.bmp','BMP(*.bmp)';...
    '*.gif','GIF(*.gif)';...
    '*.tif;*.tiff','TIFF(*.tif;*.tiff)'},...
    'select original logo','C:\Users\HP\Desktop\',100,100);
    k=strcat(pathname,filename);
%}
    img=imread(img_path);
    
    
[pathname]=uigetdir('C:\Users\HP\Desktop\','Select Directory to save watermark');
 a=pathname;   
if(pathname==0)
    msgbox('Location not selected');
    uiwait();    
end

name=inputdlg('Enter the name: ','',1);
loc=strcat(a,'\',name{1});
flag=0;
 question_ans = questdlg(strcat('Confirm Name: ',loc),...
                        'Confirmation','OK','Cancel','Cancel');
            
 if (strcmpi(question_ans,'OK'))
   
  key1=inputdlg('Enter PASSKEY','',1);
  if ~isempty(key1)
  key=str2num(key1{1});
  
     wait_bar=waitbar(0,'Extracting Watermark from Video','Name','Extraction','CreateCancelBtn',...
            'setappdata(gcbf,''canceling'',1)');
        setappdata(wait_bar,'canceling',0);
        
for i=1:numFrames
    l=strcat(int2str(i),'.jpeg');
    k=strcat('f:\B.E. Project\bin\extraction\original\frame',l);
    original=imread(k);
    k=strcat('f:\B.E. Project\bin\extraction\modulated\frame',l);
    modulated=imread(k);
    
    M=size(original,1);
    N=size(original,2);
    
    x=size(img,1);
    y=size(img,2);
    
    num=sqrt((M*N)/(x*y));
    num=floor(num);
    
    block_e=1; block_s=1; pos_x=1; pos_y=1;

while pos_x<=x
    
    org_Frame=original(block_s:(block_s+num-1),block_e:(block_e+num-1));
    mod_Frame=modulated(block_s:(block_s+num-1),block_e:(block_e+num-1));
    
    org_Frame=sum(sum(org_Frame));
    mod_Frame=sum(sum(mod_Frame));
    
    if mod_Frame==0 && org_Frame==0
            extracted_bit(pos_x,pos_y)=0;
    
    elseif mod_Frame>=org_Frame
            extracted_bit(pos_x,pos_y)=255;

    else 
            extracted_bit(pos_x,pos_y)=0;
    end
   
    pos_y=pos_y+1;
    block_e=block_e+num;
    
    if pos_y>y
        pos_x=pos_x+1;
        pos_y=1;
        block_s=block_s+num;
        block_e=1;
    end
    
end

extracted_bit=im2bw(extracted_bit);
%imtool(extracted_bit);
k=strcat(loc,l);
%disp(k);
%imwrite(extracted_bit,k);

reverse(extracted_bit,key,k);
msg=strcat('Extracting Watermark from Video: ',int2str(i),'/',int2str(numFrames));
waitbar(i/numFrames,wait_bar,msg);
 if getappdata(wait_bar,'canceling')
          flag=1;
        break
 end
end
 end
 delete(wait_bar);
%{
 if flag
     %remove files
 end
 %}
 end
%{
    key=123456;
     wait_bar=waitbar(0,'Modulating Watermark.....','CreateCancelBtn',...
            'setappdata(gcbf,''canceling'',1)');
        setappdata(wait_bar,'canceling',0)
        
    
   
    f1=imread();
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
   
            binary_num1=dec2bin(pseudo_num,8);    
            binary_num2=dec2bin(f1(i1,j1),8);
                
            v=modulation(binary_num1,binary_num2);   %calling modulation function
                       
            vstr=int2str(v);
            v=bin2dec(vstr);
            if v<=127
                v=0;
            else
                v=255;
            end
            
            v=v*rand(1,1);           % multiplication of 2nd pseudo number
           %{ 
            if(v>=0 && v<=127)
                v=0;
            else
                v=255;
            end
            disp(v);
            %}
            value(i1,j1)=v;          % final pixel value written in image
      
        end
         waitbar(i1/w);
         
          if getappdata(wait_bar,'canceling')
             break
          end
    end
    delete(wait_bar);
    value=im2bw(value,0.5);
      
    imtool(value);
%}
   