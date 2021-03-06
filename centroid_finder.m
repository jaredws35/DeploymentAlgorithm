function Centroids = centroid_finder(Agent_Points, Mass, Density, Number_of_Robots, Agent_Positions)
% Centroids is a nx2 matrix, where (i,1) and (i,2) represent the ith
% agent's centroid's x and y value, respectively.

% Calculates Sum(x*D(x,y)), then divides by mass to get x centroid, does 
% the same to get y centroid. This follows the accepted equation for
% centroid of an area. 

Centroids = zeros(Number_of_Robots, 2);
Centroid_sum = zeros(Number_of_Robots, 2);
 
for i = 1:Number_of_Robots 
    for j = 1:size(Agent_Points{1,i},1)
        x = Agent_Points{1,i}(j,1);
        y = Agent_Points{1,i}(j,2);
        Centroid_sum(i,1) = Centroid_sum(i,1) + x*Density(x,y);
        Centroid_sum(i,2) = Centroid_sum(i,2) + y*Density(x,y);
    end
end

for i = 1:Number_of_Robots
    if Mass(i) == 0 % If robot has no surrounding mass then don't move it.
        Centroids(i,1) = Agent_Positions(i,1);
        Centroids(i,2) = Agent_Positions(i,2);
    else % Otherwise, calculate the centroid.
        Centroids(i,1) = Centroid_sum(i,1)/Mass(i);
        Centroids(i,2) = Centroid_sum(i,2)/Mass(i);
    end
end


end