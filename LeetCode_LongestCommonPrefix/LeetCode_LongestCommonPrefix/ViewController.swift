//
//  ViewController.swift
//  LeetCode_LongestCommonPrefix
//
//  Created by zp on 16/10/28.
//  Copyright © 2016年 ilogie. All rights reserved.
//

import UIKit

/// 1.了解到如果有相同的前缀,那么肯定首字母相同
/// 2.如果没有相同的前缀，那么不管如何都是返回为空字符串("")
struct LongestCommonPrefix {
   static func Solution(sArrs: [String]) -> String {
        //判读数组
        if sArrs.isEmpty {
            return ""
        }
        if sArrs.count == 1 {
            return sArrs.first!
        }
        let strArrs = sArrs.sorted()
        let firstStr = strArrs.first!
        let endStr = strArrs.last!
        var i = 0
        let length = min(firstStr.characters.count, endStr.characters.count)
    
        while i < length && firstStr[(firstStr.index(firstStr.startIndex, offsetBy: i))] == endStr[endStr.index(endStr.startIndex, offsetBy: i)]
        {
            i+=1
        }
        return firstStr.substring(to: firstStr.index(firstStr.startIndex, offsetBy: i))
    }
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let strArrs = ["abc","abcd","abcde","bac"]

        print(LongestCommonPrefix.Solution(sArrs: strArrs))
        
    }


}

