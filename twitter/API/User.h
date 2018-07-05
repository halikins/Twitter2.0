//
//  User.h
//  twitter
//
//  Created by Halima Monds on 7/2/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
//Halima's Properties

@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) NSString *screenName;
@property(strong, nonatomic) NSURL *profileURL;
//Create initializer
- (id)initWithDictionary: (NSDictionary *)dictionary;
@end
