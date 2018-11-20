
--
-- Add the quests
--

insert into quests values ('Bounty Hunter', 'Earth', 'Eliminate Target',	'25',	'Farmer');
insert into quests values ('Patrols 101', 'Earth', 'Patrol',	'15',	'Farmer');
insert into quests values ('The mountaintop', 'Earth', 'Eliminate enemies',	'10',	'Butcher');
insert into quests values ('High-Value Targets', 'Earth', 'Eliminate Target',	'20',	'Pawn');
insert into quests values ('A Cry for Help', 'Moon', 'Defend Objective',	'10',	'Rook');
insert into quests values ('Retaliation', 'Moon', 'Attack objective',	'25',	'King');
insert into quests values ('Neverending Battle', 'Venus', 'Eliminate enemies',	'30',	'Ruler');
insert into quests values ('Back in the Saddle', 'Venus', 'Attack objective',	'20',	'Bishop');
insert into quests values ('Flameforged', 'Venus', 'Eliminate Target',	'20',	'Knight');
insert into quests values ('Successor to the Throne', 'Mars', 'Defend Objective', '25',	'Queen');
insert into quests values ('Conquer the Day', 'Mars', 'Eliminate enemies',	'35',	'Lancer');
insert into quests values ('Lost and Found', 'Mars', 'Collect Items',	'15',	'Archer');

--
-- Add the found_on
--
insert into found_on values ('Earth', 'Patrols 101');
insert into found_on values ('Earth', 'Bounty Hunter');
insert into found_on values ('Earth', 'The mountaintop');
insert into found_on values ('Earth', 'High-Value Targets');
insert into found_on values ('Moon', 'A Cry for Help');
insert into found_on values ('Moon', 'Retaliation');
insert into found_on values ('Venus', 'Back in the Saddle');
insert into found_on values ('Venus', 'Neverending Battle');
insert into found_on values ('Venus', 'Flameforged');
insert into found_on values ('Mars', 'Successor to the Throne');
insert into found_on values ('Mars', 'Conquer the Day');
insert into found_on values ('Mars', 'Lost and Found');
--
-- 
--