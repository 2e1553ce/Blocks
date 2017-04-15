//
//  main.m
//  TestProject
//
//  Created by iOS-School-1 on 15.04.17.
//  Copyright © 2017 iOS-School-1. All rights reserved.
//

#import <Foundation/Foundation.h>

void f(int a, int (^inc)(void)) {
    
    NSLog(@"%@", @(a + inc()));
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{ // zhdem zaversh
            dispatch_async(dispatch_get_main_queue(), ^{ // obratilis na main i zhdem verhnyy
                NSLog(@"Hello world");
            });
        });
    }
    return 0;
}

/*
 
 __block int a = 10;
 int (^inc)(void) = ^int(void) {
 //NSLog(@"%@", @(a));
 return a;
 };
 a += 10;
 inc();
 f(11, inc);
*/

/*
 {
 // ivar obyavit i check s photo
 }
 @interface 
 {
    @property nonatom, copy NSString *str;
    @property  nonatom, copy(vsegda copy esli block property) void (^blockTest)(void);
 }
@impl
 {
 -(instancetype)init {
    self super init ..
 if {
    _str = @"Hello string";
 }
 }
 
 // 1
 -(void)test {
    void (^testMemory)(void) = ^void(void) {
        NSLog(@"%@", self.str) // tut problema s selfom. // derzhitsya chtobi ne ydalilsya self ranshe vremeni
    });
    testMemory();
 }
 // 2
 -(void)test {
    self.blockTest = ^void(void) {
    NSLog(@"%@", self.str) // warning posmotret;
    });
    self.blockTest();
 }
 
 // 3
 -(void)test {
    _weak typeOf(self) weakSelf = self;
    self.blockTest = ^void(void) {
    NSLog(@"%@", weakSelf.str) // tut mozhet bit nil
    });
    self.blockTest();
 }
 
 // 4
 -(void)test {
    _weak typeOf(self) weakSelf = self;
    self.blockTest = ^void(void) {
    __strong typeOf9Self) strongSelf = weakSelf;
    NSLog(@"%@", strongSelf.str)
    });
    self.blockTest();
 }
 
 }
 
 // BlockTestClass *testClass = new;
 // [testclass testmemory];
*/
