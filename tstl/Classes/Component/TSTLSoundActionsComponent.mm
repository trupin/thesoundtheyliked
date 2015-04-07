//
// Created by OCTO-CVA on 01/04/15.
// Copyright (c) 2015 Vilain. All rights reserved.
//

#import <ComponentKit/CKBackgroundLayoutComponent.h>
#import <ComponentKit/CKStackLayoutComponent.h>
#import <ComponentKit/CKLabelComponent.h>
#import "TSTLSoundActionsComponent.h"
#import "TSTLSound.h"


@implementation TSTLSoundActionsComponent
+ (instancetype)newWithSound:(TSTLSound *)sound {
    return [self newWithComponent:
            [CKStackLayoutComponent newWithView:{}
                                           size:{
                                                   .width = CKRelativeDimension::Percent(1)
                                           }
                                          style:{
                                                  .direction = CKStackLayoutDirectionHorizontal
                                          }
                                       children:{
                                               {
                                                       [CKComponent newWithView:{
                                                               [UIView class],
                                                               {
                                                                       {@selector(setBackgroundColor:), [UIColor darkGrayColor]}
                                                               }
                                                       } size:{
                                                               .height = 20,
                                                               .width = CKRelativeDimension::Percent(.334)
                                                       }]
                                               },
                                               {
                                                       [CKComponent newWithView:{
                                                               [UIView class],
                                                               {
                                                                       {@selector(setBackgroundColor:), [UIColor grayColor]}
                                                               }
                                                       } size:{
                                                               .height = 20,
                                                               .width = CKRelativeDimension::Percent(.333)
                                                       }]
                                               },
                                               {
                                                       [CKComponent newWithView:{
                                                               [UIView class],
                                                               {
                                                                       {@selector(setBackgroundColor:), [UIColor darkGrayColor]}
                                                               }
                                                       } size:{
                                                               .height = 20,
                                                               .width = CKRelativeDimension::Percent(.333)
                                                       }]
                                               }
                                       }
            ]
    ];
}
@end