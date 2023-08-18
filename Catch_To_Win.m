% set up figure and axes
f = figure('menubar','none','numbertitle','off', 'Toolbar','none', 'name','catch');
axis([0 200 0 100])
% Load image

img = imread('background.jpg');

% Resize image to fit the plot
[x, y, ~] = size(img);  % Get dimensions of the original image
x_scale = 0.5;  % Set scale factor for x dimension
y_scale = 0.5;  % Set scale factor for y dimension
img_resized = imresize(img, [x_scale*x, y_scale*y]);

% Display image as the background of the plot
imagesc([0 200], [0 100], img_resized);
% flip the y-axis
set(gca, 'Ydir', 'normal')

set(gca,'XTick',[], 'YTick', [])
title('Catch To Win')
box on % draw a box around the figure
hold on % keep the axes in the figure when drawing new elements
xlabel({'Instructions :','1. Use Left and Right arrows to move', '2. Shift to speed up ( make sure to click shift before arrow and keep holding it)', ...
         '3. Catch as much as you can !!!', ''}) 


global  counter text_counter misses text_miss_counter;

counter = 0 ;
% create text object to display counter
text_counter = text(10, 90, 'Counter: ');
misses=10;
text_miss_counter = text(150, 90, ['Misses: ' num2str(misses)]);
% set up timer period and start delay
period = 0.2;
start_delay = 1;
width= randi([0,200]);
% set up number of circles to create
x_coord = -1;
num_circles = 3;
    % plot initial blue circle at a random x position between 0 and 200
% create and start timer for each circle
for i = 1:num_circles
    if x_coord< 0
        x_coord= 100;
    end
    circle = rectangle('Position', [width-2.5 x_coord-2.5 5 5], 'Curvature', [1 1], 'FaceColor', 'w');
    % set up timer and callback function for this circle
    t = timer('ExecutionMode', 'FixedRate', 'Period', period, 'StartDelay', (i*i*start_delay)/num_circles);
    t.TimerFcn = {@step_down,circle}; % pass h as additional argument
    start(t);
   
end

% Create a "basket" to catch the falling circles
width = 120;
height = 10;
basket = rectangle('Position', [width-45 height-5 45 5], 'FaceColor', [200 100 16]/256);

% set up key press callback function
set(gcf, 'KeyPressFcn', {@movePoint, basket}) % pass h as additional argument
% initialize counter variable to 0



function movePoint(src, event, h) % accept h as additional argument
    % get current position of the basket
    x = get(h, 'Position');
    global position;
    position= x;
    % adjust position based on arrow keystroke
    switch event.Key
        case 'leftarrow'
            if ismember('shift',event.Modifier)
                x(1) = max(0, x(1) - 20);
            else
                x(1) = max(0, x(1) - 5);
            end
        case 'rightarrow'
            if ismember('shift',event.Modifier)
                x(1) = min(200-x (3), x(1) + 20);
            else
                x(1) = min(200-x (3), x(1) + 5);
            end
    end

    
    % update position of blue rectangle and limit it to the figure boundaries
    set(h, 'Position', x);
end

function step_down(~, ~, h) % accept h as additional argument
    global position counter text_counter misses text_miss_counter;
    % get current position of the white circle
    x = get(h, 'Position');
    
    % move the rectangle down by 5 units
    x(2) = x(2) - 5;
     
    % update position of the white circle and limit it to the figure boundaries

    if (x(2) <= position(2) && x(1)+x(3) >= position(1) && x(1) <= position(1)+position(3))
        counter= counter+1;
        delete(text_counter);
        text_counter = text(10, 90, ['Counter: ' num2str(counter)]);
        x(2) = 100;
        x(1) = randi([0,200]); % change x position to a new random value between 0 and 200
        %%disp("point")
        
    elseif x(2) < 0 
        misses= misses-1;
        delete(text_miss_counter);
        text_miss_counter = text(150, 90, ['Misses Allowed: ' num2str(misses)]);
        x(2) = 100;
        x(1) = randi([10,190]); % change x position to a new random value between 0 and 200

    end
    if (misses <=0)
      game_Over_stop = text(50, 50, 'Game Over :( !!!', FontSize=25, Color='r');
      stop(t);
    end   
    set(h, 'Position', x);
    %%disp(position)
end
 
