//
//  IWPFTools.m
//  FunctionDemo
//
//  Created by Chen Li on 16/9/26.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import "IWPFTools.h"

@implementation IWPFTools

+ (id)readUserDefaults:(NSString *)keyName
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    id info = [defaults stringForKey:keyName];
    return info = nil ? nil : info;
}

+ (void)writeUserDefaults:(NSString *)keyName value:(id)value
{
    if (![IWPFTools checkObjectEqualNull:value])
    {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:value forKey:keyName];
        [defaults synchronize];
    }
}

+ (BOOL)checkObjectEqualNull:(id)object
{
    if (object == nil || [object isEqual:[NSNull null]])
    {
        return YES;
    }
    return NO;
}

+ (BOOL)checkStringEqualNull:(NSString *)string
{
    if (string == nil)
    {
        return YES;
    }
    if ([string isEqualToString:EMPTY_STR])
    {
        return YES;
    }
    return NO;
}


+ (NSString *)safeString:(NSString *)checkString
{
    if (![IWPFTools checkStringEqualNull:checkString])
    {
        return checkString;
    }
    return EMPTY_STR;
}

+ (NSData *)useJsonChangeDictionaryToData:(NSDictionary *)dictionary
{
    NSError *error;
    NSData  *data = [NSJSONSerialization dataWithJSONObject:dictionary
                                                    options:NSJSONWritingPrettyPrinted
                                                      error:&error];
    return data;
}

+ (NSString *)currentDateWithFormat:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    return [dateFormatter stringFromDate:[NSDate date]];
}

+ (BOOL)isHaveString:(NSString *)string1 InString:(NSString *)string2
{
    NSRange range = [string2 rangeOfString:string1];
    if (range.location != NSNotFound)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}



@end
