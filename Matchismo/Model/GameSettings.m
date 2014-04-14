//
//  GameSettings.m
//  Matchismo
//
//  Created by Dave Alton on 2014-04-14.
//  Copyright (c) 2014 m2m server software gmbh. All rights reserved.
//

#import "GameSettings.h"
@interface GameSettings()

@end
@implementation GameSettings
#define GAME_SETTINGS_KEY @"Game_Settings_Key"
#define MATCHBONUS_KEY @"Mismatch_Bonus_Key"
#define MISMATCHPENALTY_KEY @"Mismatch_Penalty_Key"
#define FLIPCOST_KEY @"Flip_Cost_Key"
-(int)intValueForKey:(NSString *)key withDefault:(int)defaultValue
{
    NSMutableDictionary *settings = [[[NSUserDefaults standardUserDefaults]
                                      dictionaryForKey:GAME_SETTINGS_KEY] mutableCopy];
    if(!settings) return defaultValue;
    if(![[settings allKeys] containsObject:key]) return defaultValue;
    return [settings[key] intValue];
}
-(void)setIntValue:(int)value forKey:(NSString *)key
{
    NSMutableDictionary *settings = [[[NSUserDefaults standardUserDefaults] dictionaryForKey:GAME_SETTINGS_KEY] mutableCopy];
    if(!settings) settings = [[NSMutableDictionary alloc] init];
    settings[key] = @(value);
    [[NSUserDefaults standardUserDefaults] setObject:settings forKey:GAME_SETTINGS_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
-(int)matchBonus
{
    return [self intValueForKey:MATCHBONUS_KEY withDefault:4];
}
-(int)mismatchPenalty
{
    return [self intValueForKey:MISMATCHPENALTY_KEY withDefault:2];
}
-(int)flipCost
{
    return [self intValueForKey:FLIPCOST_KEY withDefault:1];
}
-(void)setMatchBonus:(int)matchBonus
{
    [self setIntValue:matchBonus forKey:MATCHBONUS_KEY];
}
-(void)setMismatchPenalty:(int)mismatchPenalty
{
    [self setIntValue:mismatchPenalty forKey:MISMATCHPENALTY_KEY];
}
-(void)setFlipCost:(int)flipCost
{
    [self setIntValue:flipCost forKey:FLIPCOST_KEY];
}
@end
