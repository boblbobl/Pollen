//
//  ViewController.m
//  Pollen
//
//  Created by Lars Hundebøl on 05/06/14.
//  Copyright (c) 2014 Lars Hundebøl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _pageTitles = @[@"Græs", @"Bynke", @"Birk"];
    _pageImages = @[@"Grass.png", @"Mugwort.png", @"Birch.png"];
    _pageWarnings = @[@"Høj", @"Moderat", @"Udenfor Sæson"];
    _pageLocation = @"København K";
    
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    self.pageViewController.delegate = self;
    
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
    self.pageControl.numberOfPages = [self.pageTitles count];
    [self.view bringSubviewToFront:self.pageControl];
    
    
    [self.view bringSubviewToFront:self.locationLabel];
    self.locationLabel.text = self.pageLocation;
    [self.locationLabel sizeToFit];
    
    
    [self.iconLabel setFont:[UIFont fontWithName:@"Pictos" size:20]];
    [self.view bringSubviewToFront:self.iconLabel];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pageContentViewController.imageFile = self.pageImages[index];
    pageContentViewController.pollenText = self.pageTitles[index];
    pageContentViewController.warningText = self.pageWarnings[index];
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}

#pragma mark - Page View Controller Delegate


- (void)pageViewController:(UIPageViewController *)viewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    if (!completed){return;}
    
    PageContentViewController *pageContentViewController = (PageContentViewController *)[self.pageViewController.viewControllers lastObject];
    self.pageControl.currentPage = pageContentViewController.pageIndex;
}


#pragma mark - Page View Controller Data Source


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageTitles count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

@end
