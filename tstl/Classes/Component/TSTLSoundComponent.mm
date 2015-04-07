#import <ComponentKit/CKBackgroundLayoutComponent.h>
#import <ComponentKit/CKStackLayoutComponent.h>
#import <ComponentKit/CKLabelComponent.h>
#include "TSTLSoundComponent.h"
#import "TSTLSoundHeadComponent.h"
#import "TSTLSoundActionsComponent.h"

@implementation TSTLSoundComponent

+ (instancetype)newWithSound:(TSTLSound *)sound {
    return [self newWithComponent:
            [CKStackLayoutComponent
                    newWithView:{
                            [UIView class],
                            {
                                    {@selector(setBackgroundColor:), [UIColor orangeColor]}
                            }
                    }
                           size:{}
                          style:{
                                  .direction = CKStackLayoutDirectionVertical
                          }
                       children:{
                               {
                                       .component = [TSTLSoundHeadComponent newWithSound:sound],
                                       .spacingAfter = 20
                               },
                               {
                                       .component = [TSTLSoundActionsComponent newWithSound:sound],
                               }
                       }]
    ];
}

@end