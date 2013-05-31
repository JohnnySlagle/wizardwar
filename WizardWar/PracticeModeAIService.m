//
//  PracticeModeAIService.m
//  WizardWar
//
//  Created by Sean Hess on 5/31/13.
//  Copyright (c) 2013 The LAB. All rights reserved.
//

#import "PracticeModeAIService.h"
#import "Spell.h"
#import "SpellFireball.h"
#import "SpellEarthwall.h"
#import "SpellBubble.h"
#import "SpellMonster.h"
#import "SpellVine.h"
#import "SpellWindblast.h"
#import "SpellIcewall.h"

@interface PracticeModeAIService ()
@property (nonatomic) NSInteger lastSpellTick;
@property (nonatomic) NSArray * allSpells;
@end

@implementation PracticeModeAIService

-(id)init {
    self = [super init];
    if (self) {
        
        self.allSpells = @[[SpellFireball class], [SpellEarthwall class], [SpellWindblast class], [SpellMonster class], [SpellIcewall class], [SpellBubble class], [SpellVine class]];
        
    }
    return self;
}

-(void)simulateTick:(NSInteger)currentTick interval:(NSTimeInterval)interval {
    
    // interval is seconds per tick
    float ticksPerSecond = 1/interval;
    NSInteger castTickInterval = 3*ticksPerSecond;
    
    if (self.lastSpellTick + castTickInterval < currentTick) {
        self.lastSpellTick = currentTick;
        [self.delegate aiDidCastSpell:[self randomSpell]];
    }
}

-(Spell*)randomSpell {
    NSUInteger randomIndex = arc4random() % [self.allSpells count];
    Class SpellType = [self.allSpells objectAtIndex:randomIndex];
    return [SpellType new];
}

@end