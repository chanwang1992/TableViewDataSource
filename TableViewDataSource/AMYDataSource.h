//
//  AMYDataSource.h
//  TableViewDataSource
//
//  Created by 红点汽车 on 2018/4/12.
//  Copyright © 2018年 amy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^CellConfigureBefore)(id cell, id model,NSIndexPath *indexPath);

@interface AMYDataSource : NSObject <UITableViewDataSource>

@property (nonatomic ,strong) NSMutableArray *dataArray;

//自定义
-(id)initWithIdentifier:(NSString *)identifier configureBlock:(CellConfigureBefore)before;

//sb
@property (nonatomic ,strong)IBInspectable NSString *cellIdentifier;
@property (nonatomic, copy) CellConfigureBefore cellConfigureBefore;

-(void)addDataArray:(NSArray *)datas;
-(id)modelsAtIndexPath:(NSIndexPath *)indexPath;

@end
