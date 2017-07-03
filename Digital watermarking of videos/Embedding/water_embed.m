
function [V]=water_embed(V,w_p)

%imtool(V);
%imtool(water);
%a=water(z,l);

%disp(w_p);

Vmin=min(min(V));
Vmax=max(max(V));
Vmean=mean(mean(V));

%disp(Vmin);
%disp(Vmax);

b_count=1;
a_count=1;

%disp(size(V,1));
%disp(size(V,2));

for i=1:size(V,1)
    for j=1:size(V,2)
        if(V(i,j)<Vmean)
            m_below(b_count)=V(i,j);
            %disp(b_count);
            b_count=b_count+1;
        else
            if(V(i,j)>Vmean)
                m_above(a_count)=V(i,j);
               % disp('a_count: '); disp(a_count);
                a_count=a_count+1;
            end
        end
    end
end

if(b_count~=1)
    m_low=mean(m_below);
else
    m_low=0;   %%%%%%%
end

if(a_count~=1)
    m_high=mean(m_above);
else
    m_high=0;  %%%%%%%%
end

% Embedding Prodecure
%{
for i=1:size(V,1)
    for j=size(V,2)
        Vnew=V(i,j);
        if(w_p == 0)    %%%%%%%
            if(V(i,j) < m_low)
                Vnew = Vmin;
            else
                if(Vmean < V(i,j) && V(i,j) < m_high)
                    Vnew = Vmean;
                else
                    Vnew = V(i,j) - 1;
                end
            end
        end
        
        if(w_p > 0)       %%%%%%%% 
            if(V(i,j) > m_high)
                Vnew = Vmax;
            else
                if(m_low < V(i,j) && V(i,j) < Vmean)
                    Vnew = Vmean;
                else
                    Vnew = V(i,j) + 1;
                end
            end
        end
        
        V(i,j)=Vnew;
    end
end
%}
if w_p==0
    for i=1:size(V,1)
        for j=1:size(V,2)
            if(V(i,j) < m_low)
                V(i,j)=Vmin;
            else
                if(Vmean < V(i,j) && V(i,j) < m_high)
                    V(i,j)=Vmean;
                else
                    V(i,j)=V(i,j)-1;
                end
            end
        end
    end
    
else
     for i=1:size(V,1)
        for j=1:size(V,2)
             if(V(i,j)> m_high)
                        V(i,j)=Vmax;
                    else
                        if(m_low < V(i,j) && V(i,j) < Vmean)
                            V(i,j)=Vmean;
                        else
                            V(i,j)=V(i,j)+1;
                        end
             end
        end
     end
end

%Untitled.z=Untitled.z+1;
%Untitled.l=Untitled.l+1;

