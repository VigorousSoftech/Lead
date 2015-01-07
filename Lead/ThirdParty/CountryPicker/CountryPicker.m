//
//  CountryPicker.m
//
//  Version 1.0.1
//
//  Created by Nick Lockwood on 25/04/2011.
//  Copyright 2011 Charcoal Design
//
//  Distributed under the permissive zlib License
//  Get the latest version from either of these locations:
//
//  http://charcoaldesign.co.uk/source/cocoa#countrypicker
//  https://github.com/nicklockwood/CountryPicker
//
//  This software is provided 'as-is', without any express or implied
//  warranty. In no event will the authors be held liable for any damages
//  arising from the use of this software.
//
//  The source code and data files in this project are the sole creation of
//  Charcoal Design and are free for use subject to the terms below. The flag
//  icons are the creation of FAMFAMFAM (http://www.famfamfam.com/lab/icons/flags/)
//  and are available for free use for any purpose with no requirement for attribution.
//
//  Permission is granted to anyone to use this software for any purpose,
//  including commercial applications, and to alter it and redistribute it
//  freely, subject to the following restrictions:
//
//  1. The origin of this software must not be misrepresented; you must not
//     claim that you wrote the original software. If you use this software
//     in a product, an acknowledgment in the product documentation would be
//     appreciated but is not required.
//
//  2. Altered source versions must be plainly marked as such, and must not be
//     misrepresented as being the original software.
//
//  3. This notice may not be removed or altered from any source distribution.
//

#import "CountryPicker.h"
#import "Constant.h"

@interface CountryPicker () <UIPickerViewDelegate, UIPickerViewDataSource>

@end


@implementation CountryPicker

@synthesize delegate;

+ (NSArray *)countryNames
{
    static NSArray *_countryNames = nil;
    if (!_countryNames)
    {
        _countryNames = [[[[self countryNamesByCode] allValues] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)] copy];
    }
    return _countryNames;
}

+ (NSArray *)countryCodes
{
    static NSArray *_countryCodes = nil;
    if (!_countryCodes)
    {
        _countryCodes = [[[self countryCodesByName] objectsForKeys:[self countryNames] notFoundMarker:@""] copy];
    }
    return _countryCodes;
}

+ (NSDictionary *)countryNamesByCode
{
    static NSDictionary *_countryNamesByCode = nil;
    if (!_countryNamesByCode)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Countries" ofType:@"plist"];
        _countryNamesByCode = [[NSDictionary alloc] initWithContentsOfFile:path];
    }
    return _countryNamesByCode;
}

+ (NSDictionary *)countryCodesByName
{
    static NSDictionary *_countryCodesByName = nil;
    if (!_countryCodesByName)
    {
        NSDictionary *countryNamesByCode = [self countryNamesByCode];
        NSMutableDictionary *codesByName = [NSMutableDictionary dictionary];
        for (NSString *code in countryNamesByCode)
        {
            codesByName[countryNamesByCode[code]] = code;
        }
        _countryCodesByName = [codesByName copy];
    }
    return _countryCodesByName;
}

- (void)setup
{
    [super setDataSource:self];
    [super setDelegate:self];
}

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]))
    {
        [self setup];
    }
     //   [self setBackgroundColor:[UIColor blackColor]];
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        [self setup];
    }
     //  [self setBackgroundColor:[UIColor blackColor]];
    return self;
}

- (void)setWithLocale:(NSLocale *)locale
{
    self.selectedCountryCode = [locale objectForKey:NSLocaleCountryCode];
}

- (void)setDataSource:(id<UIPickerViewDataSource>)dataSource
{
    //does nothing
}

- (void)setSelectedCountryCode:(NSString *)countryCode
{
    NSInteger index = [[CountryPicker countryCodes] indexOfObject:countryCode];
    if (index != NSNotFound)
    {
        [self selectRow:index inComponent:0 animated:NO];
    }
}

- (NSString *)selectedCountryCode
{
    NSInteger index = [self selectedRowInComponent:0];
    return [CountryPicker countryCodes][index];
}

- (void)setSelectedCountryName:(NSString *)countryName
{
    NSInteger index = [[CountryPicker countryNames] indexOfObject:countryName];
    if (index != NSNotFound)
    {
        [self selectRow:index inComponent:0 animated:NO];
    }
}

- (NSString *)selectedCountryName
{
    NSInteger index = [self selectedRowInComponent:0];
    return [CountryPicker countryNames][index];
}

#pragma mark -
#pragma UIPicker

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    if (isiPhone) {
        return 320;
    }else{
        UIInterfaceOrientation interfaceOrientation=[UIApplication sharedApplication].statusBarOrientation;
        
        if (UIInterfaceOrientationIsPortrait(interfaceOrientation)) {
             return 768;
        }else{
             return 1024;
        }
    }
   
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [[CountryPicker countryCodes] count];
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    if (isiPhone) {
        return 30;
    }else{
        return 50;
    }
}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    if (!view)
        
    {
        if (isiPhone) {
             view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 280, 30)];
          
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(35, 3, 245, 24)];
            label.backgroundColor = [UIColor clearColor];
            [view addSubview:label];
            
            UIImageView *flagView = [[UIImageView alloc] initWithFrame:CGRectMake(3, 3, 24, 24)];
            flagView.contentMode = UIViewContentModeScaleToFill;
            [view addSubview:flagView];
        }else{
            
             UIInterfaceOrientation interfaceOrientation=[UIApplication sharedApplication].statusBarOrientation;
            if (UIInterfaceOrientationIsPortrait(interfaceOrientation)) {
               view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 768, 50)];
            }else{
               view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1024, 50)];
            }
          
           // view.autoresizesSubviews=UIViewAutoresizingFlexibleLeftMargin;
              //view.backgroundColor = [UIColor blackColor];
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 5, view.frame.size.width-100, 40)];
            label.backgroundColor = [UIColor clearColor];
            [label setFont:[UIFont boldSystemFontOfSize:20]];
            label.autoresizesSubviews=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleLeftMargin;
            [view addSubview:label];
            
            UIImageView *flagView = [[UIImageView alloc] initWithFrame:CGRectMake(40, 5, 40, 40)];
            flagView.contentMode = UIViewContentModeScaleToFill;
             flagView.autoresizesSubviews=UIViewAutoresizingFlexibleLeftMargin;
            [view addSubview:flagView];
        }
       
        
       
        
#if !__has_feature(objc_arc)
        
        [label release];
        [flagView release];
        [view autorelease];
#endif
        
    }
    
    [(UILabel *)(view.subviews)[0] setText:[CountryPicker countryNames][row]];
    
    NSString *imagename=[CountryPicker countryCodes][row];
    NSRange range=[imagename rangeOfString:@"+"];
    NSString *newName=[imagename substringToIndex:range.location];
    //stringByAppendingPathExtension:@"png"
    newName=[newName stringByAppendingPathExtension:@"png"];
    [(UIImageView *)(view.subviews)[1] setImage:[UIImage imageNamed:newName]];
    
    
   // UIImage *flag = [UIImage imageNamed:[[isa countryCodes][row] stringByAppendingPathExtension:@"png"]];
    //[(UIImageView *)(view.subviews)[1] setImage:flag];
    
    return view;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [delegate countryPicker:self didSelectCountryWithName:self.selectedCountryName code:nil];
}

@end
