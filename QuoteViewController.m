//
//  QuoteViewController.m
//  SimpleQuoteApp
//
//  Created by Jeffrey Linwood on 10/23/14.
//  Copyright (c) 2014 Jeff Linwood. All rights reserved.
//

#import "QuoteViewController.h"

@interface QuoteViewController ()

@property (strong, nonatomic) NSArray *quotes;
@property (assign, nonatomic) int currentIndex;

@property (weak, nonatomic) IBOutlet UILabel *quoteLabel;
@property (weak, nonatomic) IBOutlet UIButton *previousQuoteButton;
@property (weak, nonatomic) IBOutlet UIButton *nextQuoteButton;
- (IBAction)previousQuote:(id)sender;
- (IBAction)nextQuote:(id)sender;

@end

@implementation QuoteViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.currentIndex = 0;
    self.quotes = @[@"Quote 1 - author 1",@"Quote 2 - author 2", @"Quote 3 - author 3"];
    [self updateUI];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) updateUI {
    self.quoteLabel.text = self.quotes[self.currentIndex];
    if (self.currentIndex == 0) {
        self.previousQuoteButton.enabled = NO;
    } else {
        self.previousQuoteButton.enabled = YES;
    }
    if (self.currentIndex == [self.quotes count] - 1) {
        self.nextQuoteButton.enabled = NO;
    } else {
        self.nextQuoteButton.enabled = YES;
    }
}

- (IBAction)previousQuote:(id)sender {
    if (self.currentIndex <=0) {
        return;
    }
    self.currentIndex = self.currentIndex - 1;
    [self updateUI];
    
}

- (IBAction)nextQuote:(id)sender {
    if (self.currentIndex >= [self.quotes count] - 1) {
        return;
    }
    self.currentIndex = self.currentIndex + 1;
    [self updateUI];
}
@end
