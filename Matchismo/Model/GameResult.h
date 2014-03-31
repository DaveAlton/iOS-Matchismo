//
//  GameResult.h
//  Matchismo
//
//  Created by Dave Alton on 2014-03-30.
//  Copyright (c) 2014 m2m server software gmbh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameResult : NSObject
+(NSArray *)allGameResults;
@property(readonly, nonatomic) NSDate *start;
@property(readonly, nonatomic) NSDate *end;
@property(readonly, nonatomic) NSTimeInterval duration;
@property(nonatomic) int score;
@property(strong, nonatomic) NSString *gameType;
-(NSComparisonResult)compareScore:(GameResult *)result;
-(NSComparisonResult)compareDuration:(GameResult *)result;
@end
