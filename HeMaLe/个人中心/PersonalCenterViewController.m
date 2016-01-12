//
//  PersonalCenterViewController.m
//  HaMaLe
//
//  Created by Air on 16/1/6.
//  Copyright © 2016年 Air. All rights reserved.
//

#import "PersonalCenterViewController.h"
#import "CLBlurtView.h"
@interface PersonalCenterViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_firstArray;
    NSMutableArray *_secondArray;
}
@property (nonatomic,strong) UITableView *perCenterTableView;
@property (nonatomic,strong) NSMutableArray *data;
@property (nonatomic,strong) UIControl *headSelect;

@end

@implementation PersonalCenterViewController


//懒加载   get

-(NSMutableArray *)data
{
    if(_data == nil)
    {
        _data = [[NSMutableArray alloc] init];
       
        
        
        _firstArray  = [[NSMutableArray alloc]initWithObjects:@"通讯录",@"我的消息",@"我的分享",@"我的马匹", nil];
        _secondArray = [[NSMutableArray alloc]initWithObjects:@"邀请好友",@"问题反馈", nil];
        


        [_data addObject:_firstArray];
        [_data addObject:_secondArray];
        
    }
    return _data;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    //虚拟数据
    NSString * name = @"郑凯";
    NSString * headIconUrl = @"http://121.40.157.202:8888/uploadFile/horseFriendImage/1448680103464295139.jpg";
    
    self.headSelect = [[UIControl alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
    self.headSelect.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.headSelect];
    
    
    
    self.perCenterTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width, self.view.bounds.size.height - 200) style:UITableViewStyleGrouped];
    
    self.perCenterTableView.delegate = self;
    self.perCenterTableView.dataSource = self;

    
    [self.view addSubview:self.perCenterTableView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//tableView设置
//tabView中section的个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.data.count;
}

//每一个section中有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 0  1
    return [self.data[section] count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.data[indexPath.section][indexPath.row];
    
    return cell;
    
}


@end
