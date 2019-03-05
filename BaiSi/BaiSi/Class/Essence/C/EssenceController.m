//
//  EssenceController.m
//  BaiSi
//
//  Created by user on 2019/2/18.
//  Copyright © 2019 Wu. All rights reserved.
//

#import "EssenceController.h"
#import "RecommendTagsController.h"
#import "TopicController.h"

@interface EssenceController ()<UIScrollViewDelegate>

@property (nonatomic,weak) UIView *indicatorView;
@property (nonatomic,weak) UIButton *selectedBtn;
@property (nonatomic,weak) UIView *titlesView;
@property (nonatomic,weak) UIScrollView *contentView;

@end

@implementation EssenceController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setupNav];
    
    // 初始化子控制器
    [self setupChildVcs];
    
    // 设置顶部的标签栏
    [self setupTitlesView];
    
    // 底部的scrollView
    [self setupContentView];
}
- (void)setupNav{
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(tagClick)];
    
    self.view.backgroundColor = MyGlobalBg;
}
- (void)setupChildVcs{
    TopicController *all = [[TopicController alloc] init];
    all.title = @"全部";
    all.type = BSTopicTypeAll;
    [self addChildViewController:all];
    
    TopicController *video = [[TopicController alloc] init];
    video.title = @"视频";
    video.type = BSTopicTypeVideo;
    [self addChildViewController:video];
    
    TopicController *voice = [[TopicController alloc] init];
    voice.title = @"声音";
    voice.type = BSTopicTypeVoice;
    [self addChildViewController:voice];
    
    TopicController *picture = [[TopicController alloc] init];
    picture.title = @"图片";
    picture.type = BSTopicTypePicture;
    [self addChildViewController:picture];
    
    TopicController *word = [[TopicController alloc] init];
    word.title = @"段子";
    word.type = BSTopicTypeWord;
    [self addChildViewController:word];
}

- (void)setupTitlesView{
    
    UIView *titlesView = [[UIView alloc]init];
    titlesView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
    titlesView.width = self.view.width;
    titlesView.height = BSTitilesViewH;
    titlesView.y = TopHeight;
    [self.view addSubview:titlesView];
    self.titlesView = titlesView;
    
    UIView *indicatorView = [[UIView alloc]init];
    indicatorView.backgroundColor = [UIColor redColor];
    indicatorView.height = 2;
    indicatorView.tag = -1;
    indicatorView.y = titlesView.height - indicatorView.height;
    self.indicatorView = indicatorView;
    
    CGFloat width = titlesView.width/self.childViewControllers.count;
    CGFloat height = titlesView.height;
    for (NSInteger i=0; i<self.childViewControllers.count; i++) {
        UIButton *btn = [[UIButton alloc]init];
        btn.tag = i;
        btn.height = height;
        btn.width = width;
        btn.x = i * width;
        UIViewController *vc = self.childViewControllers[i];
        [btn setTitle:vc.title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titlesView addSubview:btn];
        
        if (i == 0) {
            btn.enabled = NO;
            self.selectedBtn = btn;
            
            //让按钮内部的label根据文字内容来计算尺寸
            [btn.titleLabel sizeToFit];
            self.indicatorView.width = btn.titleLabel.width;
            self.indicatorView.centerX = btn.centerX;
            
        }
    }
    [titlesView addSubview:indicatorView];
    
}

- (void)setupContentView{
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *contentView = [[UIScrollView alloc]init];
    contentView.frame = self.view.bounds;
    contentView.delegate = self;
    contentView.pagingEnabled = YES;
    [self.view insertSubview:contentView atIndex:0];
    contentView.contentSize = CGSizeMake(contentView.width*self.childViewControllers.count, 0);
    self.contentView = contentView;
    
    // 添加第一个控制器的view
    [self scrollViewDidEndScrollingAnimation:contentView];
    
}
- (void)titleClick:(UIButton *)button{
    self.selectedBtn.enabled = YES;
    button.enabled = NO;
    self.selectedBtn = button;
    
    [UIView animateWithDuration:0.25 animations:^{
        self.indicatorView.width = button.titleLabel.width;
        self.indicatorView.centerX = button.centerX;
    }];
    
    CGPoint offset = self.contentView.contentOffset;
    offset.x = button.tag * self.contentView.width;
    [self.contentView setContentOffset:offset animated:YES];
    
}
- (void)tagClick
{
    RecommendTagsController *vc = [[RecommendTagsController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    
    UIViewController *vc = self.childViewControllers[index];
    vc.view.x = scrollView.contentOffset.x;
    vc.view.y = 0;
    vc.view.height = scrollView.height;
    [scrollView addSubview:vc.view];
}

@end
