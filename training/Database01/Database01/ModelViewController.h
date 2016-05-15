//
//  ModelViewController.h
//  Database01
//
//  Created by NishiokaKohei on 2016/05/15.
//  Copyright © 2016年 Kohei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModelViewController : UIViewController

- (void) createTable:(NSString *) newTitle:(NSString*) newContents:(NSString*) limitDate;
- (void) insertTable:(NSArray*) setData;
- (NSString*) selectTable:(NSString*) selectData;
- (void) deleteTable:(NSArray*) delateData;

   
@end
