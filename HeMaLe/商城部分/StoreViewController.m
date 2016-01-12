//
//  StoreViewController.m
//  HaMaLe
//
//  Created by Air on 16/1/6.
//  Copyright © 2016年 Air. All rights reserved.
//

#import "StoreViewController.h"
#import "StoreSectionModel.h"

@interface StoreViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *storeTableView;
@property(nonatomic,strong)NSMutableArray *data;

@end

@implementation StoreViewController



//section 对象    数据   标示
-(NSMutableArray *)data
{
    if(_data == nil)
    {
        _data = [[NSMutableArray alloc] init];
        
        for (NSInteger i = 0; i < 5; i++) {
            StoreSectionModel *sec = [[StoreSectionModel alloc] init];
            NSMutableArray *arr = [[NSMutableArray alloc] init];
            for (NSInteger j = 0; j < 5; j++) {
                NSString *str = [NSString stringWithFormat:@"%d row,%ld col",i,(long)j];
                
                [arr addObject:str];
            }
            
            NSLog(@"%@",arr);
            
            sec.sectionData = arr;
            sec.isExpand = NO;
            [_data addObject:sec];
        }
    }
    
    return _data;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"商城";
    
    self.storeTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.storeTableView.delegate   = self;
    self.storeTableView.dataSource = self;
    self.storeTableView.separatorColor = [UIColor blackColor];
//    self.storeTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:self.storeTableView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 150.0f;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.data.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    
    StoreSectionModel *sec = self.data[section];
        if(!sec.isExpand)
    {
        return 0;
    }
    
    return sec.sectionData.count;
}


// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    StoreSectionModel *storeSec = self.data[indexPath.section];
    cell.textLabel.text = storeSec.sectionData[indexPath.row];
    return cell;
}

//自定义 section header
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIControl *view = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    
    view.tag = 100 + section;
    
    if(section % 2 == 0)
    {
        view.backgroundColor = [UIColor redColor];
    }
    else
    {
        view.backgroundColor = [UIColor orangeColor];
    }
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(320 - 40, 0, 40, 40)];
    
    StoreSectionModel *sec = self.data[section];
    if(!sec.isExpand)
    {
        label.text = @">";
    }
    else
    {
        label.text = @"v";
    }
    
    
    [view addSubview:label];
    
    [view addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    return view;
}

-(void)click:(UIControl *)control
{
    StoreSectionModel *sec = self.data[control.tag - 100];
    
    sec.isExpand = !sec.isExpand;
    //刷新tabView
    NSIndexSet *set = [NSIndexSet indexSetWithIndex:control.tag-100];
    
    [self.storeTableView reloadSections:set withRowAnimation:UITableViewRowAnimationAutomatic];

    //[self.storeTableView reloadData];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
