//
//  Article.h
//  NsTab
//
//  Created by nickchen on 2018/1/16.
//  Copyright © 2018年 chenyuqiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Article : NSObject

@property NSString * articleID;
@property NSDate * createdAt;
@property NSDictionary * neldata;
@property NSDictionary * eventData;
@property NSArray * newsArray;
@property uint64 order;
@property NSDate * publishDate;
@property NSString * summary;
@property NSString * title;
@property NSDate * updatedAt;
@property NSString * timeline;
@property NSDictionary * extra;

@end
