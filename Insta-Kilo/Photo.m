//
//  Photo.m
//  Insta-Kilo
//
//  Created by Viviane Chan on 2016-07-16.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//

#import "Photo.h"

@implementation Photo

-(instancetype)initWithImageName: (NSString*)imageName
                   imageFileName:(NSString*)imageFileName
                        subject:(NSString*)subject
                        location:(NSString*)location{
{
    self = [super init];
    if (self) {
        _imageName = imageName;
        _imageFileName = imageFileName;
        _subject = subject;
        _location = location;
    }
    return self;
    }
}
@end
