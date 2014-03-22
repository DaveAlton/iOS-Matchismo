//
//  CardGameViewController.h
//  Matchismo
//
//  Created by Martin Mandl on 02.11.13.
//  Copyright (c) 2013 m2m server software gmbh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "deck.h"

@interface CardGameViewController : UIViewController
-(void) updateUI;
@property (weak, nonatomic) IBOutlet UILabel *flipDescription;
@end
