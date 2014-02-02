//
//  ViewController.m
//  FirstProject
//
//  Created by Nathan Fuller on 2/1/14.
//  Copyright (c) 2014 Nathan Fuller. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (assign) bool clickable;
@property (assign) int clickCount;
@property (strong, nonatomic) UIImageView *labelBackground;
@property (weak, nonatomic) IBOutlet UILabel *theLabel;
- (IBAction)theButton:(id)sender;

@end

@implementation ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.clickable = true;
    self.clickCount = 0;
    [self.theLabel setAlpha:(0.0f)];
    self.labelBackground = [[UIImageView alloc]
                                    initWithImage:[UIImage imageNamed:@"kitty00.jpg"]];
    self.labelBackground.frame = self.theLabel.frame;
    [self.theLabel addSubview: self.labelBackground];
    self.theLabel.backgroundColor = [UIColor clearColor];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fadeInLabels
{
    self.clickable = false;
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^ {[self.theLabel setAlpha:(1.0f)];}
                     completion:^(BOOL finished) {
                         [self.theLabel setAlpha:(1.0f)];
                         [self fadeOutLabels];
                     }];
}

- (void)fadeOutLabels
{
    [UIView animateWithDuration:1.0
                          delay:1.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^ {[self.theLabel setAlpha:(0.0f)];}
                     completion:^(BOOL finished) {
                         [self.theLabel setAlpha:(0.0f)];
                         self.clickable = true;
                     }];
}

- (void)changeKitty
{
    [self.labelBackground setImage:[UIImage imageNamed:
                            [NSString stringWithFormat:@"kitty0%d.jpg", (self.clickCount) % 8]]];
    [self.theLabel addSubview: self.labelBackground];
    self.clickCount += 1;
}

- (IBAction)theButton:(id)sender
{
    if(self.clickable == true){
        self.clickable = false;
        [self.theLabel setAlpha:(0.0f)];
        // [self.theLabel setText:(@"hello")];
        [NSTimer scheduledTimerWithTimeInterval:0.0 target:self selector:@selector(fadeInLabels) userInfo:nil repeats:NO];
        //[NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(fadeOutLabels) userInfo:nil repeats:NO];
        [self changeKitty];
    }
}
@end
