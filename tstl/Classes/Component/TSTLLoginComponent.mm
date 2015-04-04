#import <ComponentKit/CKCompositeComponent.h>
#import "TSTLLoginComponent.h"
#import "CKButtonComponent.h"
#import "UIImage+SoundCloudUI.h"
#import "CKComponentScope.h"

@implementation TSTLLoginComponent

+ (instancetype)new {
    CKComponentScope scope(self);

    CKButtonComponent *component = [CKButtonComponent newWithTitles:{{UIControlStateNormal, @"Login with SoundCloud"}}
                                                        titleColors:{{UIControlStateNormal, [UIColor whiteColor]}}
                                                             images:{}
                                                   backgroundImages:{{UIControlStateNormal, [UIImage imageWithColor:[UIColor orangeColor]]}}
                                                          titleFont:{}
                                                           selected:NO
                                                            enabled:YES
                                                             action:@selector(loginAction:)
                                                               size:{}
                                                         attributes:{}
                                         accessibilityConfiguration:{}];
    return [self newWithComponent:component];
}

@end
