#import <ComponentKit/CKComponent.h>
#import "TSTLLoginViewController.h"
#import "SCSoundCloud.h"
#import "TSTLLoginComponent.h"
#import "CKCenterLayoutComponent.h"

@implementation TSTLLoginViewController

- (IBAction)login:(id)sender {
    SCLoginViewControllerCompletionHandler handler = ^(NSError *error) {
        if (SC_CANCELED(error)) {
            NSLog(@"Canceled!");
        } else if (error) {
            NSLog(@"Error: %@", [error localizedDescription]);
        } else {
            NSLog(@"Done!");
        }
    };

    [SCSoundCloud requestAccessWithPreparedAuthorizationURLHandler:^(NSURL *preparedURL) {
        SCLoginViewController *loginViewController;

        loginViewController = [SCLoginViewController
                loginViewControllerWithPreparedURL:preparedURL
                                 completionHandler:handler];
        [self presentModalViewController:loginViewController animated:YES];
    }];
}

+ (CKComponent *)component {
    return [CKCenterLayoutComponent
            newWithCenteringOptions:CKCenterLayoutComponentCenteringXY
                      sizingOptions:CKCenterLayoutComponentSizingOptionDefault
                              child:{
                                      [TSTLLoginComponent new]
                              }
                               size:{
                                       .width = CKRelativeDimension::Percent(1),
                                       .height = CKRelativeDimension::Percent(1)
                               }];
}

@end