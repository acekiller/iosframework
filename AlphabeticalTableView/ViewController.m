//
//  ViewController.m
//  tableviews
//
//  Created by Fernando Aguilar on 9/18/12.
//  Copyright (c) 2012 rapid. All rights reserved.
//
//
//
//  connect this class to your tableview class in the storyboard.
//  All you need to do is rename the produce array to fit your data
//  ex. names, companies, surgeons.
//
//
//
//



#import "ViewController.h"
//#import "NextViewController.h"

@interface ViewController ()
@property (strong,nonatomic) NSMutableArray *produce;
@property (strong, nonatomic) NSMutableArray *letters;
//@property (strong, nonatomic) NextViewController *nv;

@end

@implementation ViewController
//synthesize all your variables and objects. This automatically makes a getter and setter method for each variable.
@synthesize tableView = _tableView;
@synthesize produce = _words;
@synthesize letters = _letters;
//@synthesize nv = _nv;

- (void)viewDidLoad
{
    //viewDidLoad is like the constructor to every class.
    //its not a constructor but it works like one. This method is called
    //when a view is loaded the first time only,
    //which means it is only called once everytime the app is run.
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:YES];
    
    //*****************************************************************************************************
    //*****************************************************************************************************
    //*****************************************************************************************************
    //just change the array name and initialization. Thats all you need to do!
    //*****************************************************************************************************
    //*****************************************************************************************************
    //*****************************************************************************************************
    //initialize the NSMutableArray here.
    //*****************************************************************************************************
    //*****************************************************************************************************
    //*****************************************************************************************************
    //refactor the produce array to be whatever you want and initialize it however you want
    self.produce = [[NSMutableArray alloc] initWithObjects:@"orange", @"banana",@"apple" ,@"carrot" ,@"pear"
    ,@"watermelon" ,@"broccoli" ,@"cauliflower" ,@"kiwi"
    ,@"melon" ,@"potato" ,@"mushroom" ,@"pepper"
    ,@"tomato" ,@"onion" ,@"celery" ,@"grapes"
    ,@"cherries" ,@"lettuce" ,@"cabbage" ,@"spinach"
    ,@"jalapeños" ,@"cilantro" ,@"zucchini" ,@"strawberries"
    ,@"fig" ,@"plum" ,@"lemon" ,@"mango"
    ,@"pineapple" ,@"honeydew" , nil ];
    //*****************************************************************************************************
    //*****************************************************************************************************
    //*****************************************************************************************************
    //*****************************************************************************************************
    //*****************************************************************************************************
    //*****************************************************************************************************
    //*****************************************************************************************************
    //*****************************************************************************************************
    //*****************************************************************************************************
    
    //letters will be used to store the starting letters of the words contained in the produce list.
    self.letters = [[NSMutableArray alloc] init];
    
    //sort the produce array so everything can be in alphabetical order
    [self.produce sortUsingSelector:@selector(compare:)];
    
    //go trough the produce list
    for (int i = 0; i < [self.produce count]; i++)
    {
        //get the first letter of each word in the list.
        char alphabet = [[self.produce objectAtIndex:i] characterAtIndex:0];
        //convert the character to a string
        NSString *uniChar = [NSString stringWithFormat:@"%c", alphabet];
        
        //add each letter to an index array if it is not already in there
        if(![self.letters containsObject:uniChar])
        {
            [self.letters addObject:uniChar];
        }
    }
    
        self.tableView.frame = CGRectMake(self.tableView.frame.size.width, self.tableView.frame.origin.y, self.tableView.frame.size.width, self.tableView.frame.size.height);
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
    [UIView setAnimationDelegate:self];
    self.tableView.frame = CGRectMake(0, self.tableView.frame.origin.y, self.tableView.frame.size.width, self.tableView.frame.size.height);
    
    [UIView commitAnimations];
    
}



