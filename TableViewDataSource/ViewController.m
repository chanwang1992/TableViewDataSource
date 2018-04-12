//
//  ViewController.m
//  TableViewDataSource
//
//  Created by amy on 2018/4/12.
//  Copyright © 2018年 amy. All rights reserved.
//

#import "ViewController.h"

#import "AMYDataSource.h"

@interface ViewController ()<UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic ,strong)AMYDataSource *dataSource;

@end

@implementation ViewController
static NSString *cellIden = @"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.dataSource=[[AMYDataSource alloc]initWithIdentifier:cellIden configureBlock:^(id cell, id model, NSIndexPath *indexPath) {
        UITableViewCell *cell1=cell;
        cell1.backgroundColor=[UIColor colorWithRed:(arc4random()%255+1)/255.0 green:(arc4random()%255+1)/255.0 blue:(arc4random()%255+1)/255.0 alpha:1];
        
        cell1.textLabel.text=model;
    }];
     [self.dataSource addDataArray:@[@"池塘边的一只猫",@"池塘边的一只🐱",@"池塘边的一只🎩"]];
    
    self.tableView.dataSource=self.dataSource;
    self.tableView.delegate=self;

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIden];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
