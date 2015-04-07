#import <ComponentKit/CKStackLayoutComponent.h>
#import <ComponentKit/CKLabelComponent.h>
#import <ComponentKit/CKBackgroundLayoutComponent.h>
#include "TSTLSoundHeadInfoComponent.h"
#import "TSTLSound.h"
#import "CKTextComponent.h"

@implementation TSTLSoundHeadInfoComponent

+ (instancetype)newWithSound:(TSTLSound *)sound {
    return [super newWithComponent:
            [CKBackgroundLayoutComponent newWithComponent:
                            [CKStackLayoutComponent newWithView:{}
                                                           size:{}
                                                          style:{
                                                                  .direction = CKStackLayoutDirectionVertical
                                                          }
                                                       children:{
                                                               {
                                                                       [CKTextComponent newWithTextAttributes:{
                                                                                       .attributedString = [[NSAttributedString alloc] initWithString:sound.artistName]
                                                                               }
                                                                                               viewAttributes:{
                                                                                                       /*{@selector(addAttribute:value:range:), @[NSForegroundColorAttributeName, [UIColor whiteColor], NSMakeRange(0,[sound.artistName length])]}*/
                                                                                               }
                                                                                         accessibilityContext:{}]
                                                               },
                                                               {
                                                                       [CKTextComponent newWithTextAttributes:{
                                                                                       .attributedString = [[NSAttributedString alloc] initWithString:sound.songName]
                                                                               }
                                                                                               viewAttributes:{}
                                                                                         accessibilityContext:{}]
                                                               }
                                                       }]
                                               background:[CKComponent newWithView:{
                                                       [UIView class],
                                                       {
                                                               {@selector(setBackgroundColor:), [UIColor orangeColor]}
                                                       }
                                               }                              size:{}]]
    ];
}

@end