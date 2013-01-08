#import <Foundation/Foundation.h>


@interface Vehicle : NSObject
@property(nonatomic, strong) NSString* registrationNumber;
@property(nonatomic, strong) NSString* vin;
@property(nonatomic,strong) NSString* model;
@property(nonatomic,strong) NSString*make;
@property(nonatomic, strong) NSArray* inspections;

- (id)initWithJson:(id)json;
@end