//
//  ModelViewController.h
//  Database01
//
//  Created by NishiokaKohei on 2016/05/15.
//  Copyright © 2016年 Kohei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModelViewController : UIViewController

- (void) createTable;
- (void) insertTable:(NSString*)setTitle num2:(NSString*) setContents  num3:(NSString*)createDate ;
//- (NSString*) selectTable:(NSString*) selectData;
//- (void) deleteTable:(NSArray*) delateData;

   
@end
