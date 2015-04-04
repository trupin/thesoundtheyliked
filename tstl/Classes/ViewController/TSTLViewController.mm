#import <ComponentKit/CKComponent.h>
#import "TSTLViewController.h"
#import "CKComponentProvider.h"
#import "CKCollectionViewDataSource.h"
#import "CKComponentFlexibleSizeRangeProvider.h"
#import "CKStaticLayoutComponent.h"

@interface TSTLFullScreenLayout : UICollectionViewFlowLayout
@end

@implementation TSTLFullScreenLayout

- (void)prepareLayout {
    self.itemSize = self.collectionView.frame.size;
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.collectionView.scrollEnabled = NO;
    self.collectionView.pagingEnabled = NO;
    self.minimumLineSpacing = 0.0;
    self.minimumInteritemSpacing = 0.0;
    self.sectionInset = UIEdgeInsetsZero;
    self.footerReferenceSize = CGSizeZero;
    self.headerReferenceSize = CGSizeZero;
}

@end

@interface TSTLViewController () <CKComponentProvider>
@end

@implementation TSTLViewController {
    CKCollectionViewDataSource *_dataSource;
    CKComponentFlexibleSizeRangeProvider *_sizeRangeProvider;
}

- (instancetype)init {
    _sizeRangeProvider = [CKComponentFlexibleSizeRangeProvider providerWithFlexibility:CKComponentSizeRangeFlexibleHeight];
    return [self initWithCollectionViewLayout:[TSTLFullScreenLayout new]];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _dataSource = [[CKCollectionViewDataSource alloc] initWithCollectionView:self.collectionView
                                                 supplementaryViewDataSource:nil
                                                           componentProvider:self.class
                                                                     context:self.collectionView
                                                   cellConfigurationFunction:nil];

    CKArrayControllerSections sections;
    sections.insert(0);
    [_dataSource enqueueChangeset:{sections, {}} constrainedSize:{}];

    CKArrayControllerInputItems items;
    items.insert([NSIndexPath indexPathForRow:0 inSection:0], [NSObject new]);

    [_dataSource enqueueChangeset:{{}, items}
                  constrainedSize:[_sizeRangeProvider sizeRangeForBoundingSize:self.collectionView.bounds.size]];
}

+ (CKComponent *)componentForModel:(id <NSObject>)model context:(UICollectionView *)context {
    return [CKStaticLayoutComponent
            newWithView: {
                    [UIView class],
                    {
                            {@selector(setBackgroundColor:), [UIColor whiteColor]}
                    }
            } size: {
                    .height = context.frame.size.height,
                    .width = context.frame.size.width
            } children: {
                    {
                            CGPointMake(0, 20),
                            [self component]
                    }
            }];
}

+ (CKComponent *)component {
    return nil;
}

@end