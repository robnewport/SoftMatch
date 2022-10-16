function [AvA, AvB, BvB] = uniqueValues(input)

AvA = zeros(1, 1378);
AvB = zeros(1, 1378);
BvB = zeros(1, 1378);

% Top Left
pos = 1;
count = 1;
for i = 1:52
    pos = pos + 1;
    for j = pos:53
        AvA(count) = input(i,j);
        count = count + 1;
    end
end

% Bottom Left
pos = 1;
count = 1;
for i = 1:52
    pos = pos + 1;
    for j = pos:53
        AvB(count) = input(i+53,j);
        count = count + 1;
    end
end

% Bottom Right
pos = 1;
count = 1;
for i = 1:52
    pos = pos + 1;
    for j = pos:53
        BvB(count) = input(i+53,j+53);
        count = count + 1;
    end
end
end