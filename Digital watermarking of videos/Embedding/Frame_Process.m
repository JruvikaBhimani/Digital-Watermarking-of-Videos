
function Frame_Process(value,path)

%{
path='C:\Users\Neha\Desktop\Final\My Movie.wmv';
a=imread('F:\m_img.jpg');
value=im2bw(a);
%}
flag=0;

mkdir('F:\B.E. Project\bin\embedding\m_frames');

readerobj = VideoReader(path);  % mmreader used as it supports all file formats
numFrames = readerobj.NumberOfFrames; %extracts number of frames in video
%disp(numFrames);
numFtrames=100;
water=value;

x=size(water,1);
y=size(water,2);

wait_bar=waitbar(0,'Embedding Watermark into Video','Name','Embedding','CreateCancelBtn',...
            'setappdata(gcbf,''canceling'',1)');
setappdata(wait_bar,'canceling',0);
%numFrames=100;
%i=2;
for i=1:numFrames
    j=int2str(i);
    k=strcat('f:\B.E. Project\bin\embedding\frames\frame',j,'.jpeg');
    
    I=imread(k);

    M=size(I,1);
    N=size(I,2);
    
    %disp('m: '); disp(M);
    %disp('n: ');disp(N);
    %disp('x: ');disp(x);
    %disp('y: ');disp(y);
    
    num=sqrt((M*N)/(x*y));
    
    %disp(num);
    %fun1=@(z,l) counter(z,l);
    %fun=@(block_struct) water_embed(block_struct.data,water(:)); %need some sort of counter to know position of watermark_image pixel
    %b=blockproc(I,[200 200],fun);    

    num=floor(num);

    %padding
    pad1=0;pad2=0;

    rem1=mod(M,num);
    rem2=mod(N,num);

    if rem1~=0 
        pad1=num-rem1;
    end

    if rem2~=0
        pad2=num-rem2;
    end

    I=padarray(I,[pad1 pad2],0,'post');

    M=size(I,1);
    N=size(I,2);

    W_Frame=I;

    pos_X=1;pos_Y=1;block_s=1;block_e=1;

    while pos_X <= x && block_s < M
       block_frame=I(block_s:(block_s+num-1), block_e:(block_e+num-1));

       water_pixel=water(pos_X, pos_Y);

       W_Frame(block_s:(block_s+num-1), block_e:(block_e+num-1))=water_embed(block_frame, water_pixel);

       pos_Y = pos_Y + 1;
       block_e = block_e + num;

       if pos_Y > y
           pos_X = pos_X + 1;
           pos_Y = 1;
           block_s = block_s + num;
           block_e = 1;
       end
    end

    %{
    if block_e < M
        for rem_X=1:M
            for rem_Y=block_e:N
                W_Frame(rem_X,rem_Y)=I(rem_X,rem_Y);
            end
        end
    end

    if block_s < M
        for rem_X=block_s:M
            for rem_Y=1:N
                W_Frame(rem_X,rem_Y)=I(rem_X,rem_Y);
            end
        end
    end
    %}

    %imtool(W_Frame);
    
    name=strcat('F:\B.E. Project\bin\embedding\m_frames\m_frame',int2str(i),'.jpeg');
    imwrite(W_Frame,name);
   % disp(i);
    msg=strcat('Embedding Watermark into Video: ',int2str(i),'/',int2str(numFrames));
    waitbar(i/numFrames,wait_bar,msg);
      if getappdata(wait_bar,'canceling')
          flag=1;
          break
      end
    
end
delete(wait_bar);

% call to frame to video file
% location=Save_Video;
if ~flag
      Save_Video;
else
    rmdir('F:\B.E. Project\bin\embedding\m_frames','s');
end
