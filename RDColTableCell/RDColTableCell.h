//
//  RDColTableCell.h
//  RDColTableviewExample
//
//  Created by Webdior Mac - 2 on 03/11/17.
//  Copyright © 2017 Raj Dhakate. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RDColTableViewDatasource <NSObject>
@required

// TableView for embedded collectionview
- (UITableView*) collectionTableView;

@end


@protocol RDColTableViewDelegate <NSObject>
@required

// IndexPath.section - Tableview cell index containing collectionview
// IndexPath.row - Selected item index of collectionview
- (void)selectedCollectionCellIndexPath:(UICollectionView*)collectionView indexPath:(NSIndexPath*)indexPath;

@end

@interface RDColTableCell : UITableViewCell <UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) id datasource;
@property (strong, nonatomic) id delegate;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionview;

@property (strong, nonatomic) id arrayData;

@end
