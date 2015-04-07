#import "TSTLSoundHeadComponent.h"
#import "TSTLSound.h"
#import "CKBackgroundLayoutComponent.h"
#import "CKStackLayoutComponent.h"
#import "CKLabelComponent.h"

@implementation TSTLSoundHeadComponent

+ (instancetype)newWithSound:(TSTLSound *)sound {
    return [super newWithComponent:
            [CKBackgroundLayoutComponent newWithComponent:
                            [CKStackLayoutComponent newWithView:{} size:{} style:{} children:{
                                    {
                                            [CKLabelComponent newWithLabelAttributes: {
                                                    .string = sound.artistName,
                                                    .font = [UIFont boldSystemFontOfSize:20],
                                                    .color = [UIColor redColor]
                                            } viewAttributes: {
                                                    {@selector(setBackgroundColor:), [UIColor redColor]}
                                            }],
                                            .alignSelf = CKStackLayoutAlignSelfCenter
                                    }
                            }]
                                               background:[CKComponent newWithView:{
                                                       [UIView class],
                                                       {
                                                               {@selector(setBackgroundColor:), [UIColor blueColor]}
                                                       }
                                               } size:{}]]
    ];
}

@end