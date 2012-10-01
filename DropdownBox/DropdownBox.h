//
//  DropdownBox.h
//  
//
//  Created by Andrew Furusawa on 9/28/12.
//
//

#import <UIKit/UIKit.h>

@interface DropdownBox : UIView <UITableViewDataSource, UITableViewDelegate>

+ (void)addDropdownWithFrame:(CGRect)frame view:(UIViewController *)viewController list:(NSMutableArray *)arraylist withAnimation:(BOOL)animated;

+ (void)stopAnimation:(BOOL)animated;
@end
