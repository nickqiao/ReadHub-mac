//
//  Article.m
//  NsTab
//
//  Created by nickchen on 2018/1/16.
//  Copyright © 2018年 chenyuqiao. All rights reserved.
//

#import "Article.h"
#import "RelateArticle.h"
@implementation Article

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"articleID" : @"id"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"newsArray" : [RelateArticle class]};
}

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    NSString *create = dic[@"createdAt"];
    NSString *publishDate = dic[@"publishDate"];
    NSString *updatedAt = dic[@"updatedAt"];
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.zzz'Z'"];
    
    if (create != nil) {
        _createdAt = [formatter dateFromString:create];
    }
    
    if (publishDate != nil) {
        _publishDate = [formatter dateFromString:publishDate];
    }
    
    if (updatedAt != nil) {
        _updatedAt = [formatter dateFromString:updatedAt];
    }
    
    return YES;
}

@end
