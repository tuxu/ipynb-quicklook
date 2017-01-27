//
//  HTMLPreviewBuilder.m
//  ipynb-quicklook
//
//  Created by Tino Wagner on 27.01.17.
//  Copyright © 2017 Tino Wagner. All rights reserved.
//

#import "HTMLPreviewBuilder.h"

@implementation HTMLPreviewBuilder

- (NSString *)previewForNotebookData: (NSData*) data {
    NSError *error;
    
    NSBundle *bundle = [NSBundle bundleForClass:[HTMLPreviewBuilder class]];
    NSURL *templateFile = [bundle URLForResource:@"template" withExtension:@"html"];
    NSString *template = [[NSString alloc] initWithContentsOfURL:templateFile
                                                        encoding:NSUTF8StringEncoding
                                                           error:&error];
    if (template == nil) {
        return @"Error loading template";
    }
    
    // Make sure we have valid JSON data
    id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    if (json == nil) {
        return @"Invalid JSON data";
    }
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:json options:0 error:&error];
    NSString* jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    NSMutableString *html = [[NSMutableString alloc] initWithString:template];
    [html replaceOccurrencesOfString:@"%notebook-json%"
                          withString:jsonString
                             options:NSLiteralSearch
                               range:NSMakeRange(0, html.length)];
    return html;
}

@end
