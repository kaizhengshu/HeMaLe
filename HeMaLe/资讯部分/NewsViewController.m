//
//  NewsViewController.m
//  HaMaLe
//
//  Created by Air on 16/1/6.
//  Copyright © 2016年 Air. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsModel.h"
#import "NewsCell.h"
@interface NewsViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSInteger _currentPage;
    
}
@property(nonatomic,strong) UIScrollView *advertScroll;
@property(nonatomic,strong) UITableView *newsTableView;
@property(nonatomic,strong) NSMutableArray *data;


@end

@implementation NewsViewController

//懒加载   get

-(NSMutableArray *)data
{
    if(_data == nil)
    {
        
        _data = [[NSMutableArray alloc]init];
        for (NSInteger i = 0; i < 10; i++) {
            NewsModel *new = [[NewsModel alloc] init];
           
            new.newsTitleModel   = [NSString stringWithFormat:@"titel%ld",i];
            new.newsContentModel = [NSString stringWithFormat:@"qwerqwerqwerqwerqwerwqerqwerwerqwerqwerqwerqwerqwerwqerqwerqewrqwer"];
            new.newsDateModel    = [NSString stringWithFormat:@"2016-01-10"];
            
            
            [_data addObject:new];
        }
    }
    return _data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"资讯";
    
    
    //广告scroll视图
    
    self.advertScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
   
    
    for (NSInteger i = 0; i < 4; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * kScreenWidth, 0, kScreenWidth, 200)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i+1]];
        [self.advertScroll addSubview:imageView];
    }
   
    
    self.advertScroll.contentSize = CGSizeMake(kScreenWidth * 4, 0);
    self.advertScroll.pagingEnabled = YES;
    
    // 隐藏水平滚动条
    self.advertScroll.showsHorizontalScrollIndicator = NO;
    self.advertScroll.showsVerticalScrollIndicator = NO;
    
//    [self.view addSubview:self.advertScroll];
    
//    [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(timer:) userInfo:self.advertScroll repeats:YES];
    
    
    
      //tableview视图
                        
    self.newsTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.newsTableView.delegate = self;
    self.newsTableView.dataSource = self;
    self.newsTableView.tableHeaderView = self.advertScroll;
    
      [self.newsTableView  registerNib:[UINib nibWithNibName:@"NewsCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    [self.view addSubview:self.newsTableView];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//定时器

-(void)timer:(NSTimer *)t
{
    UIScrollView *scrollView = t.userInfo;
    [scrollView setContentOffset:CGPointMake(4 * _currentPage++, 0) animated:NO] ;
    
    if(_currentPage == 4*32*2)
    {
        _currentPage = 0;
    }
}

//tableview设置
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    
    
    NewsCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    NewsModel *new = self.data[indexPath.row];
    
    [cell refreshData:new];
    return cell;
    
}


-(void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [self.newsTableView setEditing:editing animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0f;
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
