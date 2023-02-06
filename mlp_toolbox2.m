clear
clc

p = -6:0.01:6;
t = sin(p)+p.*cos(3*p);
net = fitnet(11,'trainbf');
% net = fitnet(11,'trainrp');

net.trainParam.show = 25;
net.trainParam.epochs = 1500;
net.trainParam.max_fail=20;

net.divideFcn='dividerand';
net.divideParam.trainRatio = 60/100;
net.divideParam.valRatio = 20/100;
net.divideParam.testRatio = 20/100;

net = init(net);

net = train(net,p,t);

Y = sim(net,p);

plot(p,t,'o',p,Y,'r')
