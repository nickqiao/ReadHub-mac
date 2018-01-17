//
//  RelateArticle.h
//  NsTab
//
//  Created by nickchen on 2018/1/16.
//  Copyright © 2018年 chenyuqiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RelateArticle : NSObject

@property NSString *articleID;
@property NSString *url;
@property NSString *title;
@property NSString *groupId;
@property NSString *siteName;

@property NSString *siteSlug;
@property NSString *mobileUrl;
@property NSString *authorName;
@property NSString *duplicateId;
@property NSDate *publishDate;

@end
