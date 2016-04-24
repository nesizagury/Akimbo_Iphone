//
//  SavedEvent.m
//  Fundigo_20_3_16_v1
//
//  Created by user116889 on 4/11/16.
//  Copyright © 2016 user116889. All rights reserved.
//

#import "SavedEvent.h"
@interface SavedEvent()

@end

@implementation SavedEvent

@synthesize data;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib
    self.data=[[NSArray alloc] init];
    [self readFromPref];
    NSLog(@"after pref");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)readFromPref
{
    NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
    NSArray* temp=[ViewController all_data_event];
    int tempSize=[temp count];
    for(int i = 0 ; i < tempSize ; i++)
    {
        PFObject* cur=temp[i];
        NSString *currentLevelKey = cur.objectId;
        if([preferences objectForKey:currentLevelKey] != nil)
        {
            NSLog(@"inside");
            self.data=[self.data arrayByAddingObject:cur];
        }
    }
    NSLog(@"sizeOfData = %d",[self.data count]);
}

-(IBAction)RealTimePage:(id)sender
{
    [self performSegueWithIdentifier:@"RealTimePageFromSavedEvent" sender:self];
}
-(IBAction)EventPage:(id)sender
{
    [self performSegueWithIdentifier:@"ViewControllerFromSavedEvent" sender:self];
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
    cell.detailTextLabel.text = event[@"place"];
    PFFile *imageFile = event[@"ImageFile"];
    NSData* imgeData=[imageFile getData];
    UIImage* myImage = [UIImage imageWithData:imgeData];
    cell.imageView.image =myImage;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"EventPageFromSavedEvent" sender: self];
   
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier]isEqualToString:@"EventPageFromSavedEvent"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        EventPage *event=segue.destinationViewController;
        event.parseObject =self.data[indexPath.row];
    }
}


@end
