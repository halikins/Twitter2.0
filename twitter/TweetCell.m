//
//  TweetCell.m
//  twitter
//
//  Created by Halima Monds on 7/2/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "UIImageView+AFNetworking.h"
#import "APIManager.h"

@implementation TweetCell

//TAPPING REPLY ACTION
- (IBAction)didTapReply:(id)sender {
}

//TAPPING RETWEET ACTION
- (IBAction)didTapRetweet:(id)sender {
    if (self.tweet.retweeted != YES) {
        [self retweetTweet];
    } else {
        [self unretweetTweet];
    }
}

//TAPPING FAVORITE ACTION
- (IBAction)didTapFavorite:(id)sender {
    if (self.tweet.favorited != YES) {
        [self favoriteTweet];
    }
    else {
        [self unfavoriteTweet];
    }
}

//FAVORITE TWEET METHOD
- (void) favoriteTweet {
    [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
        if(error){
            NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
        }
        else{
            NSLog(@"Successfully FAVORITED the following Tweet: %@", tweet.text);
        }
    }];

    self.tweet.favorited = YES;
    self.tweet.favoriteCount += 1;
    self.favoriteButton.selected = YES;
    [self refreshData];
}

//UNFAVORITE TWEET METHOD
- (void) unfavoriteTweet {
    [[APIManager shared] unfavorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
        if(error){
            NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
        }
        else{
            NSLog(@"Successfully UNFAVORITED the following Tweet: %@", tweet.text);
        }
    }];
    
    self.tweet.favorited = NO;
    self.tweet.favoriteCount -= 1;
    self.favoriteButton.selected = NO;
    [self refreshData];
}

//RETWEET TWEET METHOD
-(void) retweetTweet {
    [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
        if(error){
            NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
        }
        else{
            NSLog(@"Successfully RETWEETED the following Tweet: %@", tweet.text);
        }
    }];
    self.tweet.retweeted = YES;
    self.tweet.retweetCount += 1;
    self.retweetButton.selected = YES;
    [self refreshData];
}

//UNRETWEET TWEET METHOD
- (void) unretweetTweet {
    [[APIManager shared] unretweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
        if(error){
            NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
        }
        else{
            NSLog(@"Successfully UNRETWEETED the following Tweet: %@", tweet.text);
        }
    }];
    self.tweet.retweeted = NO;
    self.tweet.retweetCount -= 1;
    self.retweetButton.selected = NO;
    [self refreshData];
}


//UNKNOWN AND UNNEEDED
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


// Configure the view for the selected state
- (void)configureCell:(Tweet *)tweet {
    self.tweet = tweet;
    self.tweetUser.text = tweet.user.screenName;
    self.tweetAuthor.text = tweet.user.name;
    self.tweetDate.text = tweet.createdAtString;
    self.tweetText.text = tweet.text;
    self.tweetFavorite.text = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];
    self.tweetRetweet.text = [NSString stringWithFormat:@"%d", self.tweet.retweetCount];
    self.tweetPhoto.image = nil;
    [self.tweetPhoto setImageWithURL:tweet.user.profileURL];
}

//REFRESH DATA AFTER FAVORITING OR RETWEETING
- (void)refreshData {
    self.tweetFavorite.text = [NSString stringWithFormat:@"%d", (self.tweet.favoriteCount)];
    self.tweetRetweet.text = [NSString stringWithFormat:@"%d@", (self.tweet.retweetCount)];
}
@end
