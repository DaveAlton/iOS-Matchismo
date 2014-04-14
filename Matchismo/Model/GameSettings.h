//
//  GameSettings.h
//  Matchismo
//
//  Created by Dave Alton on 2014-04-14.
//  Copyright (c) 2014 m2m server software gmbh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameSettings : NSObject
@property (nonatomic) int matchBonus;
@property (nonatomic) int mismatchPenalty;
@property (nonatomic) int flipCost;
@end
