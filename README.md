# iOS--AES256
This class is use to encrypt text using an AES-256, using a Random Generated Salt as the KEY.

Important things about the Keys: 
  1. A fixed password is not an AES key. Using it directly as an AES key opens you up to attacks.  
  2. A fixed password should be salted or stretched.
  3. Fist it should be salted, this means adding Random Data to it, this ensure that data encrypted with the same password will get different ciphertext.
  4. Second it should be hashed, so that the final result is the correct length.

Almost every algorithim can be broken, the real point is to force the attacker to waste some time, and make them give up.

## Recommendation

* As soon as you generate the key store it, usually on a different DataBase that the user information, this will help you to protect your information, in case of an attack the hacker will not have whole information
* because this is random generated key, storing it will help you to decrypt your password later on.

## Setting up the XCode Project:

1. Add the Security.framework to your proyect:
    * Go to General.
    * Scroll to Linked Frameworks & Libraries.
    * Select the + (Add Button).
    * Look up - Security.framework.
    * Set Status to Required (Value by Default).

2. Add `#import "EncryptionManager.h"` header file of the Class that will make the Encryption.
3. Add `#import "NSData+AES256.h"` header file of the Class that will make the Encryption.

## Generating a Salt

1. Add a `@property (strong, nonatomic) EncryptionManager* cypher`;
2. Allocate & Init the EncryptionManager Object
  * `self.cypher = [[EncryptionManager alloc] init];`
2. This method returns a NSString with the generated SALT, using HEXADECIMAL Characters (0-9,a-f)
  * The LENGTH is up to you,
  * `[self.cypher generateSaltWithLength:LENGTH];`

## Using AES
  
  1. Because with the AES we're using Categories implementing this one is easier;
  2. On you Implementation File add the next Methods:
    
    `#pragma mark - Encrypt Data Method`
    
    `- (NSData*)encryptString:(NSString*)plainText withKey:(NSString*)key {` <br>
        `//Stores data obtain from the Plain Text`<br>
        `NSData* data = [plainText dataUsingEncoding:NSUTF8StringEncoding];`<br>
       `//Returns Encrypted Data`<br>
        `return [data encryptWithKey:key];`<br>
    `}`
    
    `#pragma mark - Decrypt Data Method`
    
    `- (NSString*)decryptData:(NSData*)cipherText withKey:(NSString*)key {`<br>
        `//Decrypted Data`<br>
        `NSData* decrypted = [cipherText decryptWithKey:key];`<br>
        `//Stores Plain Text obtained from Data`<br>
        `NSString* plainText = [[NSString alloc] initWithData:decrypted encoding:NSUTF8StringEncoding];`<br>
        `//Returns Decrypted Data`<br>
        `return plainText;`<br>
    `}`

  3. After this, to call the methods use the next notation:
    1. This method is in charge of encrypting a NSString, returns a NSData Object
      * `[self encryptString:plainText withKey:salt]`
    2. This method is in charge of decrypting a NSData, returns a NSString Object
      * `[self decryptData:encryptedData withKey:salt]`


