//
//  NSData+AES256.h
//  Test
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>

@interface NSData (AES256)
//Method to Encrypt
- (NSData*)encryptWithKey:(NSString *)key;
//Method to Decrypt
- (NSData*)decryptWithKey:(NSString *)key;

@end
