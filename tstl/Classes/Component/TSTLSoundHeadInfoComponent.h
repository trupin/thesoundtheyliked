#include <stdio.h>
#include "CKCompositeComponent.h"
@class TSTLSound;


@interface TSTLSoundHeadInfoComponent : CKCompositeComponent
+(instancetype)newWithSound:(TSTLSound *)sound;
@end