- (void)viewDidUnload
{
    [self setTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //return YES if you want the screen to adjust to an orientation automatically
    return NO;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //the total number of sections that our table view will have is the number of
    //letters in our letter list. 
    return [self.letters count];
}

-(NSArray*)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    temp = self.letters;
    return temp;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //start off by getting the first letter of each section
    NSString *alphabet = [self.letters objectAtIndex:section];
    //use a nspredicate to match words that begin with a certain letter
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF beginswith[c] %@", alphabet];
    //filter the temporary array using the NSPredicate. This will return all the words that begin with a certain letter
    //for example if we are in the A section, the temp list will have apple.
    NSArray *temp = [self.produce filteredArrayUsingPredicate:predicate];
    //return the count of the temp list. Example, if we are in A the size returned will
    //be 1.
    return [temp count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //initialize your cell.
    static NSString *CellIdentifier = @"Cell";
    //use the cell identifier that you used in storyboard.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSString *alphabet = [self.letters objectAtIndex:[indexPath section]];
    //use a nspredicate to match words that begin with a certain letter
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF beginswith[c] %@", alphabet];
    //filter the temporary array using the NSPredicate. This will return all the words that begin with a certain letter
    //for example if we are in the A section, the temp list will have apple.
    NSArray *temp = [self.produce filteredArrayUsingPredicate:predicate];

    //if the size of the temporary list is greater than 0 then we can
    //add words to that section of the table view.
    if([temp count] > 0)
    {
        cell.textLabel.text = [temp objectAtIndex:indexPath.row];
        //set the color of the text to white. Otherwise it will not be visible
        //since we are using a black background.
        //if you want to change the color of the tableview cells go to the storyboard
        //and click on the tableview. Now click on the attributes inspector on the right column.
        //scrolldown to background and change the color.
        cell.textLabel.textColor = [UIColor whiteColor];
        UIView *bgColorView = [[UIView alloc] init];
        [bgColorView setBackgroundColor:[UIColor clearColor]];
        [cell setSelectedBackgroundView:bgColorView];
        //[cell.textLabel setFont:[UIFont fontWithName:@"Symbol" size:35]];
    }
    return cell;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    //the letters we extracted from our produce list will be used as the
    //titles for the header sections.
    return [self.letters objectAtIndex:section];
}

//-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 120)];
//    [headerView setBackgroundColor:[UIColor blackColor]];
//    //UIView *subHeader = [[UIView alloc] initWithFrame:CGRectMake(10, 0, 45, 45)];
//    //[subHeader setBackgroundColor:[UIColor redColor]];
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 45, 45)];
//    [label setText:[self.letters objectAtIndex:section]];
//    [label setTextColor:[UIColor whiteColor]];
//    [label setTextAlignment:UITextAlignmentCenter];
//    [label setFont:[UIFont fontWithName:@"Symbol" size:28]];
//    [label setBackgroundColor:[UIColor redColor]];
//    //[subHeader addSubview:label];
//    [headerView addSubview:label];
//    return headerView;
//}
//
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 55;
//}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //if the next view controller has not been initialized then initialize it
    //with the identifier name that you put in the storyboard.
//    if(!self.nv)
//    {
//        self.nv = [self.storyboard instantiateViewControllerWithIdentifier:@"Next"];
//    }
    NSString *alphabet = [self.letters objectAtIndex:[indexPath section]];
    //use a nspredicate to match words that begin with a certain letter
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF beginswith[c] %@", alphabet];
    //filter the temporary array using the NSPredicate. This will return all the words that begin with a certain letter
    //for example if we are in the A section, the temp list will have apple.
    NSArray *temp = [self.produce filteredArrayUsingPredicate:predicate];
    
    //do whatever you need to do here
    //use the temp array to get the item that was clicked in the tableview
    
    
    
//    [self.tableView beginUpdates];
//    [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:indexPath.row inSection:[indexPath section]]] withRowAnimation:UITableViewRowAnimationRight];
//    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:indexPath.row inSection:[indexPath section]]] withRowAnimation:UITableViewRowAnimationLeft];
//
//    [self.tableView endUpdates];
    

    //push the next view controller onto the stack. The next view will now be displayed.
    //[self goToNextView];
    //set the label in the next view to the item clicked. Always do this AFTER you have
    //pushed the view controller. Otherwise this will be set to null and will not change
    //anything.
    //self.nv.label.text = [temp objectAtIndex:indexPath.row];

}
//
//-(void)goToNextView
//{
//    [self.navigationController performSelector:@selector(pushViewController:animated:) withObject:self.nv afterDelay:.14];
//   // [self.navigationController pushViewController:self.nv animated:YES];
//}



@end
