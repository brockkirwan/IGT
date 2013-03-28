%look in the Data directory for each subject's folder
dataDir = dir('Data/s*');

%Build up the subject list. this is going to cause problems if you have any
% other directories in there that start with an 's'.
subList = {};
for i = 1:length(dataDir)
    if dataDir(i).isdir && exist(['Data' filesep dataDir(i).name filesep 'IGT_DATA.mat']);
        subList = [subList dataDir(i).name];
    end
end

%place holder variables
decksSelected = zeros(length(subList),4,4); %subj x decks x rounds
totalWon = zeros(length(subList),4); %subj x rounds
totalLost = zeros(length(subList),4); %subj x rounds

for subj = 1:length(subList)
    %variable for the subject directory name
    sname = subList{subj};
    
    %load in the matlab data file
    load(['Data' filesep sname filesep 'IGT_DATA.mat']);
    
    %loop over task blocks
    for block = 1:4
        
        %loop over decks
        for deck = 1:4
            decksSelected(subj,deck,block) = sum(eq(DATA.selectedDeck(:,block),deck));
        end
        
        totalWon(subj,block) = sum(DATA.reward(:,block));
        totalLost(subj,block) = sum(DATA.punish(:,block));
        
    end
end

%calculate the total net
totalNet = totalWon-totalLost;

%graph the winnings
figure; hold on;
bar(mean(totalNet));
xlabel('Testing Block');
ylabel('Mean Points Net');
title('Net Winnings by Block');
set(gca,'XTick', 1:4);
hold off

%graph deck selection by block
meanDecksSelected = squeeze(mean(decksSelected))';

figure; hold on;
bar(meanDecksSelected);
xlabel('Testing Block');
ylabel('Mean Selections');
title('Deck Selections by Block');
legend({'Risky Frequent', 'Risky Infrequent', 'Safe Frequent', 'Safe Infrequent'},'Location','SouthEast');
set(gca,'XTick', 1:4);
hold off;

%write out the deck selection for analysis
for i = 1:length(subList)
    fid = fopen('decksSelected.txt','a');
    fprintf(fid,'%s\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d', ...
        subList{i}, decksSelected(i,1,1), decksSelected(i,2,1), decksSelected(i,3,1), decksSelected(i,4,1), ...
        decksSelected(i,1,2), decksSelected(i,2,2), decksSelected(i,3,2), decksSelected(i,4,2), ...
        decksSelected(i,1,3), decksSelected(i,2,3), decksSelected(i,3,3), decksSelected(i,4,3), ...
        decksSelected(i,1,4), decksSelected(i,2,4), decksSelected(i,3,4), decksSelected(i,4,4));
    fclose(fid);
end

