//
//  Constant.h
//  Lead
//
//  Created by Admin on 22/12/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#ifndef Lead_Constant_h
#define Lead_Constant_h

// IPHONE SCREEN WIDTH AND HEIGHT BOUND CONDITION
#define IS_IPHONE_4_OR_5_WIDTH (fabs((double)[[UIScreen mainScreen]bounds].size.width-(double)320) < DBL_EPSILON)
#define IS_IPHONE_4_HEIGHT (fabs((double)[[UIScreen mainScreen]bounds].size.height-(double)480) < DBL_EPSILON)
#define IS_IPHONE_5_HEIGHT (fabs((double)[[UIScreen mainScreen]bounds].size.height-(double)568) < DBL_EPSILON)
#define IS_IPHONE_6_WIDTH (fabs((double)[[UIScreen mainScreen]bounds].size.width-(double)375) < DBL_EPSILON)
#define IS_IPHONE_6_HEIGHT (fabs((double)[[UIScreen mainScreen]bounds].size.height-(double)667) < DBL_EPSILON)
#define IS_IPHONE_6_PLUS_WIDTH (fabs((double)[[UIScreen mainScreen]bounds].size.width-(double)414) < DBL_EPSILON)
#define IS_IPHONE_6_PLUS_HEIGHT (fabs((double)[[UIScreen mainScreen]bounds].size.height-(double)736) < DBL_EPSILON)
#define isiPhone (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone)

// IOS version check
#define IS_OS_7 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) && ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0))
#define IS_OS_7_OR_LATER (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0))
#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

// IPHONE SCREEN WIDTH AND HEIGHT
#define SCREEN_SIZE self.view.frame.size
#define SCREEN_ORIGIN self.view.frame.origin

#define SCREEN_X [UIApplication sharedApplication].keyWindow.frame.origin.x
#define SCREEN_Y [UIApplication sharedApplication].keyWindow.frame.origin.y
#define SCREEN_WIDTH [UIApplication sharedApplication].keyWindow.frame.size.width
#define SCREEN_HEIGHT [UIApplication sharedApplication].keyWindow.frame.size.height

#define RATIO_WIDTH_4 0.85
#define RATIO_HEIGHT_4 0.72
#define RATIO_5 0.85
#define RATIO_6 1.0
#define RATIO_6_PLUS 1.10

//Normal Text
#define textFontTrebuchetMS26 [UIFont fontWithName:@"TrebuchetMS" size:26.0]
#define textFontTrebuchetMS25 [UIFont fontWithName:@"TrebuchetMS" size:25.0]
#define textFontTrebuchetMS24 [UIFont fontWithName:@"TrebuchetMS" size:24.0]
#define textFontTrebuchetMS23 [UIFont fontWithName:@"TrebuchetMS" size:23.0]
#define textFontTrebuchetMS22 [UIFont fontWithName:@"TrebuchetMS" size:22.0]
#define textFontTrebuchetMS21 [UIFont fontWithName:@"TrebuchetMS" size:21.0]
#define textFontTrebuchetMS20 [UIFont fontWithName:@"TrebuchetMS" size:20.0]
#define textFontTrebuchetMS19 [UIFont fontWithName:@"TrebuchetMS" size:19.0]
#define textFontTrebuchetMS18 [UIFont fontWithName:@"TrebuchetMS" size:18.0]
#define textFontTrebuchetMS17 [UIFont fontWithName:@"TrebuchetMS" size:17.0]
#define textFontTrebuchetMS16 [UIFont fontWithName:@"TrebuchetMS" size:16.0]
#define textFontTrebuchetMS15 [UIFont fontWithName:@"TrebuchetMS" size:15.0]
#define textFontTrebuchetMS14 [UIFont fontWithName:@"TrebuchetMS" size:14.0]
#define textFontTrebuchetMS13 [UIFont fontWithName:@"TrebuchetMS" size:13.0]
#define textFontTrebuchetMS12 [UIFont fontWithName:@"TrebuchetMS" size:12.0]
#define textFontTrebuchetMS11 [UIFont fontWithName:@"TrebuchetMS" size:11.0]
#define textFontTrebuchetMS10 [UIFont fontWithName:@"TrebuchetMS" size:10.0]
#define textFontTrebuchetMS9 [UIFont fontWithName:@"TrebuchetMS" size:9.0]
#define textFontTrebuchetMS8 [UIFont fontWithName:@"TrebuchetMS" size:8.0]

