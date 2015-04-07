#import <UIKit/UIKit.h>

@interface TSTLAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+ (TSTLAppDelegate *)instance;


- (void)moveToLoggedInMode;

- (void)moveToLoggedOutMode;
@end

