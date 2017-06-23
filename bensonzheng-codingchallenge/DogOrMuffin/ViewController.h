//
//  ViewController.h
//  DogOrMuffin
//
//  Created by Benson Zheng on 6/22/17.
//  Copyright © 2017 Benson Zheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

-(void)generateImage;


@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *score;

@property (nonatomic) NSInteger rng;
@property (nonatomic) NSInteger currentAnswer;
@property (nonatomic) NSInteger totalImages;
@property (nonatomic) NSInteger totalCorrect;


- (IBAction)muffinButton:(id)sender;
- (IBAction)dogButton:(id)sender;
- (void)correctAnswerWas:(NSInteger)submitted;
@end

