@import Foundation;
@import QuickLook;

#include "HTMLPreviewBuilder.h"

OSStatus GeneratePreviewForURL(void *thisInterface, QLPreviewRequestRef preview, CFURLRef url, CFStringRef contentTypeUTI, CFDictionaryRef options);
void CancelPreviewGeneration(void *thisInterface, QLPreviewRequestRef preview);

/* -----------------------------------------------------------------------------
   Generate a preview for file

   This function's job is to create preview for designated file
   ----------------------------------------------------------------------------- */

OSStatus GeneratePreviewForURL(void *thisInterface, QLPreviewRequestRef preview, CFURLRef url, CFStringRef contentTypeUTI, CFDictionaryRef options)
{
    @autoreleasepool {
        // Load file contents
        NSURL *nsurl = (__bridge NSURL *)url;
        NSData *data = [NSData dataWithContentsOfURL:nsurl];
        
        if (!data) {
            return ioErr;
        }
        
        // Aborted already?
        if (QLPreviewRequestIsCancelled(preview)) {
            return noErr;
        }
        
        // Build HTML preview
        HTMLPreviewBuilder *builder = [[HTMLPreviewBuilder alloc] init];
        NSString *html = [builder previewForNotebookData: data];
        
        NSBundle *bundle = [NSBundle bundleForClass:[HTMLPreviewBuilder class]];
        NSURL *jsFile = [bundle URLForResource:@"nbv" withExtension:@"js"];
        
        NSData *jsData = [NSData dataWithContentsOfURL:jsFile];
        if (!jsData) {
            return ioErr;
        }
        
        NSDictionary *properties = @{
                                     (__bridge NSString *)kQLPreviewPropertyTextEncodingNameKey : @"UTF-8",
                                     (__bridge NSString *)kQLPreviewPropertyMIMETypeKey : @"text/html",
                                     (__bridge NSString *)kQLPreviewPropertyAttachmentsKey : @{
                                             @"nbv.js" : @{
                                                     (__bridge NSString *)kQLPreviewPropertyMIMETypeKey : @"application/javascript",
                                                     (__bridge NSString *)kQLPreviewPropertyAttachmentDataKey: jsData,
                                                     },
                                             },
                                     };
        
        QLPreviewRequestSetDataRepresentation(preview,
                                              (__bridge CFDataRef)[html dataUsingEncoding:NSUTF8StringEncoding],
                                              kUTTypeHTML,
                                              (__bridge CFDictionaryRef)properties);
    }
    return noErr;
}

void CancelPreviewGeneration(void *thisInterface, QLPreviewRequestRef preview)
{
    // Implement only if supported
}
