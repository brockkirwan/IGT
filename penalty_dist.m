function decks=penalty_dist(NumberofCards)

	decks.reward = zeros(4,NumberofCards);
	decks.punish = zeros(4,NumberofCards);
	decks.index = ones(1,4);		% current index of top card on decks
	decks.names = ['A', 'B', 'C', 'D'];

	for i=1 : NumberofCards
		decks.reward(1,i) = 100;
		decks.reward(2,i) = 100;
		decks.reward(3,i) = 50;
		decks.reward(4,i) = 50;
	end

	penalty=zeros(4,40);
	penalty(1,3) = 150;
	penalty(1,5) = 300;
	penalty(1,7) = 200;
	penalty(1,9) = 250;
	penalty(1,10)= 350;
	penalty(1,12)= 350;
	penalty(1,14)= 250;
	penalty(1,15)= 200;
	penalty(1,17)= 300;
	penalty(1,18)= 150;
	penalty(1,22)= 300;
	penalty(1,24)= 350;
	penalty(1,26)= 200;
	penalty(1,27)= 250;
	penalty(1,28)= 150;
	penalty(1,31)= 350;
	penalty(1,32)= 200;
	penalty(1,33)= 250;
	penalty(1,37)= 150;
	penalty(1,38)= 300;

	penalty(2,9) = 1250;
	penalty(2,14)= 1250;
	penalty(2,21)= 1250;
	penalty(2,32)= 1250;

	penalty(3,3) = 50;
	penalty(3,5) = 50;
	penalty(3,7) = 50;
	penalty(3,9) = 50;
	penalty(3,10)= 50;
	penalty(3,12)= 25;
	penalty(3,13)= 75;
	penalty(3,17)= 25;
	penalty(3,18)= 75;
	penalty(3,20)= 50;
	penalty(3,24)= 50;
	penalty(3,25)= 25;
	penalty(3,26)= 50;
	penalty(3,29)= 75;
	penalty(3,30)= 50;
	penalty(3,34)= 25;
	penalty(3,35)= 25;
	penalty(3,37)= 75;
	penalty(3,39)= 50;
	penalty(3,40)= 75;

	penalty(4,10)= 250;
	penalty(4,20)= 250;
	penalty(4,29)= 250;
	penalty(4,35)= 250;

	decks.punish = penalty;
end
