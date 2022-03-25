function ttk = aoa(diedai,getishu,dd,u,l)

ttk=zeros(1,diedai);
c1=2;
c2=6;
c3=2;
c4=0.5;
ub=u;
lb=l;

for i=1:getishu
    for j=1:dd
    ob(i,j)=(ub-lb)*rand+lb;
    end
end

den=zeros(getishu,dd);
vol=zeros(getishu,dd);
acc=zeros(getishu,dd);
for i=1:getishu
    for j=1:dd
    den(i,j)=rand;
    vol(i,j)=rand;
    acc(i,j)=(ub-lb)*rand+lb;
    end
end

for i=1:getishu
f(i)=fitness(ob(i,:),dd);
end
[Ft,qq]=min(f);
tp1=ob(qq,:);
denb=den(qq,:);
volb=vol(qq,:);
accb=acc(qq,:);

for mm=1:diedai
    ttk(1,mm)=Ft;
    new_den=zeros(getishu,dd);
    new_vol=zeros(getishu,dd);
    
    for i=1:getishu
        new_den(i,:)=den(i,:)+rand*(denb-den(i,:));
        new_vol(i,:)=vol(i,:)+rand*(volb-vol(i,:));
    end
    
    tf=exp((mm-diedai)/diedai);
    d=exp((diedai-mm)/diedai)-(mm/diedai);
    
    for i=1:getishu
        if tf<=0.5
            mr=randi([1,getishu],1,1);
            new_acc(i,:)=(den(mr,:)+vol(mr,:).*acc(mr,:))./(new_den(i,:).*new_vol(i,:));
            [new_acc_max,~]=max(new_acc(i,:));
            [new_acc_min,~]=min(new_acc(i,:));
            new_acc_norm(i,:)=0.9*(new_acc(i,:)-new_acc_min)./(new_acc_max-new_acc_min)+0.1;
            new_ob(i,:)=ob(i,:)+c1*rand*d*new_acc_norm(i,:).*(ob(mr,:)-ob(i,:));
        else
            new_acc(i,:)=(denb+volb.*accb)./(new_den(i,:).*new_vol(i,:));
            [new_acc_max,~]=max(new_acc(i,:));
            [new_acc_min,~]=min(new_acc(i,:));
            new_acc_norm(i,:)=0.9*(new_acc(i,:)-new_acc_min)./(new_acc_max-new_acc_min)+0.1;
            P=2*rand-c4;
            if P>0.5
                F=-1;
            else
                F=1;
            end
            new_ob(i,:)=tp1+F*c2*rand*d*new_acc_norm(i,:).*(c3*tf*tp1-ob(i,:));
        end
            for j=1:dd
         if new_ob(i,j)>ub
           new_ob(i,j)=ub;
        elseif  new_ob(i,j)<lb
           new_ob(i,j)=lb;
         else 
           new_ob(i,j)=new_ob(i,j);
         end
          end
        f1(i)=fitness(new_ob(i,:),dd);
    end
    
    for i=1:getishu
    if f1(i)<f(i)
        ob(i,:)=new_ob(i,:);
        den(i,:)=new_den(i,:);
        vol(i,:)=new_vol(i,:);
        acc(i,:)=new_acc(i,:);
        f(i)=f1(i);
    end
    end
    
    [Ft1,pp]=min(f);
    tp2=ob(pp,:);
    new_denb=den(pp,:);
    new_volb=vol(pp,:);
    new_accb=acc(pp,:);
    
      if Ft1<Ft
        Ft=Ft1;
        tp1=tp2;
        denb=new_denb;
        volb=new_volb;
        accb=new_accb;
      end
end