//
//  FirstViewController.m
//  TCRoundedCornerExample
//
//  Created by Travel Chu on 15/12/21.
//  Copyright © 2015年 TravelChu. All rights reserved.
//

#import "FirstViewController.h"
#import "UIView+TCRoundedCorner.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UILabel *myView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segView;
@property (weak, nonatomic) IBOutlet UISwitch *borderSwitch;
@property (weak, nonatomic) IBOutlet UISlider *borderWidthSlider;
@property (weak, nonatomic) IBOutlet UISegmentedControl *colorSegView;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self changeCorner:_segView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeCorner:(UISegmentedControl *)sender {
    TCRoundedCornerType type;
    switch (sender.selectedSegmentIndex) {
        case 0:
        {
            type = TCRoundedCornerTypeTop;
        }
            break;
        case 1:
        {
            type = TCRoundedCornerTypeBottom;
        }
            break;
        case 2:
        {
            type = TCRoundedCornerTypeLeft;
        }
            break;
        case 3:
        {
            type = TCRoundedCornerTypeRight;
        }
            break;
        case 4:
        {
            type = TCRoundedCornerTypeTopLeft;
        }
            break;
        case 5:
        {
            type = TCRoundedCornerTypeTopRight;
        }
            break;
        case 6:
        {
            type = TCRoundedCornerTypeBottomLeft;
        }
            break;
        case 7:
        {
            type = TCRoundedCornerTypeBottomRight;
        }
            break;
        case 8:
        {
            type = TCRoundedCornerTypeAllCorners;
        }
            break;
        default:
        {
            type = TCRoundedCornerTypeAllCorners;
        }
            break;
    }
    UIColor *borderColor = [UIColor lightGrayColor];
    if (_colorSegView.selectedSegmentIndex == 0) {
        borderColor = [UIColor greenColor];
    }else if (_colorSegView.selectedSegmentIndex == 1) {
        borderColor = [UIColor grayColor];
    }else if (_colorSegView.selectedSegmentIndex == 2) {
        borderColor = [UIColor redColor];
    }
    if (_borderSwitch.isOn) {
        [self.myView roundedCorner:type radius:20.0 borderColor:borderColor borderWidth:_borderWidthSlider.value];
    }else{
        [self.myView roundedCorner:type radius:20.0];
    }
}
- (IBAction)addBorderChanged:(id)sender {
    [self changeCorner:_segView];
    if (!_borderSwitch.isOn) {
        [self.myView removeBorder];
    }
}

- (IBAction)widthSliderValueChanged:(id)sender {
    [self changeCorner:_segView];
}
- (IBAction)colorChanged:(id)sender {
    [self changeCorner:_segView];
}

@end
