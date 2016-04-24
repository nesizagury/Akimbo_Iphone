//
//  ViewController.m
//  Fundigo_20_3_16_v1
//
//  Created by user116889 on 3/29/16.
//  Copyright © 2016 user116889. All rights reserved.
//

#import "ViewController.h"
//#import "EventPage.h"
@interface ViewController ()

@end
@implementation ViewController
static NSArray* _all_data_event=nil;

@synthesize data;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self queryForTable];
    _all_data_event =[NSArray arrayWithArray:self.data];
    
}

//+(void)load {
//    _all_data_event = [[NSArray alloc] init];
//}
+(NSArray*)all_data_event {
    return _all_data_event;
}

-(void)queryForTable{
    if(self.data==nil){
        self.data =[[NSArray alloc] init];
    }
   PFQuery *query = [PFQuery queryWithClassName:@"Event"];
    self.data=[query findObjects];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.data count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* simple =@"simple";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:simple ]; //forIndexPath:indexPath];
    if(cell==nil){
        cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:simple];
    }
    PFObject* event = self.data[indexPath.row];
    cell.textLabel.text = event[@"Name"];
   // NSDate* date =event[@"realDate"];
    //NSString* dateToString =event[@"realDate"];
    cell.detailTextLabel.text = event[@"place"];
    PFFile *imageFile = event[@"ImageFile"];
    NSData* imgeData=[imageFile getData];
    UIImage* myImage = [UIImage imageWithData:imgeData];
    cell.imageView.image =myImage;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EventPage* evp=[[EventPage alloc] init];
    PFObject* object= self.data[indexPath.row];
    evp.name.text = object[@"Name"];
    [self performSegueWithIdentifier:@"EventPage" sender: self];
    //[evp show];
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier]isEqualToString:@"EventPage"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        EventPage *y=segue.destinationViewController;
        y.parseObject =self.data[indexPath.row];
    }
}
-(IBAction)SavedEventPage:(id)sender
{
    [self performSegueWithIdentifier:@"SavedEventPageFromViewController" sender:self];
}

-(IBAction)menuPage:(id)sender
{
    
    [self performSegueWithIdentifier:@"menuPageFromViewController" sender:self];
}

-(IBAction)realTimePage:(id)sender
{
    [self performSegueWithIdentifier:@"RealTimePageFromViewController" sender:self];
}
@end
