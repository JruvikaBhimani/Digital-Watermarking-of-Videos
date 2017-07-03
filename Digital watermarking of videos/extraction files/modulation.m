
% X-OR's for 1st pseudo number.

function [mod_value]= modulation(b1,b2)

    temp=0;
    
    for i=1:8 %8-pixels since grayscale image, hence 8-iterations
        
            a=b1(9-i); % b1 & b2 are fixed to 8-positions, hence doesnot require extra computations of finding length etc
            b=b2(9-i);

        if(a==b)  % x-oring operation
            pix=0;
        else
            pix=1;
        end
        
        temp=pix*(10^(i-1))+temp;  %inverting the num and saving as we are reading from back2front
        
    end
    
    mod_value=temp;



