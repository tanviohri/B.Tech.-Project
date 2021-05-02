Diff = [2 3.8  2 1.1  3 0.7  3 0.3  3 0.2 2 0.1 3 0.2 2 0.1  1 0.0]

bDiff=[];
PiDiff =[];
for i=1:2:length(Diff)
    bDiff=[bDiff ;Diff(i)];
    PiDiff=[PiDiff ;Diff(i+1)];
end
figure();
plot(bDiff, 'r')
hold on;
plot(PiDiff, 'g')
legend('Difference in b Values', 'Difference in Objective Function Values at b')
xticklabels({'U[1,2]','U[2,4]', 'U[5,10]', 'U[10,20]','U[15,30]', 'U[20,40]','U[25,50]', 'U[50,100]','U[200,400]'})
xtickangle(45)
xlabel('Distribution of Arrival Rate')
ylabel('Difference')

bDiff=[5 8 16];
PiDiff =[1.7 2.0 3.4];
figure();
plot(bDiff, 'r--o')
hold on;
plot(PiDiff, 'g--o')
legend('Difference in b Values', 'Difference in Objective Function Values at b')
xticklabels({'37.5','', '75', '','300'})
xtickangle(45)
xlabel('Value of Arrival Rate')
ylabel('Difference')
