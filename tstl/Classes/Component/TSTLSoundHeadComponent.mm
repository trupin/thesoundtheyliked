#import <ComponentKit/CKBackgroundLayoutComponent.h>
#include "TSTLSoundHeadComponent.h"
#import "CKStackLayoutComponent.h"
#import "TSTLSoundHeadInfoComponent.h"
#import "CKImageComponent.h"
#import "TSTLSound.h"

@implementation TSTLSoundHeadComponent

+ (instancetype)newWithSound:(TSTLSound *)sound {
    return [super newWithComponent:
            [CKBackgroundLayoutComponent newWithComponent:
                            [CKStackLayoutComponent newWithView:{}
                                                           size:{}
                                                          style:{
                                                                  .direction = CKStackLayoutDirectionHorizontal
                                                          } children:{
                                            /*{
                                                [CKImageComponent newWithImage:[UIImage imageNamed:@"3"]
                                                                          size:{
                                                                              .width = 30,
                                                                              .height = 30
                                                                          }]
                                            },*/
                                            {
                                                    [TSTLSoundHeadInfoComponent newWithSound:sound]
                                            }
                                    }]
                                               background:[CKComponent newWithView:{
                                                       [UIView class],
                                                       {
                                                               {@selector(setBackgroundColor:), [UIColor blueColor]}
                                                       }
                                               }                              size:{}]
            ]];
};

@end