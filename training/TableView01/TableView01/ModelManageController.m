//
//  ModelManageController.m
//  TableView01
//
//  Created by NishiokaKohei on 2016/05/18.
//  Copyright © 2016年 Kohei. All rights reserved.
//

#import "ModelManageController.h"
#import "Model.h"
#import "FMDB.h"

@interface ModelManageController ()

@end

@implementation ModelManageController






#pragma mark - Sqlite controller methods

- (void) connectToFMDB {
    FMDatabase *db = [[FMDatabase alloc] init];
    
}









#pragma mark - default methods

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
