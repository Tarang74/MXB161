clear, clc, close all
% M = 2;
% N = 2;
% P = 2;
% 
% A1 = rand([M, N, P], 'single')    % uniformly distributed random numbers between 0 & 1
% A2 = randn([M, N, P], 'single')   % normally distributed random numbers
% 
% a = 10;
% b = 50;
% 
% A3 = rand([M, N, P]) * (b - a) + a  % uniformly distributed random numbers
% A4 = randn([M, N, P]) * (b - a) + a % normally distributed random numbers
% A5 = randi([a, b], [M, N, P])       % uniformly distributed random integers
% 
% A6 = zeros(M, N) % zero array
% A7 = false(M, N) % logical false array
% 
% A8 = rand(M, N) % random array
% mask = A8 > 0.5 % logical array, true if: >0.5 and false if: <=0.5

% actualScaleLength = 200 * 1000
% 
% f = figure                                          % create a figure object
% imshow('australia_map.png')                         % display image 
% p = drawpolygon(f.Children)                         % trace polygon on image
% cP = p.Position                                     % n by 2 array of (x, y) coordinates
% areaPxSquared = polyarea(cP(:, 1), cP(:, 2))        % area [px^2]
% l = drawline(f.Children)                            % trace scale bar on image
% cL = l.Position                                     % 2 by 2 array of (x, y) coordinates
% scalePx = sqrt((cL(2, 1) - cL(1, 1))^2 + ...
%                (cL(2, 2) - cL(1, 2))^2)             % scale length [px]
% mPerPx = actualScaleLength / scalePx                % [m] per [px]
% mSquaredPerPxSquared = mPerPx^2                     % [m^2] per [px^2]
% areaMSquared = mSquaredPerPxSquared * areaPxSquared % area [m^2]

% longitudes = [153.02, 153.0214521, 153.019652];                                         % e.g. 153.02
% latitudes = [-27.4652, -27.46456, -27.4618634];                                          % e.g. -27.46
% origin = [mean(longitudes), mean(latitudes)];               % arbitrary origin
% radius = 6373.6;                                            % radius of Earth
% circumference = 2 * pi * radius;                            % circumference of Earth
% kmPerDegLatitude = circumference / 360;                     
% kmPerDegLongitude = kmPerDegLatitude * cos(deg2rad(-27.5)); % near Brisbane
% x = (longitudes - origin(1)) * kmPerDegLongitude;           % x coordinates
% y = (latitudes - origin(2)) * kmPerDegLatitude;             % y coordinates
% plot(x, y, '.');

% M = 200;
% N = 200;
% 
% % A1 = randi([0, 255], M, N, 'uint8');     % greyscale image
% % A2 = randi([0, 255], M, N, 3, 'uint8');  % colour image
% 
% % A = 255 * zeros(M, N, 3, 'uint8');  % black image
% A = 255 * ones(M, N, 3, 'uint8');   % white image
% 
% % Access individual channels
% rMask = A(:, :, 1);                 % red channel
% gMask = A(:, :, 2);                 % green channel
% bMask = A(:, :, 3);                 % blue channel
% 
% % Access specific region and change its colour to rgb(r, g, b)
% x1 = 20;
% x2 = 40;
% y1 = 90;
% y2 = 130;
% 
% r = 70;
% g = 150;
% b = 220;
% 
% A(x1:x2, y1:y2, 1) = r;                 % modify red value of (a:b, c:d)
% A(x1:x2, y1:y2, 2) = g;                 % modify green value of (a:b, c:d)
% A(x1:x2, y1:y2, 3) = b;                 % modify blue value of (a:b, c:d)
% 
% imshow(A)

% theImage = imread('australia_map.png');     % access image 
% % Mask a colour range to be modified
% r = 70;
% g = 190;
% b = 220;
% 
% mask = theImage(:, :, 1) > r & theImage(:, :, 2) > g & theImage(:, :, 3) > b;
% figure
% imshow(mask)
% figure
% imshow(theImage)
% 
% % % Access individual channels
% rMask = theImage(:, :, 1);                 % red channel
% gMask = theImage(:, :, 2);                 % green channel
% bMask = theImage(:, :, 3);                 % blue channel
% 
% % Modify channels of selected colour range - accessing individual channels shown in previous section
% rNew = 180;
% gNew = 100;
% bNew = 220;
% 
% rMask(mask) = rNew;                 % modify red value in masked image
% gMask(mask) = gNew;                 % modify green value in masked image
% bMask(mask) = bNew;                 % modify blue value in masked image
% theNewImage(:, :, 1) = rMask;       % assign red mask to new array 
% theNewImage(:, :, 2) = gMask;       % assign green mask to new array
% theNewImage(:, :, 3) = bMask;       % assign blue mask to new array
% figure
% imshow(theNewImage)

