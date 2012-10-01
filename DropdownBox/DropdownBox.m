//
//  DropdownBox.m
//  
//
//  Created by Andrew Furusawa on 9/28/12.
//
//

/*
 In order to integrate this dropdown box into their project, they must create the tables for each dropdown they want in their project in the class that will be using the dropdown (i.e. self). What this class does is that it creates the table being used as a dropdown and animates it.
 To position the component correctly, make sure you figure out the exact location (via CGRectMake) of the UITextField or UIButton or whatever you want to add a dropdown box to because its kind of impossible to do that directly in this class.
 */

#import "DropdownBox.h"

@implementation DropdownBox

static NSMutableArray *list;
static UITableView *table;
static CGRect myFrame;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
 This method will both create the dropdown box as well as display it. It is recommended that you call this method in the action method that is supposed to invoke the dropdown (i.e. the little button next to your UITextField that makes the dropdown drop down).
 
 Parameters:
 1) WithFrame = using CGRectMake(...), specify the origin and size of your dropdown box in the view that is going to utilize this dropdown. Note the default height of each cell is 44, so you'd want to make the height of your dropdown a factor of 44 (i.e. 44*2, to show 2 cells).
 
 2) view = use "self" for this value.
 
 3) list = use the NSMutableArray you want to show the dropdown of.
 
 4) withAnimation = use "YES" to show a slide-down animation of the dropdown, and "NO" to immediately display it.
 */
+ (void)addDropdownWithFrame:(CGRect)frame view:(UIViewController *)viewController list:(NSMutableArray *)arraylist withAnimation:(BOOL)animated
{
    list = arraylist;
    
    table = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    table.dataSource = (id)viewController;
    table.delegate = (id)viewController;
    table.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 0);
    myFrame = table.frame;
    table.backgroundColor = [UIColor lightGrayColor];
    table.hidden = NO;
    
    if (animated) {
        
        [viewController.view addSubview:table];
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:0.5f];
        [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:table cache:YES];
        
        table.frame = frame;
        
        [UIView commitAnimations];
        
    }
    else {
        [viewController.view addSubview:table];
    }
}

/*
 This method retracts the dropdown box using a slide-in animation. Call this method inside of your view's didSelectRowWithIndex method.
 
 Parameters:
 1) animated = set to "YES" if you want it to retract or "NO" to immediately remove it.
 */
+ (void)stopAnimation:(BOOL)animated
{
    if (animated) {
        // Animate closing
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:0.2f];
        [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:table cache:YES];
        
        table.frame = myFrame;
        
        [UIView commitAnimations];
    }
    else {
        table.hidden = YES;
    }
}


@end
