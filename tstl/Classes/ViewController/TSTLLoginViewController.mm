#import <ComponentKit/CKComponent.h>
#import "TSTLLoginViewController.h"
#import "CocoaSoundCloudAPI/SCSoundCloud.h"
#import "UIImage+SoundCloudUI.h"
#import "View+MASAdditions.h"
#import "TSTLAppDelegate.h"

@implementation TSTLLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    // login button
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginButton setTitle:@"Login with SoundCloud" forState:UIControlStateNormal];
    [loginButton setBackgroundImage:[UIImage imageWithColor:[UIColor orangeColor]] forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(didTapLoginButton:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:loginButton];

    [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.left.right.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 10, 0, 10));
        make.height.greaterThanOrEqualTo(self.view).dividedBy(4);
    }];
}

- (IBAction)didTapLoginButton:(id)sender {
    SCLoginViewControllerCompletionHandler handler = ^(NSError *error) {
        if (SC_CANCELED(error)) {
            NSLog(@"Canceled!");
        } else if (error) {
            NSLog(@"Error: %@", [error localizedDescription]);
        } else {
            [TSTLAppDelegate.instance moveToLoggedInMode];
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

@end