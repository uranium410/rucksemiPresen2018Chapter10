
sampleNum = 100000;

sum = 0;

for i = 1:sampleNum
   x = rand();    
   y = rand();
   
   if x^2 + y^2 < 1
      sum = sum + 1/sampleNum; 
   end
end

sum = sum*4;

disp('円周率はおよそ')
disp(sum)
