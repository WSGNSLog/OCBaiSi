//
//  RecommendController.m
//  BaiSi
//
//  Created by user on 2019/2/18.
//  Copyright © 2019 Wu. All rights reserved.
//

#import "RecommendController.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import <SVProgressHUD.h>
#import <MJRefresh.h>
#import "RecommendCategory.h"
#import "RecommendUser.h"
#import "RecommendUserCell.h"
#import "RecommendCategoryCell.h"

#define SelectedCategory self.categories[self.categoryTableView.indexPathForSelectedRow.row]
@interface RecommendController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *categories;
@property (weak, nonatomic) IBOutlet UITableView *categoryTableView;
@property (weak, nonatomic) IBOutlet UITableView *userTableView;

@property (nonatomic, strong) NSDictionary *params;
@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

static NSString *const CategoryId = @"category";
static NSString *const UserId = @"user";

@implementation RecommendController
- (AFHTTPSessionManager *)manager{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    [self setupRefresh];
    
    [self loadCategories];
//    if (@available(iOS 11, *)) {
//        self.categoryTableView.estimatedRowHeight = 0;
//        self.categoryTableView.estimatedSectionHeaderHeight = 0;
//        self.categoryTableView.estimatedSectionFooterHeight = 0;
//    }
    
}
- (void)setupTableView{
    [self.categoryTableView registerNib:[UINib nibWithNibName:NSStringFromClass([RecommendCategoryCell class]) bundle:nil] forCellReuseIdentifier:CategoryId];
    [self.userTableView registerNib:[UINib nibWithNibName:NSStringFromClass([RecommendUserCell class]) bundle:nil] forCellReuseIdentifier:UserId];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.categoryTableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.userTableView.contentInset = self.categoryTableView.contentInset;
    self.userTableView.rowHeight =70;
    
    self.title = @"推荐关注";
    
    self.view.backgroundColor = MyGlobalBg;
}
- (void)setupRefresh{
    self.userTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewUsers)];
    self.userTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreUsers)];
    
}
- (void)loadCategories{
    
    [SVProgressHUD show];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"category";
    params[@"c"] = @"subscribe";
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        self.categories = [RecommendCategory mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        [self.categoryTableView reloadData];
        
        [self.categoryTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
        [self.userTableView.mj_header beginRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"加载推荐信息失败"];
    }];
}
#pragma mark - 加载用户数据
- (void)loadNewUsers{
    RecommendCategory *rc = SelectedCategory;
    rc.currentPage = 1;
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"subscribe";
    params[@"category_id"] = @(rc.ID);
    params[@"page"] = @(rc.currentPage);
    self.params = params;
    
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *users = [RecommendUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"] context:nil];
        [rc.users removeAllObjects];
        [rc.users addObjectsFromArray:users];
        
        rc.total = [responseObject[@"total"] integerValue];
        
        if (self.params != params) return;
        
        [self.userTableView reloadData];
        [self.userTableView.mj_header endRefreshing];
        
        [self checkFooterState];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         if (self.params != params) return;
        
        [SVProgressHUD showErrorWithStatus:@"加载用户数据失败"];
        
        // 结束刷新
        [self.userTableView.mj_header endRefreshing];
    }];
}

- (void)loadMoreUsers{
    RecommendCategory *category = SelectedCategory;
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"subscribe";
    params[@"category_id"] = @(category.ID);
    params[@"page"] = @(++category.currentPage);
    self.params = params;
    
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *users = [RecommendUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [category.users addObjectsFromArray:users];
        
        if (self.params != params) return;
        
        [self.userTableView reloadData];
        
        [self checkFooterState];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.params != params) return;
  
        [SVProgressHUD showErrorWithStatus:@"加载用户数据失败"];
        
        [self.userTableView.mj_footer endRefreshing];
    }];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.categoryTableView)  return self.categories.count;
    
    [self checkFooterState];
    return [SelectedCategory users].count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.categoryTableView) {
        RecommendCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:CategoryId];
        cell.category = self.categories[indexPath.row];
        return cell;
    }else{
        RecommendUserCell *cell = [tableView dequeueReusableCellWithIdentifier:UserId];
        cell.user = [SelectedCategory users][indexPath.row];
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.userTableView.mj_header endRefreshing];
    [self.userTableView.mj_footer endRefreshing];
    
    RecommendCategory *c = self.categories[indexPath.row];
    if (c.users.count){
        [self.userTableView reloadData];
    }else {
        [self.userTableView reloadData];
        
        [self.userTableView.mj_header beginRefreshing];
    }
}
- (void)checkFooterState{
    RecommendCategory *rc = SelectedCategory;
    
    self.userTableView.mj_footer.hidden = (rc.users.count == 0);
    
    if (rc.users.count == rc.total) {
        [self.userTableView.mj_footer endRefreshingWithNoMoreData];
    }else{
        [self.userTableView.mj_footer endRefreshing];
    }
}
- (void)dealloc{
    [self.manager.operationQueue cancelAllOperations];
}
@end
