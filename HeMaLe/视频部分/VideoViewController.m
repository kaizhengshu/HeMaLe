//
//  VideoViewController.m
//  HaMaLe
//
//  Created by Air on 16/1/6.
//  Copyright © 2016年 Air. All rights reserved.
//

#import "VideoViewController.h"
#import "VideoModel.h"
#import "VideoTableViewCell.h"

@interface VideoViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView *videoTableView;
@property(nonatomic,strong) NSMutableArray *data;

@end

@implementation VideoViewController


-(NSMutableArray *)data
{
    if(_data == nil)
    {
        
        _data = [[NSMutableArray alloc]init];
        for (NSInteger i = 0; i < 10; i++) {
            VideoModel *video = [[VideoModel alloc] init];
            
            
            
            
            [_data addObject:video];
        }
    }
    return _data;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"视频";


    self.videoTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.videoTableView.delegate = self;
    self.videoTableView.dataSource = self;
    
    
    [self.videoTableView  registerNib:[UINib nibWithNibName:@"VideoTableViewCell" bundle:nil] forCellReuseIdentifier:@"VideoTableViewCell"];
    
    [self.view addSubview:self.videoTableView];



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
    
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    VideoTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"VideoTableViewCell"];
    
    
    return cell;

}


-(void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [self.videoTableView setEditing:editing animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150.0f;
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
