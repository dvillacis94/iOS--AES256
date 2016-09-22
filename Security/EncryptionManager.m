//
//  EncryptionManager.m
//  Test
//

#import "EncryptionManager.h"

@implementation EncryptionManager

//Method to Generate Salt With Desire Length
- (NSString*)generateSaltWithLength:(NSInteger)length{
    //Stores the Salt
    NSString* salt;
    //Char Array - HEX Representations
    static char const possibleChars[] = "abcdef0123456789";
    unichar characters[length];
    //Iterates until desired length
    for(int i = 0; i<length; i++){
        //Assign Char
        characters[i] = possibleChars[arc4random_uniform(sizeof(possibleChars)-1)];
    }
    //Assign the NSString
    salt = [NSString stringWithCharacters:characters length:length];
    //Return
    return salt;
}

@end
