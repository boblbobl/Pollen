//
//  PageContentViewController.m
//  Pollen
//
//  Created by Lars Hundebøl on 08/06/14.
//  Copyright (c) 2014 Lars Hundebøl. All rights reserved.
//

#import "PageContentViewController.h"

@interface PageContentViewController ()

@end

@implementation PageContentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.backgroundImageView.image = [UIImage imageNamed:self.imageFile];
    
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    
    CAGradientLayer *gradientLayerMask = [CAGradientLayer layer];
    NSArray *colors = [NSArray arrayWithObjects:
                       (id)[[UIColor colorWithWhite:0 alpha:0] CGColor],
                       (id)[[UIColor colorWithWhite:0 alpha:1] CGColor],
                       (id)[[UIColor colorWithWhite:0 alpha:1] CGColor],
                       (id)[[UIColor colorWithWhite:0 alpha:0] CGColor],
                       nil];
    
    [gradientLayerMask setColors:colors];
    [gradientLayerMask setStartPoint:CGPointMake(0.0f, -0.1f)];
    [gradientLayerMask setEndPoint:CGPointMake(0.0f, 1.05f)];
    [gradientLayerMask setFrame:[self.view bounds]];
    
    [[self.backgroundImageView layer] setMask:gradientLayerMask];
    
    [self.iconLabel setFont:[UIFont fontWithName:@"Pictos" size:20]];
    
    self.pollenLabel.text = self.pollenText;
    self.warningLabel.text = self.warningText;
    self.dateTimeLabel.text = @"12.00";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