// Bold
#define textFontTrebuchetMSBold26 [UIFont fontWithName:@"TrebuchetMS-Bold" size:26.0]
#define textFontTrebuchetMSBold25 [UIFont fontWithName:@"TrebuchetMS-Bold" size:25.0]
#define textFontTrebuchetMSBold24 [UIFont fontWithName:@"TrebuchetMS-Bold" size:24.0]
#define textFontTrebuchetMSBold23 [UIFont fontWithName:@"TrebuchetMS-Bold" size:23.0]
#define textFontTrebuchetMSBold22 [UIFont fontWithName:@"TrebuchetMS-Bold" size:22.0]
#define textFontTrebuchetMSBold21 [UIFont fontWithName:@"TrebuchetMS-Bold" size:21.0]
#define textFontTrebuchetMSBold20 [UIFont fontWithName:@"TrebuchetMS-Bold" size:20.0]
#define textFontTrebuchetMSBold19 [UIFont fontWithName:@"TrebuchetMS-Bold" size:19.0]
#define textFontTrebuchetMSBold18 [UIFont fontWithName:@"TrebuchetMS-Bold" size:18.0]
#define textFontTrebuchetMSBold17 [UIFont fontWithName:@"TrebuchetMS-Bold" size:17.0]
#define textFontTrebuchetMSBold16 [UIFont fontWithName:@"TrebuchetMS-Bold" size:16.0]
#define textFontTrebuchetMSBold15 [UIFont fontWithName:@"TrebuchetMS-Bold" size:15.0]
#define textFontTrebuchetMSBold14 [UIFont fontWithName:@"TrebuchetMS-Bold" size:14.0]
#define textFontTrebuchetMSBold13 [UIFont fontWithName:@"TrebuchetMS-Bold" size:13.0]
#define textFontTrebuchetMSBold12 [UIFont fontWithName:@"TrebuchetMS-Bold" size:12.0]
#define textFontTrebuchetMSBold11 [UIFont fontWithName:@"TrebuchetMS-Bold" size:11.0]
#define textFontTrebuchetMSBold10 [UIFont fontWithName:@"TrebuchetMS-Bold" size:10.0]
#define textFontTrebuchetMSBold9 [UIFont fontWithName:@"TrebuchetMS-Bold" size:9.0]
#define textFontTrebuchetMSBold8 [UIFont fontWithName:@"TrebuchetMS-Bold" size:8.0]

//TrebuchetMS-Italic
#define textFontTrebuchetMSItalic24 [UIFont fontWithName:@"TrebuchetMS-Italic" size:24.0]
#define textFontTrebuchetMSItalic23 [UIFont fontWithName:@"TrebuchetMS-Italic" size:23.0]
#define textFontTrebuchetMSItalic22 [UIFont fontWithName:@"TrebuchetMS-Italic" size:22.0]
#define textFontTrebuchetMSItalic21 [UIFont fontWithName:@"TrebuchetMS-Italic" size:21.0]
#define textFontTrebuchetMSItalic20 [UIFont fontWithName:@"TrebuchetMS-Italic" size:20.0]
#define textFontTrebuchetMSItalic19 [UIFont fontWithName:@"TrebuchetMS-Italic" size:19.0]
#define textFontTrebuchetMSItalic18 [UIFont fontWithName:@"TrebuchetMS-Italic" size:18.0]
#define textFontTrebuchetMSItalic17 [UIFont fontWithName:@"TrebuchetMS-Italic" size:17.0]
#define textFontTrebuchetMSItalic16 [UIFont fontWithName:@"TrebuchetMS-Italic" size:16.0]
#define textFontTrebuchetMSItalic15 [UIFont fontWithName:@"TrebuchetMS-Italic" size:15.0]
#define textFontTrebuchetMSItalic14 [UIFont fontWithName:@"TrebuchetMS-Italic" size:14.0]
#define textFontTrebuchetMSItalic13 [UIFont fontWithName:@"TrebuchetMS-Italic" size:13.0]
#define textFontTrebuchetMSItalic12 [UIFont fontWithName:@"TrebuchetMS-Italic" size:12.0]
#define textFontTrebuchetMSItalic11 [UIFont fontWithName:@"TrebuchetMS-Italic" size:11.0]
#define textFontTrebuchetMSItalic10 [UIFont fontWithName:@"TrebuchetMS-Italic" size:10.0]
#define textFontTrebuchetMSItalic9 [UIFont fontWithName:@"TrebuchetMS-Italic" size:9.0]
#define textFontTrebuchetMSItalic8 [UIFont fontWithName:@"TrebuchetMS-Italic" size:8.0]

// Colors
#define colorClear [UIColor clearColor]
#define colorWhite [UIColor whiteColor]
#define colorBlack [UIColor blackColor]
#define colorRed [UIColor redColor]
#define colorGray [UIColor grayColor]
#define colorDarkGray [UIColor darkGrayColor]
#define colorLightGray [UIColor lightGrayColor]

// Image used
#define imageViewBackground [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]]
#define imageNavBackground [UIImage imageNamed:@"navigation-background.png"]
#define imageNavBackButton [UIImage imageNamed:@"btn_nav_back.png"]

// SERVER URL
#define SERVERBASEURL @"http://enigmatic-stream-7448.herokuapp.com/"



//------------ Alert Title and Messages----------//
#define ALERTTITLEMESSAGE @"Message"
#define ALERTTITLEERROR @"Error"

#define ALERTMSG_INTERNETNOTAVAILABEL @"Internet connection is not available."
#define ALERTMSG_SERVERORNETWORKERROR @"Have some server error.\nOR\nInternet connection is slow."
#define ALERTMSG_FAILEDLOCATION @"Failed to Get Your Location"
#define ALERTMSG_DEVICENOTSUPPORT @"Your device doesn't support this feature."
#define ALERTMSG_VALIDEMAIL @"Please enter valid email.\n"
#define ALERTMSG_ENTERPASSWORD @"Please enter valid password."

#endif
