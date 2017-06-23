//
//  ViewController2.m
//  DogOrMuffin
//
//  Created by Benson Zheng on 6/22/17.
//  Copyright © 2017 Benson Zheng. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.finalScore.text = [NSString stringWithFormat:@"%ld", (long)self.score];
    [self reward];
    [self downloadImage];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)reward{

    if(self.score >= 20){
        //win milk tea!
        self.resultString = @"51e31673498ec9e0e85eb3d0";
    }else if (self.score < 20 &&  self.score >= 10){
        //sweets
        self.resultString = @"51c60866498ed63482007c22";
    }else
        //muffin
        self.resultString = @"4f91f08de4b003d823127a51";
}

-(void)downloadImage{
    
    NSString *prefix = @"https://api.foursquare.com/v2/photos/";
    NSString *suffix = @"client_id=IRXOUDM0XFAGF3HFXWZNDGU53ZTF2TVZUPUST1S13XI2CM1I&client_secret=FALNPCIJHVN4CXBJWCRFNUQX3EUSV1CNHHPDJWI2DYQM3CP1&v=20170623";
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@?%@",prefix,self.resultString,suffix];
    
    
    
    NSURL *url = [[NSURL alloc]initWithString:urlString];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSData *data = [[NSData alloc]initWithContentsOfURL:location];
        
//        self.image = [[UIImage alloc]initWithData:data];
        NSDictionary *dictionary  = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSString *pre = [dictionary valueForKeyPath:@"response.photo.prefix"];
        NSString *size = @"300x300";
        NSString *suf = [dictionary valueForKeyPath:@"response.photo.suffix"];

        
        self.finalString = [NSString stringWithFormat:@"%@%@%@", pre,size,suf];
        
        
        //parsed the correct reward image and assign to imageview
        NSURL *finalURL = [NSURL URLWithString:self.finalString];
        NSData *finalData = [[NSData alloc]initWithContentsOfURL:finalURL];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.rewardImage.image = [UIImage imageWithData:finalData];

        });
        
//        NSLog(@"%@", self.finalString);
        
    }];
    
    [downloadTask resume];

}
//- (IBAction)playAgain:(id)sender {
//    NSLog(@"pressed");
//    [self dismissViewControllerAnimated:NO completion:nil];
//
//}
- (IBAction)replay:(id)sender {
    ViewController *replace = [[ViewController alloc]init];
    replace.totalImages = 0;
    replace.totalCorrect = 0;
    
    NSLog(@"replay!");
    [self dismissViewControllerAnimated:YES completion:^{
        self.onDismiss(self);
    }];
    
}
@end
