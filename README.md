# RDColTableCell
Tableview cell contains Collection view. Easy delegate to get back the selected collection view item of selected tableview cell.

![Demo](https://github.com/rajdhakate/RDColTeableCell/blob/master/RDColTableView.gif)

## REQUISITE : Xcode 9 or Later, iOS 9+.**

## HOW TO ADD:

1. Clone/Download the master-repo.

2. Import ```"RDColTeableCell"``` folder (.m/.h) into your project.

3. Add ```#import "RDColTeableCell/RDColTeableCell.h"```

## HOW TO USE:

1. In you tableView's ```cellForRowAtIndexPath``` implement the ```RDColTableCell``` object.

2. Set cell's ```datasource``` and ```delegate``` to your ```viewcontroller```.

```
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RDColTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.datasource = self;
    cell.delegate = self;
    return cell;
}
```

3. Implement the ```datasource``` and ```delegate``` methods.

```
- (UITableView *)collectionTableView {
    // return tableview
}
```

```
- (void)selectedCollectionCellIndexPath:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath {
    // indexPath.row - selected item of collectionview
    // indexPath.section - selected row of tableview
}
```

4. (Optional) You can also use cell's ```collectionview``` property to register collectionview cell.

```
[cell.collectionview registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
```

# Support

Please check the example included.

Suggestions/Queries/Feedbacks are welcome.

Feel free to contribute in anyway.


CHEERS!
