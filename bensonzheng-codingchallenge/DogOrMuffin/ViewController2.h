//
//  ViewController2.h
//  DogOrMuffin
//
//  Created by Benson Zheng on 6/22/17.
//  Copyright © 2017 Benson Zheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController2 : UIViewController

@property (nonatomic) NSInteger score;

@property (weak, nonatomic) IBOutlet UILabel *finalScore;

@property (weak, nonatomic) IBOutlet UIImageView *rewardImage;

@property(nonatomic) NSString *finalString;
@property (nonatomic) NSString *resultString;

-(void)reward;
@property (nonatomic, strong) void (^onDismiss)(UIViewController *sender);

//- (IBAction)playAgain:(id)sender;
- (IBAction)replay:(id)sender;

@end
