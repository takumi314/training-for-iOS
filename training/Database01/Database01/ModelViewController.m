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

@property (nonatomic, weak) NSArray *path;
@property (nonatomic,weak) NSString *dbPathStr;
@property (nonatomic,weak) FMDatabase *db;

- (void) createTable:(NSArray*) newTable;
- (void) insertTable:(NSArray*) setData;
- (NSString*) selectTable:(NSString*) selectData;
- (void) deleteTable:(NSArray*) delateData;

@end

@implementation ModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    _dbPathStr = [_path objectAtIndex:0];
//        NSLog(@"%@",_dbPathStr);
    _db = [FMDatabase databaseWithPath:[_dbPathStr stringByAppendingPathComponent:@"tr_todo.db"]];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Database.h


/**
 To create a new table.
 @param NSArray
 @return Nothing
 */
 
- (void) createTable:(NSArray *) newTable {

    _db  = [FMDatabase databaseWithPath:@"tr_todo.db"];

    NSString*   sql = @"CREATE TABLE IF NOT EXISTStr_todo (tr_id INTEGER PRIMARY KEY AUTOINCREMENT, todo_title TEXT, todo_contents TEXT, created TEXT, modified TEXT, limit_data TEXT);";

    [_db open];
    [_db executeUpdate:sql];
    [_db close];

}


/**
To insert datas.
@param setData
*/
- (void) insertTable:(NSArray*) setData {
    
    _db = [FMDatabase databaseWithPath:@"tr_todo.db"];
    NSString *sql = @"INSERT INTO tablename (name) VALUES (?)";
    
    [_db open];
    [_db executeUpdate:sql, @"入れるデータ"];
    [_db close];
}


/**
 To select datas and retuen it.
 @param selectData
 @return selectTable
 */
- (NSArray*) selectTable:(NSString*) selectData {
    FMDatabase *db  = [FMDatabase databaseWithPath:@"tr_todo.db"];
    NSString *sql = [_dbPathStr stringByAppendingFormat:@"SELECT   %@ FROM tr_todo", selectData ];
    //NSString *sql = @"SELECT id, name FROM tablename;";
    
    [db open];
    
    FMResultSet *results = [db executeQuery:sql];
    
    while ([results next]) {
        NSLog(@"%d %@", [results intForColumn:@"id"], [results stringForColumn:@"name"]);
    }
    
    [db close];

    return results;
    
}



/**
To delete a table
@param deleteData
@return
 */
- (void) deleteTable:(NSArray*) delateData {
    FMDatabase *db = [FMDatabase databaseWithPath:@"tr_todo.db"];
    NSString *sql = @"DELETE FROM tablename WHERE id = ?";
    
    [db open];
  //  [db executeUpdate:sql, [NSNumber numberWithInteger:n]];
    [db close];
    
}



@end
