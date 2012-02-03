//
//  iPadViewController.h
//  Shortcuts
//
//  Created by James Reyna on 2/1/12.
//  Copyright (c) 2012 Ray Wenderlich. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DictionaryViewController;
@class SearchableShortcutsViewController; @class FavoritesViewController;

@class SettingsViewController;
@interface iPadViewController : UIViewController { 
    DictionaryViewController * _menusViewController;
    DictionaryViewController * _keysViewController; 
    SearchableShortcutsViewController * _allShortcutsViewController; 
    FavoritesViewController * _favoritesViewController; 
    SettingsViewController * _settingsViewController; 
    UINavigationController * _menusNav;
    UINavigationController * _keysNav;
    UINavigationController * _allNav; 
}
@property (strong, nonatomic) IBOutlet UIView *leftView; 
@property (strong, nonatomic) IBOutlet UIView *middleView; 
@property (strong, nonatomic) IBOutlet UIView *rightView; 
@property (strong, nonatomic) IBOutlet UIView *decorationView; 
@property (strong, nonatomic) IBOutlet UIView *bottomView; 
@property (strong, nonatomic) IBOutlet UIImageView *favoritesImageView;
@property (strong, nonatomic) IBOutlet UIButton *favoritesButton; 
@property (strong, nonatomic) IBOutlet UIButton *settingsButton; 
@property (strong, nonatomic) IBOutlet UIImageView *bgImageView; 

- (IBAction)favoritesButtonTapped:(id)sender;
- (IBAction)settingsButtonTapped:(id)sender;

@end
