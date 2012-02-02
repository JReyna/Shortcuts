//
//  iPadViewController.m
//  Shortcuts
//
//  Created by James Reyna on 2/1/12.
//  Copyright (c) 2012 Ray Wenderlich. All rights reserved.
//

#import "iPadViewController.h"

@implementation iPadViewController
@synthesize leftView;
@synthesize middleView;
@synthesize rightView;
@synthesize decorationView;
@synthesize bottomView;
@synthesize favoritesImageView;
@synthesize favoritesButton;
@synthesize settingsButton;
@synthesize bgImageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    

}

- (void)viewDidUnload
{
    [self setLeftView:nil];
    [self setMiddleView:nil];
    [self setRightView:nil];
    [self setDecorationView:nil];
    [self setBottomView:nil];
    [self setFavoritesImageView:nil];
    [self setFavoritesButton:nil];
    [self setSettingsButton:nil];
    [self setBgImageView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

- (IBAction)favoritesButtonTapped:(id)sender {
}

- (IBAction)settingsButtonTapped:(id)sender {
}

- (void)layoutForOrientation:(UIInterfaceOrientation)interfaceOrientation 
{
    if (UIInterfaceOrientationIsPortrait(interfaceOrientation)) {
        leftView.frame = CGRectMake(19, 73, 355, 433);
        middleView.frame = CGRectMake(393, 73, 355, 433);
        rightView.frame = CGRectMake(768, 73, 355, 433);
        bottomView.frame = CGRectMake(165, 10, 558, 447);
        favoritesButton.frame = CGRectMake(47, 378, settingsButton.frame.size.width, favoritesButton.frame.size.height);
    } else {
        leftView.frame = CGRectMake(19, 73, 320, 433);
        middleView.frame = CGRectMake(354, 73, 320, 433);
        rightView.frame = CGRectMake(690, 73, 320, 433);
        bottomView.frame = CGRectMake(190, 10, 785, 191);
        favoritesButton.frame = CGRectMake(14, 126, favoritesButton.frame.size.width, favoritesButton.frame.size.height);
        settingsButton.frame = CGRectMake(105, 126, settingsButton.frame.size.width, favoritesButton.frame.size.height);
    }
}
- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"ipadViewController - viewWillAppear");
    [self layoutForOrientation:
     [UIApplication sharedApplication].statusBarOrientation];
    
}

- (void)willRotateToInterfaceOrientation:
    (UIInterfaceOrientation)toInterfaceOrientationduration
                                duration:(NSTimeInterval)duration {
    NSLog(@"iPadViewController - willRotateToInterfaceOrientation");
    [UIView animateWithDuration:duration animations:^{
        [self layoutForOrientation:toInterfaceOrientationduration];
    }];
}

@end
