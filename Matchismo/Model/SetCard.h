//
//  SetCard.h
//  Matchismo
//
//  Created by Dave Alton on 12/17/2013.
//  Copyright (c) 2013 m2m server software gmbh. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card
@property (strong, nonatomic) NSString *color;
@property (strong, nonatomic) NSString *symbol;
@property (strong, nonatomic) NSString *shading;
@property (nonatomic) NSUInteger number;
@property (nonatomic, strong) NSString *contents;

-(int)match:(NSArray *)otherCards;
+ (NSArray *)validColors;
+ (NSArray *)validSymbols;
+ (NSArray *)validShading;
+ (NSUInteger)maxNumber;
@end
