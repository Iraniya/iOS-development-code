//
//  ViewController.m
//  XMLParsing
//
//  Created by agile on 20/10/16.
//  Copyright © 2016 iraniya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self StartParser];
}

#pragma mark - Table View methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return breakfastMenuArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(tableViewCell ==nil){
        tableViewCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    return tableViewCell;
}
#pragma mark - XML Parsing Methods
-(void)StartParser
{
    NSString *filePath=[[NSBundle mainBundle] pathForResource:@"simple" ofType:@"xml"];
    xmlParserObject=[[NSXMLParser alloc]initWithContentsOfURL:[NSURL fileURLWithPath:filePath]];
    xmlParserObject.delegate =self;
    //NSLog(@"%d",[objParser parse]);
    BOOL isParse = [xmlParserObject parse];
    
    NSLog(@"isParse : %df",isParse);
}

- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    NSLog(@"parserDidStartDocument");
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    NSLog(@"didStartElement");
    tempStr=elementName;
    if ([tempStr isEqualToString:FOOD])
    {
        if (!foodDictionary)
        {
            foodDictionary =[[NSMutableDictionary alloc] init];
        }
        return;
        
    }
    
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if ([string rangeOfString:@"\n"].location == NSNotFound) {
        if ([tempStr isEqualToString:ITEM_PRICE]) {
            [foodDictionary setObject:string forKey:ITEM_PRICE];
        }else if ([tempStr isEqualToString:ITEM_NAME]){
            [foodDictionary setObject:string forKey:ITEM_NAME];
        }else if ([tempStr isEqualToString:ITEM_DESCRIPTION]){
            [foodDictionary setObject:string forKey:ITEM_DESCRIPTION];
        }else if ([tempStr isEqualToString:ITEM_CALORIES]){
            [foodDictionary setObject:string forKey:ITEM_CALORIES];
        }
    }
}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
    NSLog(@"didEndElement");
    
    if ([elementName isEqualToString:ITEM_NAME])
    {
        tempStr=elementName;
    }
    else if ([elementName isEqualToString:ITEM_PRICE])
    {
        tempStr=elementName;
    }
    else if ([elementName isEqualToString:ITEM_CALORIES])
    {
        tempStr=elementName;
    }
    else if ([elementName isEqualToString:ITEM_DESCRIPTION])
    {
        tempStr=elementName;
    }
    
    if ([elementName isEqualToString:FOOD])
    {
        if (!breakfastMenuArray)
        {
            breakfastMenuArray=[NSMutableArray new];
        }
        [breakfastMenuArray addObject:[foodDictionary copy]];
        [foodDictionary removeAllObjects];
    }
    
    
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    NSLog(@"parserDidEndDocument");
    
    NSLog(@"%@",breakfastMenuArray);
    //[table reloadData];
    
}
@end
