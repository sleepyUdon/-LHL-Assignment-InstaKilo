//
//  Photo.h
//  Insta-Kilo
//
//  Created by Viviane Chan on 2016-07-16.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject

@property NSString *imageName;
@property NSString * imageFileName;
@property NSString *subject;
@property NSString *location;


-(instancetype)initWithImageName: (NSString*)imageName
                   imageFileName:(NSString*)imageFileName
                        subject:(NSString*)subject
                        location:(NSString*)location;


@end
