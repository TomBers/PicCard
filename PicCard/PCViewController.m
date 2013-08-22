//
//  PCViewController.m
//  PicCard
//
//  Created by Tom Berman on 21/08/2013.
//  Copyright (c) 2013 A and T Design. All rights reserved.
//

#import "PCViewController.h"

@interface PCViewController ()

@end

@implementation PCViewController
@synthesize scrollView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	NSUInteger numberPages = 1;
    
    // a page is the width of the scroll view
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize =
    CGSizeMake(CGRectGetWidth(self.scrollView.frame) * numberPages, CGRectGetHeight(self.scrollView.frame));
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.scrollsToTop = NO;
    
//    self.scrollView.delegate = self;
    
    [self loadScrollViewWithPage:@"LSViewController" atIndex:0];
   
    
    
    
    [self gotoPage:1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadScrollViewWithPage:(NSString*)nib atIndex:(int) page
{
    
    UIViewController *controller = [[NSClassFromString(nib) alloc] initWithNibName:nib bundle:nil];
    
    // add the controller's view to the scroll view
    if (controller.view.superview == nil)
    {
        CGRect frame = self.scrollView.frame;
        frame.origin.x = CGRectGetWidth(frame) * page;
        frame.origin.y = 0;
        controller.view.frame = frame;
        
        [self addChildViewController:controller];
        [self.scrollView addSubview:controller.view];
        [controller didMoveToParentViewController:self];
        
        
    }
}

- (void)gotoPage:(int)targetPage
{
    //    NSInteger page = self.pageControl.currentPage;
    
    
	// update the scroll view to the appropriate page
    CGRect bounds = self.scrollView.bounds;
    bounds.origin.x = CGRectGetWidth(bounds) * targetPage;
    bounds.origin.y = 0;
    [self.scrollView scrollRectToVisible:bounds animated:false];
}

@end
