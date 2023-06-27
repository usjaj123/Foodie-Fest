% Foodie Fest 
% This program determines whether an event is a Foodie Fest, a 
% festival for those who love to celebrate food. 

% Initialize array
foodList = {'pizza', 'burger', 'pasta', 'tacos', 'kimchi', 'bun cha', 'sushi', 'nachos', 'salad', 'curry'};

% Ask user to enter the event's name
eventName = input('What is the event's name?\n');

% Ask user to enter the foods featured at the event
foods = input('What foods are featured at the event? (Please separate each food by a comma.\n', 's');

% Split string into individual food items
foodsSplit = strsplit(foods, ', ');

% Compare food items to the ones in foodList
isFoodFest = false;
for i = 1:length(foodsSplit)
    if any(strcmp(foodsSplit{i}, foodList))
        isFoodFest = true;
    end
end

% Output
disp('The event:');
disp(eventName);
if isFoodFest
    disp('is a Foodie Fest!');
else
    disp('is not a Foodie Fest.');
end