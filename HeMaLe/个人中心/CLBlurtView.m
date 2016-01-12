//
//  CLBlurtView.m
//  CLBlurtView
//
//  Created by Charles on 15/12/23.
//  Copyright © 2015年 Charles. All rights reserved.
//

#import "CLBlurtView.h"
#import "UIImageView+WebCache.h"
#import "UIImageView+LBBlurredImage.h"
#import "UIImageView+WebCache.h"
#import "PersonallCenterCell.h"
#define changeRate  (self.frame.size.width / self.frame.size.height)

@interface CLBlurtView()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>

{
    NSMutableArray *firstArray;
    
    NSMutableArray *secondArray;
    
    NSMutableArray *thirdArray;
}
/**
 *  图片
 */
@property (nonatomic,strong)UIImageView *imageView;
@property (nonatomic,strong)UIImageView *headImage;

@property (nonatomic,strong)UITableView *mTableView;
/**
 *  自定义添加的view
 */
@property (nonatomic,strong)UIView *otherView;
/**
 *  放大比例
 */
@property (nonatomic,assign)CGFloat scale;
/**
 *  名字label
 */
@property (nonatomic,strong)UILabel *label;

@end

@implementation CLBlurtView
{
    NSMutableArray * _dataArr;
}

- (instancetype)initWithFrame:(CGRect)frame WithHeaderImgHeight:(CGFloat)headerImgHeight iconHeight:(CGFloat)iconHeight name:(NSString *)name url:(NSString *)urlStr selectBlock:(SelectRowAction)block;{
    if (self = [super initWithFrame:frame]) {
        self.headerImgHeight = (headerImgHeight == 0  ? self.frame.size.height * 0.382 : headerImgHeight);
        self.iconHeight = (iconHeight == 0  ? self.frame.size.height * 0.382  : iconHeight);
        //姓名个头像
        _name = name;
        _imgUrl = urlStr;
        //添加子视图
        [self setupContentView];
        selectAction = block;
    }
    
    firstArray = [[NSMutableArray alloc] initWithObjects:@"通讯录", @"我的消息", @"我的分享", @"我的马匹" ,nil];
    
    secondArray = [[NSMutableArray alloc ]initWithObjects:@"邀请好友", nil];
    thirdArray = [[NSMutableArray alloc]initWithObjects:@"问题反馈", nil];

    
    
    return self;
}



    

    


- (void)setupContentView {
        
        NSAssert(self.headerImgHeight >= self.iconHeight && self.iconHeight > 0, @"图片高度应当大于头像高度，头像高度应当大于零");
        
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 60 , kScreenWidth, self.headerImgHeight)];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        self.imageView = _imageView;
        self.scale =  self.imageView.frame.size.width / self.imageView.frame.size.height;
        
        //背景图片
        _imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_imgUrl]]];
        // 20 左右 R  模糊图片
        [_imageView setImageToBlur:_imageView.image blurRadius:21 completionBlock:nil];
        
        //头像
        UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake((self.frame.size.width - self.iconHeight) / 2, (self.headerImgHeight - self.iconHeight) / 2, self.iconHeight, self.iconHeight)];
        
        icon.backgroundColor = [UIColor yellowColor];
        NSLog(@"%@",NSStringFromCGRect(icon.frame));
        
        //头像做圆
        icon.image = [UIImage imageNamed:@"1.jpg"];
        icon.layer.cornerRadius = self.iconHeight * 0.5;
        icon.clipsToBounds = YES;
        self.headImage = icon;
        
        //修改
        [self.headImage sd_setImageWithURL:[NSURL URLWithString:self.imgUrl] placeholderImage:[UIImage imageNamed:@"1.jpg"]];
        
        [_imageView sd_setImageWithURL:[NSURL URLWithString:self.imgUrl] placeholderImage:[UIImage imageNamed:@"1.jpg"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            [_imageView setImageToBlur:_imageView.image blurRadius:21 completionBlock:nil];
        }];
        
        UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(icon.frame) + 10, self.frame.size.width, 20)];
        self.label = name;
        name.text = _name;
        name.textAlignment = NSTextAlignmentCenter;
        name.textColor = [UIColor whiteColor];
        UIView *otherVIew = [[UIView alloc] initWithFrame:CGRectMake(0, self.headerImgHeight, self.frame.size.width,self.imageView.frame.size.height)];
        otherVIew.backgroundColor = [UIColor clearColor];
        self.otherView = otherVIew;
        [self.otherView addSubview:self.headImage];
        [self.otherView addSubview:self.label];
        // 注意添加顺序
        //头部视图
        self.mTableView.tableHeaderView = _imageView;
        [self addSubview:_imageView];
        
        self.mTableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, self.frame.size.width, self.frame.size.height-30) style:UITableViewStyleGrouped];
        NSLog(@"%@",NSStringFromCGRect(self.frame));
        self.mTableView.backgroundColor = [UIColor clearColor];
        //设置代理
        self.mTableView.delegate = self;
        self.mTableView.dataSource = self;
        
        
        self.mTableView.decelerationRate = 2;
        
        [self addSubview:self.mTableView];
         self.mTableView.tableHeaderView = self.otherView;
    }
    



