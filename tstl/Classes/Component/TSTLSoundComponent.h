#import "CKCompositeComponent.h"

@class TSTLSound;

@interface TSTLSoundComponent : CKCompositeComponent

+ (CKComponent *)newWithSound:(TSTLSound *)sound;

@end