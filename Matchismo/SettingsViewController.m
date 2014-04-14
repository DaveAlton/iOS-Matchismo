//
//  SettingsViewController.m
//  Matchismo
//
//  Created by Dave Alton on 2014-04-14.
//  Copyright (c) 2014 m2m server software gmbh. All rights reserved.
//

#import "SettingsViewController.h"
#import "GameSettings.h"
@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *matchBonusLabel;
@property (weak, nonatomic) IBOutlet UILabel *mismatchPenaltyLabel;
@property (weak, nonatomic) IBOutlet UILabel *flipCostLabel;
@property (weak, nonatomic) IBOutlet UISlider *matchBonusSlider;
@property (weak, nonatomic) IBOutlet UISlider *mismatchPenaltySlider;
@property (weak, nonatomic) IBOutlet UISlider *flipCostSlider;
@property (strong, nonatomic) GameSettings *gameSettings;
@end

@implementation SettingsViewController
-(GameSettings *)gameSettings
{
    if(!_gameSettings) _gameSettings = [[GameSettings alloc] init];
    return _gameSettings;
}
-(void)setLabel:(UILabel *)label forSlider:(UISlider *)slider
{
    int sliderValue;
    sliderValue = lroundf(slider.value);
    [slider setValue:sliderValue animated:NO];
    label.text = [NSString stringWithFormat:@"%d", sliderValue];
}
- (IBAction)matchBonusSliderChanged:(UISlider *)sender {
    [self setLabel:_matchBonusLabel forSlider:sender];
    self.gameSettings.matchBonus = floor(sender.value);
}
- (IBAction)mismatchPenaltySliderChanged:(UISlider *)sender {
    [self setLabel:_mismatchPenaltyLabel forSlider:sender];
    self.gameSettings.mismatchPenalty = floor(sender.value);
}
- (IBAction)flipCostSliderChanged:(UISlider *)sender {
    [self setLabel:_flipCostLabel forSlider:sender];
    self.gameSettings.flipCost = floor(sender.value);
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
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.matchBonusSlider.value = self.gameSettings.matchBonus;
    self.mismatchPenaltySlider.value = self.gameSettings.mismatchPenalty;
    self.flipCostSlider.value = self.gameSettings.flipCost;
    [self setLabel:self.matchBonusLabel forSlider:self.matchBonusSlider];
    [self setLabel:self.mismatchPenaltyLabel forSlider:self.mismatchPenaltySlider];
    [self setLabel:self.matchBonusLabel forSlider:self.matchBonusSlider];
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
