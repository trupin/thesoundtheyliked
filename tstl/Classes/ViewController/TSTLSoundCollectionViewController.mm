#import "TSTLSoundCollectionViewController.h"
#import "TSTLSound.h"
#import "TSTLSoundHeadComponent.h"
#import "TSTLSoundHeadComponent.h"
#import "CKCollectionViewDataSource.h"
#import "TSTLSoundComponent.h"
#import <ComponentKit/CKComponentProvider.h>
#import <ComponentKit/CKComponentFlexibleSizeRangeProvider.h>

@interface TSTLSoundCollectionViewController () <CKComponentProvider>
@end

@implementation TSTLSoundCollectionViewController {
    CKCollectionViewDataSource *_dataSource;
    CKComponentFlexibleSizeRangeProvider *_sizeRangeProvider;
}

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithCollectionViewLayout:layout]) {
        _sizeRangeProvider = [CKComponentFlexibleSizeRangeProvider providerWithFlexibility:CKComponentSizeRangeFlexibleHeight];
        self.title = @"le titre";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _dataSource = [[CKCollectionViewDataSource alloc] initWithCollectionView:self.collectionView
                                                 supplementaryViewDataSource:nil
                                                           componentProvider:self.class
                                                                     context:nil
                                                   cellConfigurationFunction:nil];
    CKArrayControllerSections sections;
    sections.insert(0);
    [_dataSource enqueueChangeset:{sections, {}} constrainedSize:{}];

    NSArray *sounds = @[
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init],
            [[TSTLSound alloc] init]
    ];

    CKArrayControllerInputItems items;
    for (NSUInteger i = 0; i < [sounds count]; ++i) {
        items.insert([NSIndexPath indexPathForRow:i inSection:0], sounds[i]);
    }

    [_dataSource enqueueChangeset:{{}, items}
                  constrainedSize:[_sizeRangeProvider sizeRangeForBoundingSize:self.collectionView.bounds.size]];
}

+ (CKComponent *)componentForModel:(id <NSObject>)model context:(id <NSObject>)context {
    return [TSTLSoundComponent newWithSound:(TSTLSound *) model];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)layout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [_dataSource sizeForItemAtIndexPath:indexPath];
}

@end
