//
//  RealTime.m
//  Fundigo_20_3_16_v1
//
//  Created by user116889 on 4/11/16.
//  Copyright © 2016 user116889. All rights reserved.
//

#import "RealTime.h"
@interface RealTime()

@end
@implementation RealTime

@synthesize gridView,data;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib
  // self.data =[ViewController all_data_event];
     self.demoLocation =[[CLLocation alloc] initWithLatitude:35.3232 longitude:32.4234] ;
    [self findGPS];
   
    NSArray *sortedArray= [ViewController all_data_event];
     self.data= [sortedArray sortedArrayUsingComparator:^NSComparisonResult(id l1, id l2){
         PFObject* p1=l1;
         PFObject* p2=l2;
         NSNumber *x=p1[@"X"];
         NSNumber *y=p1[@"Y"];
     CLLocation* locp1=[[CLLocation alloc] initWithLatitude:x.doubleValue longitude:y.doubleValue];
          x=p2[@"X"];
          y=p2[@"Y"];
         CLLocation* locp2=[[CLLocation alloc] initWithLatitude:x.doubleValue longitude:y.doubleValue];
         CLLocationDistance p1ToMy=[locp1 distanceFromLocation:self.demoLocation];
         CLLocationDistance p2ToMy=[locp2 distanceFromLocation:self.demoLocation];
         NSLog(@"%@   %@",p1[@"Name"],p2[@"Name"]);
         //return locp1 < locp2 ? NSOrderedAscending : locp1 > locp2 ? NSOrderedDescending : NSOrderedSame;
         if(p1ToMy<p2ToMy)
         {
           
            return NSOrderedAscending;
         }
         else if(p1ToMy>p2ToMy){
             
             return NSOrderedDescending;
         }
         else
         {
            return  NSOrderedSame;
         }
       
       
    }];
    
        self.gridView = [[AQGridView alloc] initWithFrame:CGRectMake(0, 83, 320, 480)];
    self.gridView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.gridView.autoresizesSubviews = YES;
    self.gridView.delegate = self;
    self.gridView.dataSource = self;

    [self.view addSubview:self.gridView];
    

    [self.gridView reloadData];
    
//    for(int i=0;i<[self.data count] ;i++)
//    {
//        PFObject* o=self.data[i];
//        NSNumber *x=o[@"X"];
//        NSNumber *y=o[@"Y"];
//        CLLocation* locp1=[[CLLocation alloc] initWithLatitude:x.doubleValue longitude:y.doubleValue];
//        CLLocationDistance p1ToMy=[locp1 distanceFromLocation:self.demoLocation];
//        NSString* t=[[NSString alloc]initWithFormat:@"%f",p1ToMy];
//        NSLog(@"%d = %@",i,t);
//    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)findGPS
{
    if(self.locationManager==nil)self.locationManager =[[CLLocationManager alloc] init];
    
   
    self.locationManager.delegate=self;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    //self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
    self.locationManager.desiredAccuracy =kCLLocationAccuracyHundredMeters;
    [self.locationManager startUpdatingLocation];
    
    NSLog(@"latitude = %f , longitude = %f",self.demoLocation.coordinate.latitude,self.demoLocation.coordinate.longitude);
    
}


-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    UIAlertView *errorAlert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"There was an error retrieving your location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [errorAlert show];
    NSLog(@"Error: %@",error.description);
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *crnLoc = [locations lastObject];
    NSLog(@"kjkjkjkjkjk %f",crnLoc.coordinate.longitude);
}
-(IBAction)SavedEventPage:(id)sender
{
    [self performSegueWithIdentifier:@"SavedEventPageFromRealTime" sender:self];
}
-(IBAction)EventPage:(id)sender
{
    [self performSegueWithIdentifier:@"ViewControllerPageFromRealTime" sender:self];
}

// Returns the number of items in grid view.
- (NSUInteger) numberOfItemsInGridView: (AQGridView *) aGridView
{
    return [self.data count];
}

 // returns a cell at given index
-(AQGridViewCell *) gridView: (AQGridView *) aGridView cellForItemAtIndex: (NSUInteger) index
{
    static NSString * PlainCellIdentifier = @"PlainCellIdentifier";
    GridViewCell * cell = (GridViewCell *)[aGridView dequeueReusableCellWithIdentifier:@"PlainCellIdentifier"];
    
    if ( cell == nil )
    {
        cell = [[GridViewCell alloc] initWithFrame: CGRectMake(0.0, 0.0, 160, 123)
                                   reuseIdentifier: PlainCellIdentifier];
        cell.selectionStyle=AQGridViewCellSelectionStyleBlue;
    }
  
    PFObject* event = self.data[index];
    PFFile *imageFile = event[@"ImageFile"];
    NSData* imgeData=[imageFile getData];
    UIImage* myImage = [UIImage imageWithData:imgeData];
    [cell.imageView setImage:myImage];
    [cell.captionLabel setText:event[@"Name"]];
     NSNumber *x=event[@"X"];
     NSNumber *y=event[@"Y"];
    CLLocation* curLoc=[[CLLocation alloc] initWithLatitude:x.doubleValue longitude:y.doubleValue];
     CLLocationDistance distance=[self.demoLocation distanceFromLocation:curLoc];
     NSString *dis = [[NSString alloc] initWithFormat:@"%f KM", (distance/1000)];
    [cell.ditstanceFromMe setText:dis];
    return cell;
}

// Returns the size of a cell in gridView
- (CGSize) portraitGridCellSizeForGridView: (AQGridViewCell *) aGridView
{
     return ( CGSizeMake(160.0, 123) );
}

// Called when a cell is selected
- (void) gridView:(AQGridView *)gridView didSelectItemAtIndex:(NSUInteger)index
{
    [self performSegueWithIdentifier:@"EventPageFromRealTime" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier]isEqualToString:@"EventPageFromRealTime"])
    {
        NSUInteger indexPath = [self.gridView indexOfSelectedItem];
        EventPage *event=segue.destinationViewController;
        event.parseObject =self.data[indexPath];
    }
}

@end
