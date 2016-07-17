//
//  CustomCollectionViewController.m
//  Insta-Kilo
//
//  Created by Viviane Chan on 2016-07-16.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//

#import "CustomCollectionViewController.h"
#import "CustomCollectionViewCell.h"
#import "Photo.h"
#import "HeaderCollectionReusableView.h"

@interface CustomCollectionViewController ()



@property (nonatomic) NSDictionary *picturesBySubject;
@property (nonatomic) NSDictionary *picturesByLocation;
@property (nonatomic) NSDictionary *currentDict;

@property (nonatomic) NSArray *locationKeys;
@property (nonatomic) NSArray *subjectKeys;
@property (nonatomic) NSArray *currentKeys;
@property (nonatomic) Photo *photo;

@end

@implementation CustomCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Do any additional setup after loading the view.
    
#pragma Data Setup - add 10 pictures
    
    Photo *photo1 = [[Photo alloc]initWithImageName:@"Photo1" imageFileName:@"Pic1.jpg" subject:@"vacation" location:@"Toronto"];
    Photo *photo2 = [[Photo alloc]initWithImageName:@"Photo2" imageFileName:@"Pic2.jpg" subject:@"work" location:@"Vancouver"];
    Photo *photo3 = [[Photo alloc]initWithImageName:@"Photo3" imageFileName:@"Pic3.jpg" subject:@"holiday" location:@"Brussels"];
    Photo *photo4 = [[Photo alloc]initWithImageName:@"Photo4" imageFileName:@"Pic4.jpg" subject:@"vacation" location:@"Toronto"];
    Photo *photo5 = [[Photo alloc]initWithImageName:@"Photo5" imageFileName:@"Pic5.jpg" subject:@"vacation" location:@"Toronto"];
    Photo *photo6 = [[Photo alloc]initWithImageName:@"Photo6" imageFileName:@"Pic6.jpg" subject:@"vacation" location:@"Toronto"];
    Photo *photo7 = [[Photo alloc]initWithImageName:@"Photo7" imageFileName:@"Pic7.jpg" subject:@"work" location:@"Vancouver"];
    Photo *photo8 = [[Photo alloc]initWithImageName:@"Photo8" imageFileName:@"Pic8.jpg" subject:@"vacation" location:@"Toronto"];
    Photo *photo9 = [[Photo alloc]initWithImageName:@"Photo9" imageFileName:@"Pic9.jpg" subject:@"vacation" location:@"Brussels"];
    Photo *photo10 = [[Photo alloc]initWithImageName:@"Photo10" imageFileName:@"Pic10.jpg" subject:@"vacation" location:@"Toronto"];
    
    //    NSArray *allPictures  = @[photo1, photo2, photo3, photo4, photo5, photo6, photo7, photo8, photo9, photo10];
    //
    //
    //    NSMutableArray *vacationPictures = [[NSMutableArray alloc]init];
    //    NSMutableArray *workPictures = [[NSMutableArray alloc]init];
    //    NSMutableArray *holidayPictures = [[NSMutableArray alloc]init];
    //    NSMutableArray *torontoPictures = [[NSMutableArray alloc]init];
    //    NSMutableArray *vancouverPictures = [[NSMutableArray alloc]init];
    //    NSMutableArray *brusselsPictures = [[NSMutableArray alloc]init];
    //
    //
    //    for (Photo *picture in allPictures) {
    //
    //        if ([picture.subject  isEqual: @"vacation"]) {
    //            [vacationPictures addObject:picture];
    //        }
    //        if ([picture.subject  isEqual: @"work"]) {
    //            [workPictures addObject:picture];
    //        }
    //        if ([picture.subject  isEqual: @"holiday"]) {
    //            [holidayPictures addObject:picture];
    //        }
    //        if ([picture.location  isEqual: @"Toronto"]) {
    //            [torontoPictures addObject:picture];
    //        }
    //        if ([picture.location  isEqual: @"Vancouver"]) {
    //            [vancouverPictures addObject:picture];
    //        }
    //        if ([picture.location  isEqual: @"Brussels"]) {
    //            [brusselsPictures addObject:picture];
    //        }
    //    }
    
    
    //create Dictionaries
    
    self.picturesBySubject = @{@"Vacation": @[photo1, photo2, photo3],
                               @"Work": @[photo4, photo6, photo5],
                               @"Holiday": @[photo6, photo9, photo10]};
    
    self.picturesByLocation = @{@"Toronto": @[photo4, photo5, photo6],
                                @"Vancouver": @[photo3, photo2, photo1],
                                @"Brussels": @[photo6, photo7, photo8]};
    
    self.locationKeys = @[@"Toronto", @"Vancouver", @"Brussels"];
    self.subjectKeys = @[@"Vacation", @"Work", @"Holiday"];
    
    self.currentKeys = self.subjectKeys;
    self.currentDict = self.picturesBySubject;
    
    
    //checkpoint: dictionaries are ready
    NSLog(@"%@", self.picturesBySubject);
    NSLog(@"%@", self.picturesByLocation);
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark <UICollectionViewDataSource>

// inital set up: pictures  are grouped by sections

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.currentKeys.count; //update to location view
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSString *key = self.currentKeys[section];
    NSArray *objects = self.currentDict[key];
    return objects.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *key = self.currentKeys[indexPath.section];
    NSArray*objects = self.currentDict[key];
    Photo *photo = objects[indexPath.row];
    
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.imageView.image = [UIImage imageNamed:photo.imageFileName];
    
    return cell;
}




- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
        HeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        headerView.title.text = self.currentKeys[indexPath.section];
    return headerView;
}


- (IBAction)changeInterface:(id)sender {
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        self.currentKeys = self.subjectKeys;
        self.currentDict = self.picturesBySubject;
        [self.collectionView reloadData];
    } else if(self.segmentedControl.selectedSegmentIndex == 1) {
        self.currentKeys = self.locationKeys;
        self.currentDict = self.picturesByLocation;
        [self.collectionView reloadData];
    }

}

@end
