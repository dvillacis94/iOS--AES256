//
//  EncryptionManager.h
//  Test
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>

@interface EncryptionManager : NSObject

//Method to Generate Salt With Desire Length
- (NSString*)generateSaltWithLength:(NSInteger)length;

@end
