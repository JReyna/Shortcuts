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
@end