#pragma mark -UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    CGFloat groupedHeight = kScreenHeight-self.headerImgHeight-44*5-44/3;
    return 0.7;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch(section){
        case 0:
            return 4;
            break;
        case 1:
            return 1;
        case 2:
            return 1;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //根据section 定制复用ID
    static NSString * cellID0 = @"cellID0";
    static NSString * cellID1 = @"cellID1";
    static NSString * cellID2 = @"cellID2";
    NSArray * idArr = [NSArray arrayWithObjects:cellID0,cellID1,cellID2, nil];
            PersonallCenterCell * cell = [[PersonallCenterCell alloc] initWithTableView:_mTableView withIdentifier:idArr[indexPath.section]];
    
    
    
    
    
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    cell.cellIIcon.image = [UIImage imageNamed:@"1.jpg"];
                    cell.cellTitle.text = @"通讯录";
                    break;
                    
                case 1:
                    cell.cellIIcon.image = [UIImage imageNamed:@"1.jpg"];
                    cell.cellTitle.text = @"我的消息";
                    break;
                    
                case 2:
                    cell.cellIIcon.image = [UIImage imageNamed:@"1.jpg"];
                    cell.cellTitle.text = @"我的分享";
                    break;
                    
                case 3:
                    cell.cellIIcon.image = [UIImage imageNamed:@"1.jpg"];
                    cell.cellTitle.text = @"我的马匹";
                    break;
                default:
                    break;
            }
            case 1:
            switch (indexPath.row) {
                case 4:
                    cell.cellIIcon.image = [UIImage imageNamed:@"1.jpg"];
                    cell.cellTitle.text = @"邀请好友";
                    break;
                default:
                    break;
            }
            case 2:
            switch (indexPath.row) {
                case 5:
                    cell.cellIIcon.image = [UIImage imageNamed:@"1.jpg"];
                    cell.cellTitle.text = @"问题反馈";
                    break;
                default:
                    break;
            }
            
        default:
            break;
    }

    return cell;
}



//每个section显示的标题

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    switch (section) {
            
        case 0:
            
            return [firstArray objectAtIndex:section];
            
        case 1:
            
            return [secondArray objectAtIndex:section];
            
        case 2:
            return [thirdArray objectAtIndex:section];
            
        default:
            
            return @"Unknown";  
            
    }  
    
    
    
}


#pragma mark - UIScrollViewDelgate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    //获取滑动距离
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if (scrollView.contentOffset.y < 0) {
        // 高度宽度同时拉伸 从中心放大
        CGFloat imgH = self.headerImgHeight - scrollView.contentOffset.y * 2;
        //按比例拉伸
        CGFloat imgW = imgH * self.scale;
        
        self.imageView.frame = CGRectMake(scrollView.contentOffset.y * self.scale,60, imgW,imgH);
        
        CGFloat iconOriginalX = (self.frame.size.width - self.iconHeight) / 2;
        CGFloat iconOriginalY = (self.headerImgHeight - self.iconHeight) / 2;
        
        self.headImage.frame = CGRectMake(iconOriginalX + offsetY * changeRate, iconOriginalY + offsetY * changeRate * 2, self.iconHeight - changeRate * offsetY * 2, self.iconHeight - changeRate * offsetY * 2);
        self.headImage.layer.cornerRadius = self.headImage.frame.size.width * 0.5;
        self.headImage.clipsToBounds = YES;
        
        self.label.frame = CGRectMake(self.label.frame.origin.x, CGRectGetMaxY(self.headImage.frame) + 10, self.label.frame.size.width, self.label.frame.size.height);
        
    } else {
        // 只拉伸高度
        self.imageView.frame = CGRectMake(0, 60, self.imageView.frame.size.width, 200 - scrollView.contentOffset.y);
    }
    
    NSLog(@"%0.0f",scrollView.contentOffset.y);
}



@end
