deck1 = Deck.create(:name => 'State Capitals')
deck2 = Deck.create(:name => 'Cartoon Characters')

card1 = Card.create(:question => 'What is the capital of Maryland?', 
                    :answer => 'Annapolis', 
                    :deck_id => 1)
card2 = Card.create(:question => 'Who is the guy that chases a bunny with a gun?',
                    :answer   => 'Elmer Fud',
                    :deck_id  => 2)
card3 = Card.create(:question => 'What is the capital of California?', 
                    :answer => 'Sacramento', 
                    :deck_id => 1)
card4 = Card.create(:question => 'The character that runs fast and hurts a coyote', 
                    :answer => 'Roadrunner', 
                    :deck_id => 2)


