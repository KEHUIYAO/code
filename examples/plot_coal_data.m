load("coal_data.mat")
num_of_plots=size(centroids)
num_of_plots=num_of_plots(1)
m = length(C);
q=0:1:226;
F1 = @(B,x) (B(1)*(x<=B(2)).*x+(x>B(2)).*(B(1)*B(2)+B(3)*(x-B(2)))); %without intercept  %Form of the equation,two piece linear 
%% no cluster
figure('Renderer', 'painters', 'Position', [10 10 600 600])
hold all 
for n=1:m
    if group(n)==1
    a=plot([0,z(n,1:Nj(n))],0:Nj(n),'-ko','MarkerSize',3)
    elseif group(n)==2
        b=plot([0,z(n,1:Nj(n))],0:Nj(n),'-ko','MarkerSize',3)  
    elseif group(n)==3 
         c=plot([0,z(n,1:Nj(n))],0:Nj(n),'-ko','MarkerSize',3)
    elseif group(n)==4   
         d=plot([0,z(n,1:Nj(n))],0:Nj(n),'-ko','MarkerSize',3)
    end
end
%legend([a b c d],{'1','2','3','4'},'Location','northwest')
xlabel("Year")
ylabel("N(t)")
yticks([0 20 40])
yticklabels({"0","20","40"})
% xticks([47.8  134.7  221.6])
% xticklabels({"1860","1880","1900"})
xticks([47.8  134.7  226])
xlim([0 226])
xticklabels({"1860","1880","1901"})













%% plot the whole picture
% ax = tight_subplot(1,4,0.11,0.1); 
% subplot(ax(1));
subplot(1,4,1)
hold all
for n=1:m
    if group(n)==1
    a=plot([0,z(n,1:Nj(n))],0:Nj(n),'-ko','MarkerSize',3)
    elseif group(n)==2
        b=plot([0,z(n,1:Nj(n))],0:Nj(n),'--k^','MarkerSize',3)  
    elseif group(n)==3 
         c=plot([0,z(n,1:Nj(n))],0:Nj(n),':k*','MarkerSize',4)
    elseif group(n)==4   
         d=plot([0,z(n,1:Nj(n))],0:Nj(n),'-.k.','MarkerSize',8)
    end
end
%legend([a b c d],{'1','2','3','4'},'Location','northwest')
xlabel("Year")
ylabel("N(t)")
yticks([0 20 40])
yticklabels({"0","20","40"})
% xticks([47.8  134.7  221.6])
% xticklabels({"1860","1880","1900"})
xticks([47.8  134.7  226])
xlim([0 226])
xticklabels({"1860","1880","1901"})
%%
% subplot(ax(2));
subplot(1,4,2)
hold all
for n=1:m
    if group(n)==1
    a=plot(q,F1([based_on_centroids(n,2) based_on_centroids(n,1) based_on_centroids(n,3)],q),'-k');
    plot(based_on_centroids(n,1),F1([based_on_centroids(n,2) based_on_centroids(n,1) based_on_centroids(n,3)],based_on_centroids(n,1)),'-ko','MarkerSize',3)
    end
end
for n=1:m
    if group(n)==2
    b=plot(q,F1([based_on_centroids(n,2) based_on_centroids(n,1) based_on_centroids(n,3)],q),'--k');
    plot(based_on_centroids(n,1),F1([based_on_centroids(n,2) based_on_centroids(n,1) based_on_centroids(n,3)],based_on_centroids(n,1)),'-k^','MarkerSize',3)
    end
end
for n=1:m
    if group(n)==3
    c=plot(q,F1([based_on_centroids(n,2) based_on_centroids(n,1) based_on_centroids(n,3)],q),':k');
    plot(based_on_centroids(n,1),F1([based_on_centroids(n,2) based_on_centroids(n,1) based_on_centroids(n,3)],based_on_centroids(n,1)),'-k*','MarkerSize',4)

    end
end
for n=1:m
    if group(n)==4
    d=plot(q,F1([based_on_centroids(n,2) based_on_centroids(n,1) based_on_centroids(n,3)],q),'-.k');
    plot(based_on_centroids(n,1),F1([based_on_centroids(n,2) based_on_centroids(n,1) based_on_centroids(n,3)],based_on_centroids(n,1)),'-k.','MarkerSize',8)
    end
