//
//  RDColTableCell.m
//  RDColTableviewExample
//
//  Created by Webdior Mac - 2 on 03/11/17.
//  Copyright © 2017 Raj Dhakate. All rights reserved.
//

#import "RDColTableCell.h"

static NSString *collectionCellID = @"cell";

@implementation RDColTableCell
{
    id cell;
    NSIndexPath *pathOfTheCell;
    NSIndexPath *newIndexPath;
    NSIndexPath *selectedIndexpath;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    cell = [[_collectionview superview] superview];
    _collectionview.delegate = self;
    _collectionview.dataSource = self;
    [_collectionview registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:collectionCellID];
}

#pragma mark
#pragma CollectionView Datasource/Delegate

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(100, 100);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCellID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    selectedIndexpath = indexPath;
    pathOfTheCell = [[_datasource collectionTableView] indexPathForCell:cell];
    newIndexPath = [NSIndexPath indexPathForRow:indexPath.row inSection:pathOfTheCell.row];
    [_delegate selectedCollectionCellIndexPath:collectionView indexPath:newIndexPath];
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    selectedIndexpath = nil;
}

@end
