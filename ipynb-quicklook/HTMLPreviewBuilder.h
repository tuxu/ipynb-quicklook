//
//  HTMLPreviewBuilder.h
//  ipynb-quicklook
//
//  Created by Tino Wagner on 27.01.17.
//  Copyright © 2017 Tino Wagner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTMLPreviewBuilder : NSObject

- (NSString *)previewForNotebookData: (NSData*) data;

@end
