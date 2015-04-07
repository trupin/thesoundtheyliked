#include <stdio.h>
#import "CKCompositeComponent.h"
@class TSTLSound;

@interface TSTLSoundHeadComponent : CKCompositeComponent
+(instancetype)newWithSound:(TSTLSound *)sound;
@end