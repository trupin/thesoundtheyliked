#import <ComponentKit/CKCompositeComponent.h>

@class TSTLSound;


@interface TSTLSoundActionsComponent : CKCompositeComponent
+ (instancetype)newWithSound:(TSTLSound *)sound;
@end