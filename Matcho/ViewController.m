//
//  ViewController.m
//  Matcho
//
//  Created by Anton Lookin on 10/19/15.
//  Copyright © 2015 geekub. All rights reserved.
//

#import "PlayingCardDeck.h"

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) PlayingCardDeck *deck;

@property (weak, nonatomic) IBOutlet UIButton *cardButton;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property NSInteger count;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.count = 0;
}

- (PlayingCardDeck *)deck {
	if (!_deck) {
		_deck = [[PlayingCardDeck alloc] init];
        Card *card1 = [[Card alloc] init];
        card1.contents = @"9♥";
        Card *card2 = [[Card alloc] init];
        card2.contents = @"vrrrr";
        [_deck addCard:card1];
        [_deck addCard:card2];
	}
	return _deck;
}


- (IBAction)cardButtonTapped:(UIButton *)sender {
	if ([sender.currentTitle length]) {
		[sender setTitle:@""
				forState:UIControlStateNormal];
		[sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
						  forState:UIControlStateNormal];
	} else {
		Card *card = [self.deck drawRandomCard];
        if(card != nil){
            [sender setTitle:card.contents
                    forState:UIControlStateNormal];
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                    forState:UIControlStateNormal];
            [sender setTitleColor:card.cardColor forState: UIControlStateNormal];
            self.count = self.count + 1;
            self.countLabel.text = [NSString stringWithFormat:@"%li", self.count];
        }
	}
}

@end
