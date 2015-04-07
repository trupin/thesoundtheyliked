#import "CKCompositeComponent.h"

@class TSTLSound;

@interface TSTLSoundHeadComponent : CKCompositeComponent

+ (CKComponent *)newWithSound:(TSTLSound *)sound;

@end