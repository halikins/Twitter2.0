//
//  ComposeViewController.m
//  twitter
//
//  Created by Halima Monds on 7/3/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import "APIManager.h"
#import "Tweet.h"

@interface ComposeViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *tweetNew;
@property (weak, nonatomic) IBOutlet UILabel *tweetCount;
- (IBAction)tweetClose:(id)sender;
- (IBAction)tweetPost:(id)sender;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    self.tweetNew.delegate = self;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    
    
- (IBAction)tweetPost:(id)sender {
    [[APIManager shared] postStatusWithText:self.tweetNew.text completion:^(Tweet *tweet, NSError *error) {
        if (tweet) {
            
            } else {
                NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
            }
    }];
   // - (void)didTweet:(Tweet *)tweet;
    [self dismissViewControllerAnimated:true completion:nil];
}



- (BOOL)textView:(UITextView *)textNew shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    // Set the max character limit
    int characterLimit = 280;
    
    // Construct what the new text would be if we allowed the user's latest edit
    NSString *newText = [self.tweetNew.text stringByReplacingCharactersInRange:range withString:text];
    
    // TODO: Update Character Count Label
    // The new text should be allowed? True/False
    return newText.length < characterLimit;
}

- (void)textViewDidChange:(UITextView *)textNew {
    int characterLimit = 280;
    int charactersLeft = characterLimit - self.tweetNew.text.length;
    //Make the integer a string
    NSString *printCount = [NSString stringWithFormat:@"%d", charactersLeft];
    //Set string equal to count label text
    self.tweetCount.text = printCount;
}
- (IBAction)tweetClose:(id)sender{
    [self dismissViewControllerAnimated:true completion:nil];
}


@end
