//
//  ViewController.m
//  YX_ValidateCodeCountdownBtn
//
//  Created by yang on 16/7/30.
//  Copyright © 2016年 poplary. All rights reserved.
//

#import "ViewController.h"
#import "Vaildcode.h"
@interface ViewController ()
{
    NSTimer *timer;
}
@property (weak, nonatomic) IBOutlet UIButton *ValidCodeBtn;
@property (nonatomic,strong)NSString *countdownStr;
@property (weak, nonatomic) IBOutlet UIButton *ValidCodeTwo;
@property (nonatomic, strong)Vaildcode *valid;

@end

@implementation ViewController
@synthesize countdownStr = _countdownStr;
@synthesize valid = _valid;
-(Vaildcode *)valid{
    if (_valid == nil) {
        _valid = [[Vaildcode alloc]init];
    }
    return  _valid;
}
-(NSString *)countdownStr{
    if (!_countdownStr) {
        _countdownStr = [NSString stringWithFormat:@"10"];
    }
    return _countdownStr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //[self.ValidCodeTwo setTitle:self.countdownStr forState:UIControlStateNormal];
}
-(void)countdown{
    
    [self.ValidCodeBtn setTitle:self.countdownStr forState:UIControlStateNormal];
    
    self.countdownStr = [NSString stringWithFormat:@"%d",[self.countdownStr integerValue]-1];
    
    if ([[self.ValidCodeBtn currentTitle] isEqualToString:@"0"]) {
        [timer invalidate];
        [self.ValidCodeBtn setTitle:@"点击重新获取" forState:UIControlStateNormal];
        self.countdownStr = @"10";
    }
    
}
- (IBAction)ValidCodePressBtn:(UIButton *)sender {
    
    timer  =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countdown) userInfo:nil repeats:YES];
    
}
- (IBAction)ValidcodePressTwo:(UIButton *)sender {
    
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(validcode2) userInfo:nil repeats:YES];
   
}
-(void)validcode2{

    [self.valid revice:self.countdownStr];
    NSString *str = [[NSString alloc]init];
    str = [self.valid foundtion];
    
    [self.ValidCodeTwo setTitle:str forState:UIControlStateNormal];
    self.countdownStr = str;
    
    if ([self.ValidCodeTwo.currentTitle isEqualToString:@"0"]) {
        
        [timer invalidate];
        [self.ValidCodeTwo setTitle:@"点击重新获取" forState:UIControlStateNormal];
        self.countdownStr = @"10";
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
