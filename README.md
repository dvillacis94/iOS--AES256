# iOS--AES256
This class is use to encrypt text using an AES-256, using a Random Generated Salt as the KEY.

Important things about the Keys: 
  1. A fixed password is not an AES key. Using it directly as an AES key opens you up to attacks.  
  2. A fixed password should be salted or stretched.
  3. Fist it should be salted, this means adding Random Data to it, this ensure that data encrypted with the same password will get different ciphertext.
  4. Second it should be hashed, so that the final result is the correct length.

Almost every algorithim can be broken, the real point is to force the attacker to waste some time, and make them give up.

Setting up the XCode Project:

1. Add the Security.framework to your proyect:
    * Go to General.
    * Scroll to Linked Frameworks & Libraries.
    * Select the + (Add Button).
    * Look up - Security.framework.
    * Set Status to Required (Value by Default).

2. Add #import "EncryptionManager.h" header file to your class.
3. Add `@property (strong, nonatomic) EncryptionManager* cypher`;

## Generating a Salt

1. Allocate & Init the EncryptionManager Object
  * `self.cypher = [[EncryptionManager alloc] init];`
2. This method returns a NSString with the generated SALT, using HEXADECIMAL Characters (0-9,a-f)
  * The LENGTH is up to you,
  * [self.cypher generateSaltWithLength:LENGTH];




