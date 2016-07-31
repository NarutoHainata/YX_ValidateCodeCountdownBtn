//
//  Vaildcode.m
//  YX_ValidateCodeCountdownBtn
//
//  Created by yang on 16/7/30.
//  Copyright © 2016年 poplary. All rights reserved.
//

#import "Vaildcode.h"
@interface Vaildcode()
@property (nonatomic, strong) NSMutableArray *nsmutablearr;
@end
@implementation Vaildcode

@synthesize nsmutablearr = _nsmutablearr;
- (NSMutableArray *)nsmutablearr{
    if (_nsmutablearr == nil) {
        _nsmutablearr = [[NSMutableArray alloc]init];
    }
    return  _nsmutablearr;
}
-(void)setNsmutablearr:(NSMutableArray *)nsmutablearr{
    _nsmutablearr = nsmutablearr;
}

-(void)countdownTwo{
   
}
-(NSString *)foundtion{
    
    NSString *result = [[NSString alloc]init];
    
     result =   [self.nsmutablearr lastObject];
    [self.nsmutablearr removeLastObject];
    return result;
}
-(void)revice:(NSString *)revice{
    
    NSString *str = [NSString stringWithFormat:@"%d",[revice integerValue]-1];
    [self.nsmutablearr addObject:str];
}
@end
