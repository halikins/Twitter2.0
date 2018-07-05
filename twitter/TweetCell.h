//
//  TweetCell.h
//  twitter
//
//  Created by Halima Monds on 7/2/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

@interface TweetCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *tweetPhoto;
@property (weak, nonatomic) IBOutlet UILabel *tweetAuthor;
@property (weak, nonatomic) IBOutlet UILabel *tweetUser;
@property (weak, nonatomic) IBOutlet UILabel *tweetText;
@property (weak, nonatomic) IBOutlet UILabel *tweetDate;
@property (weak, nonatomic) IBOutlet UILabel *tweetRetweet;
@property (weak, nonatomic) IBOutlet UILabel *tweetReply;
@property (weak, nonatomic) IBOutlet UILabel *tweetFavorite;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;
@property (strong, nonatomic) Tweet *tweet;
@property (weak, nonatomic) IBOutlet UIButton *retweetButton;
-(void) configureCell:(Tweet *)tweet;
@end
