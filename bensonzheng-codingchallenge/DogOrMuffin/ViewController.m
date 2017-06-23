//
//  ViewController.m
//  DogOrMuffin
//
//  Created by Benson Zheng on 6/22/17.
//  Copyright © 2017 Benson Zheng. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"


@interface ViewController ()


@end




@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

//    int rng = arc4random_uniform(15);
//    self.runningScore = (NSInteger)rng;
//    for(int i = 0; i < 16; i++){
        self.totalImages = 0;
        self.totalCorrect = 0;
        [self generateImage];
        
//    }
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




//randomly select image then assign image to imageView
-(void)generateImage{
    self.rng = arc4random_uniform(15);
    NSString *rngName = [NSString stringWithFormat:@"%ld", (long)self.rng];
    [self.imageView setImage:[UIImage imageNamed:rngName]];
}


- (void)correctAnswerWas:(NSInteger)submitted{
    self.totalImages += 1;
    if(submitted == (self.rng % 2)){
        self.totalCorrect += 1;
    }
    NSString *tempResult = [NSString stringWithFormat:@"%ld / %ld", (long)self.totalCorrect, (long)self.totalImages];
    
    self.score.text = tempResult;
    
    if(self.totalImages > 2){
        [self performSegueWithIdentifier:@"gg" sender:self];
    }
}

- (IBAction)muffinButton:(id)sender {
    [self correctAnswerWas:0];
    [self generateImage];

}

- (IBAction)dogButton:(id)sender {
    [self correctAnswerWas:1];
    [self generateImage];
}


//view controller 2 obj created to pass data, im passing the final score over to the second view controller;
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ViewController2 *passData = segue.destinationViewController;
    passData.score = self.totalCorrect;
    
    passData.onDismiss = ^(UIViewController *sender) {
        self.totalImages = 0;
        self.totalCorrect = 0;
        
        self.score.text = 0;
        
    
    };

}

//-(void)gameOver{
//    
//    if(self.totalImages > 20){
//        performSeg
//    }
//
//}







@end
