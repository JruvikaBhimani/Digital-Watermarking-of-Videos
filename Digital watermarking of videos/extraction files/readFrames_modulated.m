% converts video to frames & ans stores frames as image files.

%import(demo1.fig);
    function [numFrames]=readFrames_modulated(v)
    
    mkdir('F:\B.E. Project\bin\extraction\modulated');
    
    wait_bar=waitbar(0,'Converting Modulated Video to Frames.....','CreateCancelBtn',...
            'setappdata(gcbf,''canceling'',1)');
    setappdata(wait_bar,'canceling',0);
    
    %disp(v);
    flag=1;
    
    readerobj = mmreader(v);  % mmreader used as it supports all file formats
    vidFrames = read(readerobj); % reads video
    numFrames = get(readerobj, 'numberOfFrames'); %extracts number of frames in video
    
    format=get(readerobj,'VideoFormat'); % extracts format of video i.e RGB, gray etc 
    
if getappdata(wait_bar,'canceling')
    flag=0;
else         
    for k = 1 : numFrames
        mov(k).cdata = vidFrames(:,:,:,k);  % extracts data of frame

        if(strncmpi('rgb',format,3))  % if grayscale video is defined in RGB components then converting RGB values to GRAY
              mov(k).cdata=rgb2gray(mov(k).cdata);
        end

        mov(k).colormap =gray(256);  % adds grayscale colormap to image

        imagename=strcat(int2str(k), '.jpeg');
        imwrite(mov(k).cdata, strcat('F:\B.E. Project\bin\extraction\modulated\frame',imagename));  %writes frame to image file
        %extractComponents(mov(k).cdata);  % used for real-time videos
        waitbar(k/numFrames);

        if getappdata(wait_bar,'canceling')
            flag=0;
            break;
        end     
    end
end
delete(wait_bar);

if ~flag
   rmdir('F:\B.E. Project\bin\extraction\modulated','s');
end


   