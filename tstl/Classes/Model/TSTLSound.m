#import "TSTLSound.h"

@implementation TSTLSound

- (instancetype)init
{
    self = [super init];
    if (self) {
        _imageUrl = @"https://i1.sndcdn.com/artworks-000107908928-vwuu8v-t500x500.jpg";
        _artistName = @"Jack Beats";
        _songName = [NSString stringWithFormat:@"My head is a jungle %f", [NSDate new].timeIntervalSince1970];
    }
    return self;
}

@end
