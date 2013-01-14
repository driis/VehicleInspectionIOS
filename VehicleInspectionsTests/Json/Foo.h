#import <Foundation/Foundation.h>

@interface Bar : NSObject
@property(nonatomic, readonly) NSString* fooBar;
@end

@interface Foo : NSObject
@property(nonatomic, readonly) NSString* foo;
@property(nonatomic, readonly) Bar* bar;
@end

