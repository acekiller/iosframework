//
//  ViewController.h
//  tableviews
//
//  Created by Fernando Aguilar on 9/18/12.
//  Copyright (c) 2012 rapid. All rights reserved.
//

#import <UIKit/UIKit.h>
                                                //delegates that are going to be implemented by a view always go
                                                //in between the < > right here. Putting the delegates here means that you
                                                //have to implement methods for the class delegate e.g. the tableview in this case.
@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
