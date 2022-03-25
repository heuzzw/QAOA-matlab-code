function ttk = qaoa(diedai,getishu,dd,u,l)

ttk=zeros(1,diedai);
c1=2;
c2=6;
c3=2;
c4=0.5;
ub=u;
lb=l;
qob=rand(getishu,dd);
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

ob=zeros(getishu,dd);
f=zeros(1,getishu);
for i=1:getishu
ob(i,:)=(ub-lb)*qob(i,:)+lb;
f(i)=fitness(ob(i,:),dd);
end
[Ft,qq]=min(f);
tp1=qob(qq,:);
denb=den(qq,:);
volb=vol(qq,:);
accb=acc(qq,:);

for mm=1:diedai

     ttk(1,mm)=Ft;
     
    new_den=zeros(getishu,dd);
    new_vol=zeros(getishu,dd);
    qob_tm=zeros(getishu,dd);
    new_acc=zeros(getishu,dd);
    new_acc_norm=zeros(getishu,dd);
    new_qob=zeros(getishu,dd);
    new_ob=zeros(getishu,dd);
    f1=zeros(1,getishu);
    for i=1:getishu
        new_den(i,:)=den(i,:)+rand*(denb-den(i,:));
        new_vol(i,:)=vol(i,:)+rand*(volb-vol(i,:));
    end
    
     tf=exp((mm-diedai)/diedai);
     a1=2-mm*((2)/diedai);
     d=exp((diedai-mm)/diedai)-(mm/diedai);
     
    for i=1:getishu
          mr=randi([1,getishu],1,1);
          
     if rand>0.8     
        if tf<=0.5
           new_acc(i,:)=(den(mr,:)+vol(mr,:).*acc(mr,:))./(new_den(i,:).*new_vol(i,:));
            [new_acc_max,~]=max(new_acc(i,:));
            [new_acc_min,~]=min(new_acc(i,:));
            new_acc_norm(i,:)=0.9*(new_acc(i,:)-new_acc_min)./(new_acc_max-new_acc_min)+0.1;

            qob_tm(i,:)=c1*rand*d*new_acc_norm(i,:).*(qob(mr,:)-qob(i,:));
            new_qob(i,:)=abs(qob(i,:).*cos(qob_tm(i,:))+sqrt(1-qob(i,:).^2).*sin(qob_tm(i,:)));
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

            qob_tm(i,:)=F*c2*rand*d*new_acc_norm(i,:).*(c3*tf*tp1-qob(i,:));
            new_qob(i,:)=abs(tp1.*cos(qob_tm(i,:))+sqrt(1-tp1.^2).*sin(qob_tm(i,:)));

        end
     else
             new_acc(i,:)=(den(mr,:)+vol(mr,:).*acc(mr,:))./(new_den(i,:).*new_vol(i,:));
             
         if rand>0.1
            qob_tm(i,:)=randn*qob(i,:);
            new_qob(i,:)=abs(qob(i,:).*cos(qob_tm(i,:))+sqrt(1-qob(i,:).^2).*sin(qob_tm(i,:)));
         else
            qob_tm(i,:)=2*a1*rand*(tp1-qob(i,:))+2*a1*rand*(qob(mr,:)-qob(i,:));
            new_qob(i,:)=abs(qob(i,:).*cos(qob_tm(i,:))+sqrt(1-qob(i,:).^2).*sin(qob_tm(i,:)));
         end 
     end
        new_ob(i,:)=(ub-lb)*new_qob(i,:)+lb;
        f1(i)=fitness(new_ob(i,:),dd);
    end
    
    c=zeros(getishu,dd);
    cc=zeros(getishu,dd);
    f2=zeros(1,getishu);
      for i=1:getishu
        c(i,:)=abs(rand-new_qob(i,:));
        cc(i,:)=(ub-lb)*c(i,:)+lb;
        f2(i)=fitness(cc(i,:),dd);
        if f2(i)<f1(i)
            f1(i)=f2(i);
            new_qob(i,:)=c(i,:);
            new_den(i,:)=abs(rand-new_den(i,:));
            new_vol(i,:)=abs(rand-new_vol(i,:));
            new_acc(i,:)= (den(i,:)+vol(i,:).*acc(i,:))./(new_den(i,:).*new_vol(i,:));
        end
      end

    for i=1:getishu
    if f1(i)<f(i)
        qob(i,:)=new_qob(i,:);
        den(i,:)=new_den(i,:);
        vol(i,:)=new_vol(i,:);
        acc(i,:)=new_acc(i,:);
        f(i)=f1(i);
    end
    end
    
    [Ft1,pp]=min(f);
    tp2=qob(pp,:);
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