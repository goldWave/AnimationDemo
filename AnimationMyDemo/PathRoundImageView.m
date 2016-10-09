//
//  PathRoundImageView.m
//  AnimationMyDemo
//
//  Created by renjinbo on 16/10/9.
//  Copyright © 2016年 com.coffee.biggerapple.zxp. All rights reserved.
//

#import "PathRoundImageView.h"

@interface PathRoundImageView ()

@end


@implementation PathRoundImageView

- (id)initWithImage:(UIImage *)image
   highlightedImage:(UIImage *)highlightedImage
    backgroundImage:(UIImage *)backgroundImage
backgroundHighlightedImage:(UIImage *)backgroundHighlightedImage {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.image = image;
    self.highlightedImage = highlightedImage;
    self.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    self.userInteractionEnabled = YES;
    return self;
}


@end
