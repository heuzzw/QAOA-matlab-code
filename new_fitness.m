function val = fitness(w,dd)
% F1=zeros(1,dd);
% F2=zeros(1,dd);
% s=zeros(1,dd-1);
% for i=1:dd-1
%     s(i)=sqrt(w(i).^2+w(i+1).^2);
% end

% F=zeros(1,dd);

% for i=1:dd
%   F(i)=(w(i).^2-i).^2; 
%   F(i)=abs(w(i).^5-3*w(i).^4+4*w(i).^3+2*w(i).^2-10*w(i)-4);
%   F(i)=w(i).^2;
%   F(i)=rand*(abs(w(i)).^i);
%   F(i)=(w(i)-1).^2+(w(1)-w(i).^2).^2;
% F(i)=sqrt(s(i))*(sin(50*s(i).^0.2)+1);
% F(i)=(w(i).^6)*(2+sin(1/w(i)));
%  F(i)=((10.^6).^((i-1)/(dd-1)))*w(i).^2;
% end
% val=sum(F);
% val=1-cos(2*pi*sqrt(sum(F)))+0.1*sqrt(sum(F));
% val=((1/(dd-1))*sum(F)).^2;
% val=w(1).^2+(10.^6)*sum(F);

temp1=10/(dd^2);
temp2=0;
temp3=0;
z1=1;
for i=1:dd
for j=1:31
temp2 = (2^j).*w(i);
temp3 = abs(temp2 -round(temp2))/2^j;
end
z1 = z1*(1+i.*temp3)^(10/(dd.^(1.2)));
end
val= temp1.*z1- temp1;