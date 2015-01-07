//  AsyncImageView.m
//  ScopeProject
//  Created by YOSHIDA Hiroyuki on 09/11/26.
//  Copyright 2009 __MyCompanyName__. All rights reserved.

#import "AsyncImageView.h"
#import "AppDelegate.h"
NSMutableDictionary * dictionary;
@implementation AsyncImageView

-(void)loadImage:(NSString *)url
{
    [self setBackgroundColor:[UIColor clearColor]];
    // [self setShowsTouchWhenHighlighted:YES];
    
	if( nil==arrayForURL)
    {
		arrayForURL =[[NSMutableArray alloc] initWithObjects:nil];
	}
	delegate=(AppDelegate*)[[UIApplication sharedApplication] delegate];
    if (url!=nil)
    {
		if([delegate.dictionaryForImageCacheing objectForKey:url])
        {
            UIImage *image=[UIImage imageWithData:[delegate.dictionaryForImageCacheing valueForKey:url]];
            [self setimage:image];
        }else
        {
			//ProgressBar
			progressView = [[UIProgressView alloc] initWithProgressViewStyle: UIProgressViewStyleDefault];
			progressView.frame = CGRectMake(self.bounds.size.width/10,self.bounds.size.height/2-10,self.bounds.size.width*2/3,20);//30,130,200,20
			progressView.progress = 0.00;
			//ProgressBar
			[arrayForURL addObject:url];
			if (connection !=nil)
            {
				connection =nil;
			}
			imageData = [[NSMutableData alloc] initWithCapacity:0];
            [NSThread detachNewThreadSelector:@selector(loadimagedata:) toTarget:self withObject:url];
		}
	}
}
-(void) loadimagedata:(NSString *)sender
{
    UIActivityIndicatorView *indicator=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    
    indicator.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    if (self.tag!=999)
    {
        
        [self addSubview:indicator];
        [indicator startAnimating];
    }
    if (![sender isKindOfClass:[NSNull class]])
    {
        NSData *tempImageData=[NSData dataWithContentsOfURL:[NSURL URLWithString:sender]];
        if (tempImageData!=nil)
        {
            
            UIImage *image=[UIImage imageWithData:tempImageData];
            [self setimage:image];
            [delegate.dictionaryForImageCacheing setObject:tempImageData forKey:sender] ;
        }

    }
     
    
    [indicator stopAnimating];
    [indicator removeFromSuperview];
}


-(void) setimage:(UIImage*)image
{
    CGFloat ratioWidth = self.imageView.bounds.size.width/image.size.width;
    CGFloat ratioHeight = self.imageView.bounds.size.height/image.size.height;
    if (ratioHeight>ratioWidth)
    {
        [self.imageView setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y,  image.size.width*ratioHeight, self.imageView.frame.size.height)];
    }else
    {
//        [self.imageView setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y,  image.size.width, self.imageView.frame.size.height*ratioHeight)];
    }
    [self.imageView setCenter:CGPointMake(CGRectGetWidth(self.bounds)/2, CGRectGetHeight(self.bounds)/2)];
    [self.imageView setContentMode:UIViewContentModeScaleAspectFill];
    [self setBackgroundImage:image forState:UIControlStateNormal];
    
}


@end
