//
//  ViewController.m
//  ScreenShotDemo
//
//  Created by 祝国庆 on 2018/4/17.
//  Copyright © 2018年 qixinpuhui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)shotAction:(id)sender {
    [self screenShot:self.imageView withHeight:100];
}
#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height
/**
 *  手机截屏方法
 *  cutView 需要截图的视图
 *  height 截图高度
 */
- (UIImage *)screenShot:(UIView *)cutView withHeight:(CGFloat)height
{
    // 开启上下文,使用参数之后,截出来的是原图（YES  0.0 质量高）
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(KScreenWidth, height), YES, 0.0);
    // 将cutView的图层渲染到上下文中
    [cutView.layer renderInContext:UIGraphicsGetCurrentContext()];
    // 取出UIImage
    UIImage *cutImage = UIGraphicsGetImageFromCurrentImageContext();
    // 千万记得,结束上下文
    UIGraphicsEndImageContext();
    //存到本地========>>>>>添加私有权限访问
    UIImageWriteToSavedPhotosAlbum(cutImage, nil, nil, nil);
    [UIView animateWithDuration:0.3 animations:^{
        self.tipLabel.alpha = 1.0f;
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:2.0 animations:^{
            self.tipLabel.alpha = 0.0f;
        }completion:^(BOOL finished) {
        }];
    }];
    return cutImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
