clear; close all; clc;
call_order = readmatrix('call_order.txt');
raw_boards = readmatrix('input.txt');
boards = pagetranspose(reshape(raw_boards.',5,5,[]));
calls = zeros(size(boards));

%% Part 1
for i = 1:numel(call_order)
    call = call_order(i);
    % Find all instances of number, mark them as called in calls
    calls(boards == call) = 1;
    % Find if calls in row or column have hit 5
    [~,c] = find(sum(calls,2) == 5); % Did the column sum hit 5?
    [~,r] = find(pagetranspose(sum(calls) == 5)); % Did the row sum hit 5?
    if ~isempty(r) % We have a winner!
        unmarked = sum(boards(:,:,r).*abs(1-calls(:,:,r)),'all');
        p1 = unmarked*call;
        break;
    elseif ~isempty(c) % We have a winner!
        unmarked = sum(boards(:,:,c).*abs(1-calls(:,:,c)),'all');
        p1 = unmarked*call;
        break;
    end
end
p1

%% Part 2
winning_boards = [];
win_hist = zeros(numel(call_order),size(boards,3));
calls = zeros(size(boards));
last_win = Inf;
for i = 1:numel(call_order)
    call = call_order(i);
    % Find all instances of number, mark them as called in calls
    calls(boards == call) = 1;
    % Find if calls in row or column have hit 5
    [~,c] = find(sum(calls,2) == 5); % Did the column sum hit 5?
    [~,r] = find(pagetranspose(sum(calls) == 5)); % Did the row sum hit 5?
    if ~isempty(r) || ~isempty(c) % We have a winner!
        winning_boards = unique([r; c]);
        win_hist(i,1:numel(winning_boards)) = winning_boards;
    end
    if sum(win_hist(i,:) == 0) == 1
        % Last winner is the only one missing
        last_win = setdiff(1:size(boards,3),win_hist(i,:));
    end
    if ismember(last_win,winning_boards) % This round is the last winning round, compute score.
        unmarked = sum(boards(:,:,last_win).*abs(1-calls(:,:,last_win)),'all');
        p2 = unmarked*call
        return;
    end
end