% f = figure;
% set(f, 'Visible', 'on');
% video = VideoWriter('video.avi');   % create video object
% open(video);                      % open video for write access
% x = 1:0.1:10;                          % x values
% y = sin(x);                          % y values
% p = plot(x(1:2), y(1:2), '.-');               % create plot object
% axis([min(x) max(x) min(y) max(y)]);
% for i = 1:length(x)                 % iterate through each frame
%     % Update plot object data
%     p.XData = x(1:i);
%     p.YData = y(1:i);
%     hold on;                        % use if previous points should remain on figure
%     drawnow;                        % update figure
%     frame = getframe;               % get snapshot of current axes
%     writeVideo(video, frame)        % write frame to video
% end
% hold off                            % use if hold on was used
% close(video);                       % close the file

% f = 523.251;                        % frequency of note
% Fs = 8192;                          % sampling rate
% l = 1;                              % length of tone [s]
% t = 0: 1 / Fs : l;                  % vector of evenly-spaced times to sample at
% y = sin(2 * pi * f * t);            % sine wave sampled at t

% [y1 + y2]                           % combine y1 and y2 (must be the same dimension)
% [y1; y2]                            % append y2 after y1
% soundsc(y, Fs)                      % play sound 
% resample(y, Fs, Q)                  % resample sound at the new sampling rate: Fs / Q
% Fs / 2                              % half speed
% Fs * 2                              % double speed
% audiowrite('audio.wav', y, Fs)      % write sound to audio.wav

% duration = length(y) / Fs;                  % duration of sound [s]
% % equivalent methods for defining a time vector
% t1 = 0 : 1 / Fs : duration;                  % using the colon operator
% t2 = linspace(0, duration, length(y) + 1);   % using the linspace function

% M = 50;                                             % number of particles
% N = 200;                                            % number of steps
% delta = 1;                                          % size of step
% p = 0.5;                                            % probability of jumping left
% A = zeros(N + 1, M);                                % initialise particles at zero
% for i = 1:N                                         % iterate through each step
%     r = rand(1, M);                                 % random probability for each particle
%     leftMask = r < p;                               % mask left-moving particles
%     A(i + 1, leftMask) = A(i, leftMask) - delta;    % move leftMask left    
%     A(i + 1, ~leftMask) = A(i, ~leftMask) + delta;  % move ~leftMask right
% end

% f = figure
% set(f, 'Visible', 'on')
% p = plot(A(1:2, :), '.-');      % create plot object
% L = max(abs(A(:)));             % maximum distance reached
% axis([0 N -L L]);               % set axis bounds
% for i = 1:N                     % iterate through each step
%     for j = 1:M                 % iterate through each particle
%         p(j).YData = A(1:i, j); % update plot object data
%         hold on                 % hold until all particles trees have been plotted 
%     end
%     hold off                    % hold off for next iteration
%     drawnow                     % update figure
% end

% f = figure
% set(f, 'Visible', 'on')
% p = plot(A(1, :), zeros(1, M), '.');       % create plot object
% L = max(abs(A(:)));                         % maximum distance reached
% axis([-L L -1 1]);                          % set axis bounds
% for i = 1:N                                 % iterate through each step
%     p.XData = A(i, :);                   % update plot object data
%     drawnow                                 % update figure
% end

% C = 100;                                        % number of cells
% N = 50;                                         % number of steps
% A = false(N + 1, C);                            % initialise all positions to be empty
% A(1, :) = rand(1, C) > 0.5;                     % use random initial state
% % Manually define initial state using an explicit assignment
% % A(1, :) = [...];                                % length of row vector must be C
% for i = 1:N                                     % iterate through each step
%     P = A(i, :)                                 % centre cells
%     % Wrap-around ghost boundary cell 
%     L = [P(C), P(1:C - 1)];
%     R = [P(2:C), P(1)];
%     % Dead boundary cell
% %     L = [0, P(1:C - 1)];
% %     R = [P(2:C), 0];
%     % List of all 1D configurations
%     C000 = (L == 0 & P == 0 & R == 0);
%     C001 = (L == 0 & P == 0 & R == 1);
%     C010 = (L == 0 & P == 1 & R == 0);
%     C011 = (L == 0 & P == 1 & R == 1);
%     C100 = (L == 1 & P == 0 & R == 0);
%     C101 = (L == 1 & P == 0 & R == 1);
%     C110 = (L == 1 & P == 1 & R == 0);
%     C111 = (L == 1 & P == 1 & R == 1);
%     liveMask = C010 | C001 | C110;                % cellular automation rule
%     A(i + 1, liveMask) = 1;                     % set live cells for next generation
% end
% imshow(~A, 'InitialMagnification', 'Fit');   % Display black live cells