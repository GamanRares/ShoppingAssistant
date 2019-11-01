//
//  User.swift
//  ShoppingAssistant
//
//  Created by Gaman Rares-Constantin on 10/9/19.
//  Copyright © 2019 Gaman Rares-Constantin. All rights reserved.
//

import Foundation
import CommonCrypto

class Utils {
    
    func sha256(stringToEncrypt str:String) -> String {
        if let strData = str.data(using: String.Encoding.utf8) {
            var digest = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
            
            strData.withUnsafeBytes {
                CC_SHA256($0.baseAddress,UInt32(strData.count), &digest)
            }
            
            var sha256String = ""
            
            for byte in digest {
                sha256String += String(format: "%02x", UInt8(byte))
            }
            
            return sha256String
        }
        
        return ""
        
    }

}
