//
//  ViewController.h
//  XMLParsing
//
//  Created by agile on 20/10/16.
//  Copyright © 2016 iraniya. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ITEM_NAME @"name"
#define FOOD @"food"
#define ITEM_PRICE @"price"
#define ITEM_DESCRIPTION @"description"
#define ITEM_CALORIES @"calories"


@interface ViewController : UIViewController<NSXMLParserDelegate,UITableViewDelegate,UITableViewDataSource>
{
     NSString *tempStr;
    NSXMLParser *xmlParserObject;
    
    NSMutableArray *breakfastMenuArray;
    
    NSMutableDictionary *foodDictionary;
    
}

@property(nonatomic,retain) IBOutlet UITableView *tableViewObject;
@end

