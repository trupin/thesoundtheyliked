#import "TSTLAppDelegate.h"
#import "SCSoundCloud.h"
#import "TSTLLoginViewController.h"
#import "TSTLSoundCollectionViewController.h"

@interface TSTLAppDelegate ()

@end

@implementation TSTLAppDelegate
{
    UIWindow *_window;
}

+ (TSTLAppDelegate *)instance {
    return [UIApplication sharedApplication].delegate;
}

+ (void) initialize
{
    [SCSoundCloud setClientID:@"16e53b86d42135ff241cce54dfba8601"
                       secret:@"ac10ccd418d393e8538e6e4a901306e6"
                  redirectURL:[NSURL URLWithString:@"thesoundtheylike://oauth"]];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    [self moveToLoggedOutMode];

    [_window makeKeyAndVisible];

    return YES;
}

- (void)moveToLoggedInMode {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.minimumLineSpacing = 10;

    TSTLSoundCollectionViewController *viewController = [[TSTLSoundCollectionViewController alloc] initWithCollectionViewLayout:flowLayout];
    [_window setRootViewController:[[UINavigationController alloc] initWithRootViewController:viewController]];
}

- (void)moveToLoggedOutMode {
    UIViewController *loginViewController = [[TSTLLoginViewController alloc] init];

    [_window setRootViewController:loginViewController];
}

@end
