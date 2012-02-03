//
//  iPadViewController.m
//  Shortcuts
//
//  Created by James Reyna on 2/1/12.
//  Copyright (c) 2012 Ray Wenderlich. All rights reserved.
//

#import "iPadViewController.h"
#import "ShortcutsDatabase.h"
#import "DictionaryViewController.h"
#import "SearchableShortcutsViewController.h" 
#import "FavoritesViewController.h"
#import "SettingsViewController.h"

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
    self.bgImageView.image = [[UIImage imageNamed:@"bg_200"]
                              resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    
    _menusViewController = [[DictionaryViewController alloc] initWithNibName:nil bundle:nil];
    _menusViewController.navigationItem.title = @"Shortcuts By Menu"; 
    _menusViewController.dict =
    [ShortcutsDatabase sharedDatabase].shortcutsByMenu; 
    _menusViewController.keys = [ShortcutsDatabase sharedDatabase].menusArray;
    _keysViewController = [[DictionaryViewController alloc] initWithNibName:nil bundle:nil];
    _keysViewController.navigationItem.title = @"Shortcuts By Key"; 
    _keysViewController.dict =
    [ShortcutsDatabase sharedDatabase].shortcutsByKey;
    _allShortcutsViewController = [[SearchableShortcutsViewController alloc] initWithNibName:nil bundle:nil];
    _allShortcutsViewController.navigationItem.title = @"All Shortcuts"; 
    _allShortcutsViewController.shortcutsDict = [ShortcutsDatabase sharedDatabase].shortcutsByKey;
    _favoritesViewController = [[FavoritesViewController alloc] initWithNibName:nil bundle:nil];
    _settingsViewController = [[SettingsViewController alloc] initWithNibName:nil bundle:nil];
    _menusNav = [[UINavigationController alloc] initWithRootViewController:_menusViewController];
    _keysNav = [[UINavigationController alloc] initWithRootViewController:_keysViewController];
    _allNav = [[UINavigationController alloc]
               initWithRootViewController:_allShortcutsViewController];
    
    _menusNav.view.frame = leftView.bounds; _keysNav.view.frame = middleView.bounds; _favoritesViewController.view.frame = bottomView.bounds; _settingsViewController.view.frame = bottomView.bounds; 
    _allNav.view.frame = rightView.bounds;
    [leftView addSubview:_menusNav.view];
    [middleView addSubview:_keysNav.view];
    [bottomView addSubview:_favoritesViewController.view]; 
    [rightView addSubview:_allNav.view];
    
    [self addChildViewController:_menusNav]; [_menusNav didMoveToParentViewController:self]; [self addChildViewController:_keysNav];
    [_keysNav didMoveToParentViewController:self];
    [self addChildViewController:_favoritesViewController]; [_favoritesViewController didMoveToParentViewController:self];
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

- (IBAction)favoritesButtonTapped:(id)sender { [[ShortcutsDatabase sharedDatabase] playClick];
    [self addChildViewController:_favoritesViewController]; 
    [self transitionFromViewController:_settingsViewController
     toViewController:_favoritesViewController duration:0.5 
    options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
        [_settingsViewController.view removeFromSuperview]; 
        _favoritesViewController.view.frame = bottomView.bounds; 
        [bottomView addSubview:_favoritesViewController.view];
    } completion:^(BOOL finished) { [_favoritesViewController
    didMoveToParentViewController:self]; 
        [_settingsViewController removeFromParentViewController];
    }]; 
}

- (IBAction)settingsButtonTapped:(id)sender {
    [[ShortcutsDatabase sharedDatabase] playClick];
    [self addChildViewController:_settingsViewController]; 
    [self transitionFromViewController:_favoritesViewController
    toViewController:_settingsViewController duration:0.5 options:
     UIViewAnimationOptionTransitionFlipFromBottom animations:^{
    [_favoritesViewController.view removeFromSuperview]; 
         _settingsViewController.view.frame = bottomView.bounds; 
         [bottomView addSubview:_settingsViewController.view];
    } completion:^(BOOL finished) { [_settingsViewController
    didMoveToParentViewController:self]; 
        [_favoritesViewController removeFromParentViewController];
    }];
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
