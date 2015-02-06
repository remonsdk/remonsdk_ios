//
//  RemonAdContentData.h
//  remon
//
//  Created by Rabbit on 2013. 11. 1..
//  Copyright (c) 2013년 DNA Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RemonAdContentData : NSObject

@property (nonatomic, strong) NSString *    resultCode;
@property (nonatomic, strong) NSString *    reason;

@property (nonatomic, assign) BOOL          isTextAd;
@property (nonatomic, assign) BOOL          isTelLink;
@property (nonatomic, strong) NSString *    title;
@property (nonatomic, strong) NSString *    detail;
/*
 * text 광고의 경우 Lading Type이 Tel(linkTel) or Url(linkURL)
 */


@property (nonatomic, strong) NSString *    imageURL;
@property (nonatomic, assign) CGSize        imageSize;
@property (nonatomic, strong) NSString *    expandImageURL;
@property (nonatomic, assign) CGSize        expandImageSize;
@property (nonatomic, strong) NSString *    linkURL;
@property (nonatomic, strong) NSString *    linkTel;
@property (nonatomic, strong) NSString *    bgColor;
/*
 * image 광고의 경우 Lading Type이 Url(linkURL)
 */

@end
