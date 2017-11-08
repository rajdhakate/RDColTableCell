//
//  ViewController.m
//  RDColTableviewExample
//
//  Created by Webdior Mac - 2 on 03/11/17.
//  Copyright © 2017 Raj Dhakate. All rights reserved.
//

#import "ViewController.h"
#import "RDColTableCell.h"

static NSString *cellID = @"tableCell";
static NSString *normalCellID = @"normalCell";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, RDColTableViewDelegate, RDColTableViewDatasource>

@property (strong, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _tableview.delegate = self;
    _tableview.dataSource = self;
    [_tableview registerNib:[UINib nibWithNibName:@"RDColTableCell" bundle:nil] forCellReuseIdentifier:cellID];
    [_tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:normalCellID];
}

#pragma mark : RDColTableViewDatasource
- (UITableView *)collectionTableView {
    return _tableview;
}

#pragma mark : RDColTableViewDelegate
- (void)selectedCollectionCellIndexPath:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath {
    // indexPath.row - selected item of collectionview
    // indexPath.section - selected row of tableview
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"Item Selected %d", indexPath.row] message:[NSString stringWithFormat:@"of cell %d", indexPath.section] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *done = [UIAlertAction actionWithTitle:@"Done" style:UIAlertActionStyleDestructive handler:nil];
    [alert addAction:done];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark : TableViewDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row%2) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:normalCellID];
        cell.textLabel.text = [NSString stringWithFormat:@"Normal Cell %d", indexPath.row];
        return cell;
    } else {
        RDColTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
        cell.datasource = self;
        cell.delegate = self;
        [cell.collectionview registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        return cell;
    }
}


@end
