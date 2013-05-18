//
//  SpellEarthwall.m
//  WizardWar
//
//  Created by Sean Hess on 5/17/13.
//  Copyright (c) 2013 The LAB. All rights reserved.
//

#import "SpellEarthwall.h"
#import "SpellFireball.h"
#import "SpellMonster.h"

@implementation SpellEarthwall

-(id)init {
    if ((self=[super init])) {
        self.speed = 0;
        self.size = 20;
        self.strength = 3;
        self.mana = 1;
    }
    return self;
}

-(SpellInteraction *)interactSpell:(Spell *)spell {
    
    if ([spell isType:[SpellEarthwall class]]) {
        if (self.created < spell.created) // if older
            return [SpellInteraction cancel];
    }
    
    else if ([spell isType:[SpellFireball class]]) {
        // TODO wear down!
        self.strength -= 1;
        
        if (self.strength == 0)
            return [SpellInteraction cancel];
        else
            return [SpellInteraction modify];
    }
    
    else if ([spell isType:[SpellMonster class]]) {
        return [SpellInteraction cancel];
    }
    
    return [SpellInteraction nothing];
}

@end