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
    NSMutableString *html = [[NSMutableString alloc] init];
    [html appendFormat: @"<!DOCTYPE html>"
                         "<html><head>"
                         "<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/prism/1.5.1/themes/prism.min.css'/>"
                         "<script src='https://cdnjs.cloudflare.com/ajax/libs/marked/0.3.6/marked.min.js'></script>"
                         "<script src='https://cdnjs.cloudflare.com/ajax/libs/prism/1.5.1/prism.min.js' data-manual></script>"
                         "<script src='https://cdnjs.cloudflare.com/ajax/libs/prism/1.5.1/components/prism-python.min.js' data-manual></script>"
                         "<script src='cid:nbv.js'></script>"
                         "<style type='text/css'>"
                         "body {"
                         "    font: 0.8em Arial, sans-serif;"
                         "    background-color: #eee;"
                         "}"
                         "</style>"
                         "<title></title></head>"];
    [html appendFormat: @"<body>"];
    [html appendFormat: @"<div id='doc'></div>"];
    [html appendFormat: @"<script type='application/javascript'>"
                         "var doc = document.getElementById('doc');"
                         "var nb = " ];
    NSString* jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    [html appendString: jsonString];
    [html appendFormat: @"; nbv.render(nb, doc);"
                         "</script>"];
    [html appendFormat: @"</body></html>"];
    return html;
}

@end
