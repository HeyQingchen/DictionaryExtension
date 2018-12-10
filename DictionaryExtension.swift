//
//  DictionaryExtension.swift
//
//  Created by HeyQingchen on 15/9/1.
//

import Foundation

extension Dictionary {
  public func string(_ key: Any) -> String {
    let obj = self[key as! Key]

    if obj == nil {
      return ""
    }
    if obj is NSNull {
      return ""
    }
    if let obj = obj as? String {
      return obj
    }
    if let num = obj as? NSNumber {
      return num.stringValue
    }
    return ""
  }

  public func number(_ key: Any) -> NSNumber {
    let obj = self[key as! Key]

    if obj == nil {
      return NSNumber(value: 0)
    }
    if obj is NSNull {
      return NSNumber(value: 0)
    }
    if let obj = obj as? String {
      return NSNumber(value: NSString(string: obj).doubleValue)
    }
    if let num = obj as? NSNumber {
      return num
    }
    return NSNumber(value: 0)
  }

  public func int(_ key: Any) -> Int {
    return self.number(key).intValue
  }

  public func int64(_ key: Any) -> Int64 {
    return self.number(key).int64Value
  }

  public func double(_ key: Any) -> Double {
    return self.number(key).doubleValue
  }

  public func bool(_ key: Any) -> Bool {
    return self.number(key).boolValue
  }

  public func dictionary(_ key: Any) -> [String : Any] {
    if let obj = self[key as! Key] as? [String : Any] {
      return obj
    }
    return [:]
  }

  public func array(_ key: Any) -> [Any] {
    if let obj = self[key as! Key] as? [Any] {
      return obj
    }
    return [Any]()
  }
}
