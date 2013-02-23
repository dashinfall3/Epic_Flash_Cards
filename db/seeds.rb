deck1 = Deck.create(:name => 'State Capitals')
deck2 = Deck.create(:name => 'Cartoon Characters')
deck3 = Deck.create(:name => "Brayden's favorite musicians")

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
card5 = Card.create(:question => "Who is Brayden's all time favorite artist that sings about a last dance with mary jane?",
                    :answer => "Tom Petty",
                    :deck_id => 3)
card6 = Card.create(:question => "This band was big in the 90s and will never let you go.",
                    :answer => "Third Eye Blind",
                    :deck_id => 3)





