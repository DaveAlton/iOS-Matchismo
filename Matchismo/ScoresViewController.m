//
//  ScoresViewController.m
//  Matchismo
//
//  Created by Dave Alton on 2014-03-30.
//  Copyright (c) 2014 m2m server software gmbh. All rights reserved.
//

#import "ScoresViewController.h"
#import "GameResult.h"

@interface ScoresViewController ()
@property (weak, nonatomic) IBOutlet UITextView *scoresTextView;
@property (strong, nonatomic) NSArray *scores;
@end

@implementation ScoresViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.scores = [GameResult allGameResults];
    [self updateUI];
}
-(void)updateUI
{
    NSString *text = @"";
    for(GameResult *result in self.scores)
    {
        text = [text stringByAppendingString:[self stringFromResult:result]];
    }
    self.scoresTextView.text = text;
    NSArray *sortedScores = [self.scores sortedArrayUsingSelector:@selector(compareScore:)];
    [self changeScore:[sortedScores firstObject] toColor:[UIColor redColor]];
    [self changeScore:[sortedScores lastObject] toColor:[UIColor greenColor]];
    sortedScores = [self.scores sortedArrayUsingSelector:@selector(compareDuration:)];
    [self changeScore:[sortedScores firstObject] toColor:[UIColor purpleColor]];
    [self changeScore:[sortedScores lastObject] toColor:[UIColor blueColor]];
}
-(void)changeScore:(GameResult *)result toColor:(UIColor *)color
{
    NSRange range = [self.scoresTextView.text rangeOfString:[self stringFromResult:result]];
    [self.scoresTextView.textStorage addAttribute:NSForegroundColorAttributeName value:color range:range];
}
-(NSString *)stringFromResult:(GameResult *)result
{
    return [NSString stringWithFormat:@"%@: %d, (%@, %gs)\n", result.gameType, result.score, [NSDateFormatter localizedStringFromDate:result.end dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle], round(result.duration)];
}
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
