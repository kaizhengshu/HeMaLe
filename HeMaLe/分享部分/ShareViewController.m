//
//  ShareViewController.m
//  HaMaLe
//
//  Created by Air on 16/1/6.
//  Copyright © 2016年 Air. All rights reserved.
//

#import "ShareViewController.h"
#import "ShareTableViewCell.h"
#import "ShareModel.h"
@interface ShareViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) UITableView *shareTableView;
@property(nonatomic,strong) NSMutableArray *data;

@end

@implementation ShareViewController



-(NSMutableArray *)data
{
    if(_data == nil)
    {
        
        _data = [[NSMutableArray alloc]init];
        for (NSInteger i = 0; i < 10; i++) {
            ShareModel *share = [[ShareModel alloc] init];
            
           
            
            
            [_data addObject:share];
        }
    }
    return _data;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"分享";
    
    
    self.shareTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.shareTableView.delegate = self;
    self.shareTableView.dataSource = self;
    
    
    [self.shareTableView  registerNib:[UINib nibWithNibName:@"ShareTableViewCell" bundle:nil] forCellReuseIdentifier:@"ShareTableViewCell"];
    
    [self.view addSubview:self.shareTableView];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ShareTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"ShareTableViewCell"];

 
    return cell;
}

-(void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [self.shareTableView setEditing:editing animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 250.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
