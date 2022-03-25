function val = fitness(w,dd)
% F1=zeros(1,dd);
% F2=zeros(1,dd);
F=zeros(1,dd);
% u=zeros(1,dd);
% ww=1+(w+1)/4;

for i=1:dd
%  F(i)=w(i).^2-10*cos(2*pi*w(i))+10;

%  F(i)=w(i)*sin(sqrt(abs(w(i))));

% F1(i)=(w(i)).^2;
% F2(i)=cos((w(i))/sqrt(i));

% F(i)=100*((w(i+1)-w(i).^2).^2)+(w(i)-1).^2;

% F(i)=w(i+1).^2;

% F1(i)=(w(i)).^2;
% F2(i)=cos(2*pi*w(i));

% F1(i)=(w(i)).^2;
% F2(i)=0.5*i*w(i);

% F(i)=abs(sin(10*w(i)*pi)/(10*w(i)*pi));

F(i)=(w(i)+0.5).^2;

% F(i)=-w(i)*sin(10*pi*w(i));

% F(i)=sin(w(i))+sin(2*w(i)/3);

% F(i)=floor(w(i));

% F(i)=abs(w(i)*sin(w(i))+0.1*w(i));

% F(i)=(w(4*i-3)+10*w(4*i-2)).^2+5*(w(4*i-1)-w(4*i)).^2+(w(4*i-2)-2*w(4*i-1)).^4+10*(w(4*i-3)-w(4*i)).^4;

% F(i)=w(i).^4-16*w(i).^2+5*w(i);

% F(i)=abs(w(i)).^(i+1);

% F(i)=abs(w(i));

% F(i)=abs(w(i)*sin(w(i))+0.1*w(i));

% F(i)=((w(i)-1).^2)*(1+sin(3*pi*w(i)+1).^2);
% 
% if w(i)>5
%     u(i)=100*(w(i)-5).^4;
% elseif w(i)<-5
%     u(i)=100*(-w(i)-5).^4;
%     else
%         u(i)=0;
% end

% F(i)=((ww(i)-1).^2)*(1+10*sin(pi*ww(i+1)).^2);

% F(i)=((10.^6).^((i-1)/(dd-1)))*w(i).^2;

% F(i)=(w(i).^6)*(2+sin(1/w(i)));

% F1(i)=w(i).^2;
% F2(i)=w(i);
end
% val=w(1).^2+(10.^6)*sum(F);
% val=(abs(sum(F1)-dd)).^(1/4)+((0.5*sum(F1)+sum(F2))/dd)+0.5;

% val=max(F);

% for i=1:dd
%     if w(i)>10
%     u(i)=100*((w(i)-10).^4);
%     elseif w(i)<-10
%     u(i)=100*((-w(i)-10).^4);
%     else
%         u(i)=0;
%     end
% end

% val=abs((pi/dd)*(10*sin(pi*ww(1))+sum(F)+(ww(dd)-1).^2)+sum(u));
% val=0.1*(sin(3*pi*w(1)).^2+sum(F)+((w(dd)-1).^2)*(1+sin(2*pi*w(dd)).^2))+sum(u);

% val=sum(F)+prod(F);
% val=0.5+(1/(1+0.001*sum(F)).^2)*(((sin(sqrt(sum(F)))).^2)-0.5);
% val=6*dd+sum(F);
val=sum(F);
% val=20+exp(1)-20*exp(-0.2*sqrt(1/dd*sum(F1)))-exp(1/dd*sum(F2));
% val=418.9829*dd-sum(F);
% val=0.5+(1/((1+0.001*sum(F)).^2))*(((sin(sqrt(sum(F)))).^2)-0.5);
% val=1/4000*sum(F1)-prod(F2)+1;
% val=sum(F1)+sum(F2).^2+sum(F2).^4;
% val=exp(0.5*sum(F))-1;
% val=sum(F)+rand;

% outer = 0;
% 
% for ii = 1:dd
% 	inner = 0;
% 	for jj = 1:dd
% 		xj = w(jj);
%         inner = inner + (jj^ii+0.5)*((xj/jj)^ii-1);
%     end
% 	outer = outer + inner^2;
% end
% 
% val=outer;

% val=max(abs(w));

% outer = 0;
% 
% for ii = 1:dd
%     inner = 0;
%     for jj = 1:ii
%         wj = w(jj);
%         inner = inner + wj^2;
%     end
%     outer = outer + inner;
% end
% 
% val = outer;

% for ii = 1:dd
% 	ww(ii) = 1 + (w(ii) - 1)/4;
% end
% 
% term1 = (sin(pi*ww(1)))^2;
% term3 = (ww(dd)-1)^2 * (1+(sin(2*pi*ww(dd)))^2);
% 
% sum = 0;
% for ii = 1:(dd-1)
% 	wi = ww(ii);
%         new = (wi-1)^2 * (1+10*(sin(pi*wi+1))^2);
% 	sum = sum + new;
% end
% 
% val = term1 + sum + term3;

% a = zeros(1, dd);
% for ii = 1:dd
%      a(ii) = (ii-1) / 2;
% end
%     
%     prod = 1;
% for ii = 1:dd
%     xi = w(ii);
%     ai = a(ii);
%     new1 = abs(4*xi-2) + ai;
%     new2 = 1 + ai;
%     prod = prod * new1/new2;
% end
% 
% val = prod;

% x1=w(1);
% term1 = (x1-1)^2;
% 
% sum = 0;
% for ii = 2:dd
% 	xi = w(ii);
% 	xold = w(ii-1);
% 	new = ii * (2*xi^2 - xold)^2;
% 	sum = sum + new;
% end
% 
% val = term1 + sum;

