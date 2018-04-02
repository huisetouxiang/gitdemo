//
//  ViewController.m
//  DemoGCD
//
//  Created by 谢意强 on 2018/2/1.
//  Copyright © 2018年 谢意强. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(UICollectionView  *)collectionView
{
    if(!_collectionView)
    {
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:nil];
    }
    return _collectionView;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