end
%title("Estimated cumulative function")
xlabel("Year")
ylabel("Estimated cumulative intensity")
yticks([0 20 40])
yticklabels({"0","20","40"})

ylim([0 40])
% xticks([47.8  134.7  221.6])
% xticklabels({"1860","1880","1900"})
xticks([47.8  134.7  226])
xticklabels({"1860","1880","1901"})
xlim([0 226])
%%
% subplot(ax(3));
subplot(1,4,3)
hold all
plot(q,F1([centroids(1,2) centroids(1,1) centroids(1,3)],q),'-k')
plot(q,F1([centroids(2,2) centroids(2,1) centroids(2,3)],q),'--k')
plot(q,F1([centroids(3,2) centroids(3,1) centroids(3,3)],q),':k')
plot(q,F1([centroids(4,2) centroids(4,1) centroids(4,3)],q),'-.k')
a=plot(centroids(1,1),F1([centroids(1,2) centroids(1,1) centroids(1,3)],centroids(1,1)),'-ko','MarkerSize',3)
b=plot(centroids(2,1),F1([centroids(2,2) centroids(2,1) centroids(2,3)],centroids(2,1)),'--k^','MarkerSize',3)
c=plot(centroids(3,1),F1([centroids(3,2) centroids(3,1) centroids(3,3)],centroids(3,1)),':k*','MarkerSize',4)
d=plot(centroids(4,1),F1([centroids(4,2) centroids(4,1) centroids(4,3)],centroids(4,1)),'-.k.','MarkerSize',8)
xlabel("Year")
ylabel("Estimated cumulative intensity")
yticks([0 20 40])
yticklabels({"0","20","40"})
ylim([0 40])
% xticks([47.8  134.7  221.6])
% 
% xticklabels({"1860","1880","1900"})
xticks([47.8  134.7  226])
xticklabels({"1860","1880","1901"})
xlim([0 226])
%%
% subplot(ax(4))

hSub = subplot(1,4,4); plot(1, nan, 1, nan, 'r'); set(hSub, 'Visible', 'off');

legend(hSub,[a b c d],{'1','2','3','4'},'Location','northwest')
















%% color version
load("coal_data.mat")
num_of_plots=size(centroids)
num_of_plots=num_of_plots(1)
m = length(C);
q=0:1:226;
F1 = @(B,x) (B(1)*(x<=B(2)).*x+(x>B(2)).*(B(1)*B(2)+B(3)*(x-B(2)))); %without intercept  %Form of the equation,two piece linear 
%% plot the whole picture
% ax = tight_subplot(1,3,0.11,0.1); 
% subplot(ax(1));
subplot(1,4,1)
hold all
for n=1:m
    if group(n)==1
    aa=plot([0,z(n,1:Nj(n))],0:Nj(n),'-ro','MarkerSize',3)
    elseif group(n)==2
        bb=plot([0,z(n,1:Nj(n))],0:Nj(n),'--g^','MarkerSize',3)  
    elseif group(n)==3 
         cc=plot([0,z(n,1:Nj(n))],0:Nj(n),':b*','MarkerSize',4)
    elseif group(n)==4   
         dd=plot([0,z(n,1:Nj(n))],0:Nj(n),'-.k.','MarkerSize',8)
    end
end
%legend([a b c d],{'1','2','3','4'},'Location','northwest')
xlabel("Year")
ylabel("N(t)")
yticks([0 20 40])
yticklabels({"0","20","40"})
ylim([0 40])

% xticks([47.8  134.7  221.6])
% xticklabels({"1860","1880","1900"})
xticks([47.8  134.7  225.8])
xticklabels({"1860","1880","1901"})
xlim([0 225.8])
%%
%subplot(ax(2))
subplot(1,4,2)
hold all
for n=1:m
    if group(n)==1
    a=plot(q,F1([based_on_centroids(n,2) based_on_centroids(n,1) based_on_centroids(n,3)],q),'-r');
    plot(based_on_centroids(n,1),F1([based_on_centroids(n,2) based_on_centroids(n,1) based_on_centroids(n,3)],based_on_centroids(n,1)),'-ro','MarkerSize',3)
    end
