//
//  RelateArticle.m
//  NsTab
//
//  Created by nickchen on 2018/1/16.
//  Copyright © 2018年 chenyuqiao. All rights reserved.
//

#import "RelateArticle.h"

@implementation RelateArticle

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"articleID" : @"id"};
}

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    
    NSString *publishDate = dic[@"publishDate"];
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.zzz'Z'"];
    
    if (publishDate != nil) {
        _publishDate = [formatter dateFromString:publishDate];
    }
    
    return YES;
}

@end
