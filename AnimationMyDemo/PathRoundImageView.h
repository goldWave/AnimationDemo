//
//  PathRoundImageView.h
//  AnimationMyDemo
//
//  Created by renjinbo on 16/10/9.
//  Copyright © 2016年 com.coffee.biggerapple.zxp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PathRoundImageView : UIImageView
- (id)initWithImage:(UIImage *)image
   highlightedImage:(UIImage *)highlightedImage
    backgroundImage:(UIImage *)backgroundImage
backgroundHighlightedImage:(UIImage *)backgroundHighlightedImage;

@end
