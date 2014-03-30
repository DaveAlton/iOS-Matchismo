//
//  HistoryViewController.m
//  Matchismo
//
//  Created by Dave Alton on 2014-03-28.
//  Copyright (c) 2014 m2m server software gmbh. All rights reserved.
//

#import "HistoryViewController.h"

@interface HistoryViewController ()
@property (weak, nonatomic) IBOutlet UITextView *historyTextView;
@property (strong, nonatomic) NSArray *history;
@end

@implementation HistoryViewController

- (void)setHistory:(NSArray *)history
{
    _history = history;
    if(self.view.window)
        [self updateUI];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
}
-(void)updateUI
{
    if([_history.firstObject isKindOfClass:[NSAttributedString class]])
    {
        NSMutableAttributedString *historyText = [[NSMutableAttributedString alloc] init];
        int i = 1;
        for(NSAttributedString *line in self.history)
        {
            [historyText appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%2d", i++]]];
            [historyText appendAttributedString:line];
            [historyText appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n\n"]];
        }
        UIFont *font = [self.historyTextView.textStorage attribute:NSFontAttributeName
                                                           atIndex:0
                                                    effectiveRange:NULL];
        [historyText addAttribute:NSFontAttributeName
                            value:font
                            range:NSMakeRange(0, historyText.length)];
        self.historyTextView.attributedText = historyText;
    }
    else
    {
        NSString *historyText = @"";
        int i = 1;
        for(NSString *line in self.history)
        {
            historyText = [NSString stringWithFormat:@"%@%2d: %@\n\n", historyText, i++, line];
        }
        self.historyTextView.text = historyText;
    }
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    NSLog(@"Here");
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    NSLog(@"Here");
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

@end