end
for n=1:m
    if group(n)==2
    b=plot(q,F1([based_on_centroids(n,2) based_on_centroids(n,1) based_on_centroids(n,3)],q),'--g');
    plot(based_on_centroids(n,1),F1([based_on_centroids(n,2) based_on_centroids(n,1) based_on_centroids(n,3)],based_on_centroids(n,1)),'--g^','MarkerSize',3)
    end
end
for n=1:m
    if group(n)==3
    c=plot(q,F1([based_on_centroids(n,2) based_on_centroids(n,1) based_on_centroids(n,3)],q),':b');
    plot(based_on_centroids(n,1),F1([based_on_centroids(n,2) based_on_centroids(n,1) based_on_centroids(n,3)],based_on_centroids(n,1)),'-b*','MarkerSize',4)

    end
end
for n=1:m
    if group(n)==4
    d=plot(q,F1([based_on_centroids(n,2) based_on_centroids(n,1) based_on_centroids(n,3)],q),'-.k');
    plot(based_on_centroids(n,1),F1([based_on_centroids(n,2) based_on_centroids(n,1) based_on_centroids(n,3)],based_on_centroids(n,1)),'-k.','MarkerSize',8)
    end
end
%title("Estimated cumulative function")
xlabel("Year")
ylabel("Estimated cumulative intensity")
yticks([0 20 40])
ylim([0 40])

yticklabels({"0","20","40"})
% xticks([47.8  134.7  221.6])
% xticklabels({"1860","1880","1900"})
xticks([47.8  134.7  226])
xticklabels({"1860","1880","1901"})
xlim([0 226])
%%
%subplot(ax(3))
subplot(1,4,3)
hold all
plot(q,F1([centroids(1,2) centroids(1,1) centroids(1,3)],q),'-r')
plot(q,F1([centroids(2,2) centroids(2,1) centroids(2,3)],q),'--g')
plot(q,F1([centroids(3,2) centroids(3,1) centroids(3,3)],q),':b')
plot(q,F1([centroids(4,2) centroids(4,1) centroids(4,3)],q),'-.k')
plot(centroids(1,1),F1([centroids(1,2) centroids(1,1) centroids(1,3)],centroids(1,1)),'-ro','MarkerSize',3)
plot(centroids(2,1),F1([centroids(2,2) centroids(2,1) centroids(2,3)],centroids(2,1)),'--g^','MarkerSize',3)
plot(centroids(3,1),F1([centroids(3,2) centroids(3,1) centroids(3,3)],centroids(3,1)),':b*','MarkerSize',4)
plot(centroids(4,1),F1([centroids(4,2) centroids(4,1) centroids(4,3)],centroids(4,1)),'-.k.','MarkerSize',8)

xlabel("Year")
ylabel("Estimated cumulative intensity")
yticks([0 20 40])
yticklabels({"0","20","40"})
ylim([0 40])
% xticks([47.8  134.7  221.6])
% xticklabels({"1860","1880","1900"})
xticks([47.8  134.7  226])
xticklabels({"1860","1880","1901"})
xlim([0 226])
%%

hSub = subplot(1,4,4); plot(1, nan, 1, nan, 'r'); set(hSub, 'Visible', 'off');

legend(hSub,[aa bb cc dd],{'1','2','3','4'},'Location','northwest')
%% plot histogram
load("coal_data_bootstrap")
figure()
subplot(1,3,1)

B=200;
lam_1=zeros(1,200);
lam_2=zeros(1,200);

for i=1:B
    lam_1(i)=centroids(3,2,i);
    lam_2(i)=centroids(3,3,i);
end
lam_1=lam_1*1000;
lam_2=lam_2*1000;
histfit(lam_1,50,'gamma')
xlim([0 150])
ylim([0 140])
set(gca,'XTick',[0:75:150])
set(gca,'YTick',[0:70:140])
xlabel('\lambda_b')
ylabel('Frequency')
subplot(1,3,2)
histfit(lam_2,20,'gamma')
ylim([0 140])
xlim([0 1000])
set(gca,'XTick',[0:500:1000])
set(gca,'YTick',[0:70:140])
xlabel('\lambda_a')
ylabel('Frequency')
%%
subplot(1,3,3)
plot(lam_2,lam_1,'+k')
ylim([0 120])
xlim([0 120])
set(gca,'YTick',[0:60:120])
set(gca,'XTick',[0:60:120])
hold on
plot([0,120],[0, 120],'k','linewidth',1);
xlabel('\lambda_a')
ylabel('\lambda_b')
