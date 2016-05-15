//
//  ModelViewController.m
//  Database01
//
//  Created by NishiokaKohei on 2016/05/15.
//  Copyright © 2016年 Kohei. All rights reserved.
//

#import "ModelViewController.h"

@interface ModelViewController ()

@property (nonatomic, weak) NSArray *path;
@property (nonatomic,weak) NSString *dbPathStr;
@property (nonatomic,weak) FMDatabase *db;

- (void) createTable:(NSArray*) newTable;
- (void) insertTable:(NSArray*) setData;
- (NSString*) selectTable:(NSArray*) selectData;
- (void) deleteTable:(NSArray*) delateData;

@end

@implementation ModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // To prepare a database.
    _path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    _dbPathStr = [_path objectAtIndex:0];
    _db = [FMDatabase databaseWithPath:[_dbPathStr stringByAppendingPathComponent:@"database.db"]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - To tanke control of Database

/**
 To create a new table.
 @param NSArray
 @return Nothing
 */
 
- (void) createTable:(NSArray *) newTable {
    FMDatabase* db  = [FMDatabase databaseWithPath:@"/FMDB"];
    NSString*   sql = @"CREATE TABLE IF NOT EXISTS tr_todo (tr_id INTEGER PRIMARY KEY AUTOINCREMENT, todo_title TEXT, todo_contents TEXT, created TEXT, modified TEXT, limit_data TEXT);";

    [db open];
    [db executeUpdate:sql];
    [db close];

}


/**
To insert datas.
@param setData
*/
- (void) insertTable:(NSArray*) setData {
    FMDatabase *db = [FMDatabase databaseWithPath:@"データベースのパス"];
    NSString *sql = @"INSERT INTO tablename (name) VALUES (?)";
    
    [db open];
    [db executeUpdate:sql, @"入れるデータ"];
    [db close];
}


/**
 To select datas and retuen it.
 @param selectData
 @return selectTable
 */
- (NSArray*) selectTable:(NSArray*) selectData {
    FMDatabase *db  = [FMDatabase databaseWithPath:@"データベースのパス"];
    NSString *sql = @"SELECT id, name FROM tablename;";
    
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
    FMDatabase *db = [FMDatabase databaseWithPath:@"データベースのパス"];
    NSString *sql = @"DELETE FROM tablename WHERE id = ?";
    
    [db open];
    [db executeUpdate:sql, [NSNumber numberWithInteger:n]];
    [db close];
    
}



@end
