//
//  NSObject+propertyCode.h
//  WEChatYU
//
//  Created by apple on 16/6/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (propertyCode)
/**
 *  自动生成属性申明Code
 *  @param dict 传入的字典
 */
+ (void)propertyCodeWithDictionary:(NSDictionary *)dict;
@end
