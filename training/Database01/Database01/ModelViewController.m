//
//  ModelViewController.m
//  Database01
//
//  Created by NishiokaKohei on 2016/05/15.
//  Copyright © 2016年 Kohei. All rights reserved.
//

#import "ModelViewController.h"
#import "FMDB.h"

@interface ModelViewController ()

//@property (nonatomic, weak) NSArray *paths;
//@property (nonatomic,weak) NSString *dbPathStr;
@property (nonatomic,weak) FMDatabase *db;



@end

@implementation ModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Database.h

- (void) connectDatabase {
    
    NSArray *paths =  NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dir = [paths objectAtIndex:0];
  
    _db = [FMDatabase databaseWithPath: [dir stringByAppendingPathComponent:@"tr_todo.db"]];
 
    NSLog(@"%@", _db);
    
}


/**
 To create a new table.
 @param NSArray
 @return Nothing
 */
 
- (void) createTable {

//    _db  = [FMDatabase databaseWithPath:@"tr_todo.db"];
    [self connectDatabase];
    
    NSString*   sql = @"CREATE TABLE IF NOT EXISTStr_todo (tr_id INTEGER PRIMARY KEY AUTOINCREMENT, todo_title TEXT, todo_contents TEXT, created (DEFAULT DATETIME( 'now' , 'localtime' )), modified (DEFAULT DATETIME( 'now' , 'localtime' )), limit_data TEXT);";

    [_db open];
    [_db executeUpdate:sql];
    [_db close];

}


/**
To insert datas.
@param setData
*/
- (void) insertTable:(NSString*)setTitle num2:(NSString*) setContents  num3:(NSString*)createDate {
    
    [self connectDatabase];
    
    NSString *sql = [[NSString alloc] initWithFormat:@"INSERT INTO tr_todo ( titile_todo , contents_todo , limit_data ) VALUES( ' %@ ' , ' %@ ' , ' %@ ' ); ", setTitle , setContents , createDate ];
    
    [_db open];
    [_db executeUpdate: sql];
    [_db close];
}


/**
 To select datas and retuen it.
 @param selectData
 @return selectTable
 */
//- (NSArray*) selectTable:(NSString*) selectData {
//    //FMDatabase *db  = [FMDatabase databaseWithPath:@"tr_todo.db"];
//    
//   // NSString *sql = [_dbPathStr stringByAppendingFormat:@"SELECT   %@ FROM tr_todo", selectData ];
//    //NSString *sql = @"SELECT id, name FROM tablename;";
//    
//    [_db open];
//    
//    //FMResultSet *results = [_db executeQuery:sql];
//    
//    while ([results next]) {
//        NSLog(@"%d %@", [results intForColumn:@"id"], [results stringForColumn:@"name"]);
//    }
//    
//    [_db close];
//
//    return results;
//    
//}



/**
To delete a table
@param deleteData
@return
 */
//- (void) deleteTable:(NSArray*) delateData {
//    //FMDatabase *db = [FMDatabase databaseWithPath:@"tr_todo.db"];
//    NSString *sql = @"DELETE FROM tablename WHERE id = ?";
//    
//    [_db open];
//  //  [db executeUpdate:sql, [NSNumber numberWithInteger:n]];
//    [_db close];
//    
//}



@end
