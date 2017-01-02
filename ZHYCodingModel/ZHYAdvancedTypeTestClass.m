//
//  ZHYAdvancedTypeTestClass.m
//  ZHYCodingModel
//
//  Created by Henry on 2016/12/31.
//  Copyright © 2016年 John Henry. All rights reserved.
//

#import "ZHYAdvancedTypeTestClass.h"

@implementation ZHYAdvancedTypeTestClass

#pragma mark - Overridden

- (instancetype)init {
    self = [super init];
    if (self) {
        _ptrValue = (__bridge void *)self;
        _cStringValue = "xyz\0";
        _charArray[0] = 'X';
        _charArray[1] = 'Y';
        _charArray[2] = 'Z';
        _rectValue = CGRectMake(10, 10, 10, 10);
        _unionValue.point = CGPointMake(20, 20);
    }
    
    return self;
}

- (BOOL)isEqual:(id)object {
    if (![object isKindOfClass:[ZHYBaseTypeTestClass class]]) {
        return NO;
    }
    
    return [self isEqualToZHYAdvancedTypeTestClass:object];
}

#pragma mark - Private Methods

- (BOOL)isEqualToZHYAdvancedTypeTestClass:(ZHYAdvancedTypeTestClass *)object {
    if (object.ptrValue != _ptrValue) {
        return NO;
    }
    
    if (strcmp(object.cStringValue, _cStringValue) != 0) {
        return NO;
    }

    for (int i = 0; i < 3; ++i) {
        char a = _charArray[i];
        char b = object->_charArray[i];
        if (a != b) {
            return NO;
        }
    }
    
    if (!NSEqualRects(object.rectValue, _rectValue)) {
        return NO;
    }

    union unionType u1 = object.unionValue;
    union unionType u2 = _unionValue;
    if (memcmp(&u1, &u2, sizeof(union unionType)) != 0) {
        return NO;
    }
    
    return [super isEqual:object];
}

@end
