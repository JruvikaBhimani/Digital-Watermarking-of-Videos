
function frame2vid(location)

%path='F:\B.E. Project\bin\frames\frame';
%numFrames=100;

i=1; numFrames=0;
while true
    path=strcat('F:\B.E. Project\bin\embedding\m_frames\m_frame',int2str(i),'.jpeg');
    i=i+1;
    if exist(path)
        numFrames = numFrames + 1;
    else
        break;
    end
end

%disp(numFrames);

flag=0;
wait_bar=waitbar(0,'Converting Frames to Video.....','CreateCancelBtn',...
            'setappdata(gcbf,''canceling'',1)');
setappdata(wait_bar,'canceling',0);
       
%map=colormap(gray(256));

%m(1:numFrames) = struct('cdata', zeros(readerobj.Height, readerobj.Width, 'uint8'),...
  %         'colormap',gray(255));

vidObj = VideoWriter(location);

open(vidObj);
path='F:\B.E. Project\bin\embedding\m_frames\m_frame';
for i=1:numFrames
    
    l=strcat(int2str(i),'.jpeg');
    j= strcat(path,l);   % path
    k=imread(j);
    
    m(i)=im2frame(k,gray(256));
    
    writeVideo(vidObj,m(i)); 
   
     waitbar(i/numFrames);
     if getappdata(wait_bar,'canceling')
          flag=1;
          break;
     end
end

close(vidObj);

delete(wait_bar);

if(flag==0)
    implay(m);      %movie(matrix m,no. of tyms movie played, frames/sec);
    %rmdir('F:\B.E. Project\bin\embedding','s');

    msgbox('Process Completed...');
    uiwait();
else
    delete(location);
end



