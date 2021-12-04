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
    [~,r] = find(sum(calls) == 5); % Did the row sum hit 5?
    if ~isempty(r) % We have a winner!
        unmarked = sum(boards(abs(1-calls(:,:,r)),r),'all');
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