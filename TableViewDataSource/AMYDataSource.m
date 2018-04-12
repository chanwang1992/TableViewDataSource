//
//  AMYDataSource.m
//  TableViewDataSource
//
//  Created by 红点汽车 on 2018/4/12.
//  Copyright © 2018年 amy. All rights reserved.
//

#import "AMYDataSource.h"

@implementation AMYDataSource
-(id)initWithIdentifier:(NSString *)identifier configureBlock:(CellConfigureBefore)before
{
    if (self=[super init]) {
        _cellIdentifier = identifier;
        _cellConfigureBefore = [before copy];
    }
    return self;
}
-(NSMutableArray*)dataArray
{
    if (!_dataArray) {
        _dataArray=@[].mutableCopy;
    }
    return _dataArray;
}
-(void)addDataArray:(NSArray *)datas{
    if (!datas) return;
    if (datas.count>0) {
        [self.dataArray removeAllObjects];
    }
    [self.dataArray addObjectsFromArray:datas];
}
-(id)modelsAtIndexPath:(NSIndexPath *)indexPath{
    return self.dataArray.count >indexPath.row ? self.dataArray[indexPath.row] : nil;
}

#pragma mark UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return !self.dataArray ? 0 : self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
# warning 注意此处的cell如果没在tableview中注册，会崩溃
    id model = [self modelsAtIndexPath:indexPath];
    if (self.cellConfigureBefore) {
        self.cellConfigureBefore(cell, model, indexPath);
    }
    return cell;
}
@end
