//
//  ViewController.h
//  Pollen
//
//  Created by Lars Hundebøl on 05/06/14.
//  Copyright (c) 2014 Lars Hundebøl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"

@interface ViewController : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *iconLabel;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property NSString *pageLocation;
@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageWarnings;
@property (strong, nonatomic) NSArray *pageImages;

@end
