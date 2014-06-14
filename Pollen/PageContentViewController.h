//
//  PageContentViewController.h
//  Pollen
//
//  Created by Lars Hundebøl on 08/06/14.
//  Copyright (c) 2014 Lars Hundebøl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController

@property NSUInteger pageIndex;
@property NSString *imageFile;
@property NSString *pollenText;
@property NSString *warningText;

@property (weak, nonatomic) IBOutlet UILabel *iconLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *pollenLabel;
@property (weak, nonatomic) IBOutlet UILabel *warningLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@end
