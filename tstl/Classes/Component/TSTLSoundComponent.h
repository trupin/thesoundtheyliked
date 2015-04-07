//
//  TSTLSoundComponent.h
//  tstl
//
//  Created by OCTO-CVA on 30/03/2015.
//  Copyright (c) 2015 Vilain. All rights reserved.
//

#import <stdio.h>
#import <ComponentKit/CKCompositeComponent.h>
#import "TSTLSound.h"

@interface TSTLSoundComponent : CKCompositeComponent
+(instancetype)newWithSound:(TSTLSound *)sound;
@end