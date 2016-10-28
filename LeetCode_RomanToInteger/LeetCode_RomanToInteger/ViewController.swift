//
//  ViewController.swift
//  LeetCode_RomanToInteger
//
//  Created by zp on 16/10/27.
//  Copyright © 2016年 ilogie. All rights reserved.
//

import UIKit
enum RomanType {
    case type(roman: Roman, value: Int)
}
enum Roman: String {
    case I, V, X, L, C, D, M
    
    func getRomanValue() -> Int {
        switch self {
        case .I:
            return 1
        case .V:
            return 5
        case .X:
            return 10
        case .L:
            return 50
        case .C:
            return 100
        case .D:
            return 500
        case .M:
            return 1000
        }
    }
    //判断是否这三种类型，如果左边为三种则减
    func isSubtract() -> Bool {
        switch self {
        case .I,.X,.C :
            return true
        default:
            return false
        }
    }
}
//根据索引获取字符串当前索引字符
extension String  {
    
    func characterAtIndex(index: Int) -> Character? {
        var cur = 0
        for char in self.characters {
            if cur == index {
                return char
            }
            cur += 1
        }
        return nil
    }
}
//罗马数 -> 整数
class Solution {
    static func romanToInt(s: String) -> Int {
        var intValue = 0
        if s.characters.count == 1 {
            return Roman(rawValue: s)!.getRomanValue()
        }
        let c_reversed = s.characters.reversed()
        for (index,c) in c_reversed.enumerated() {
            
            if (index+1) % 2  == 0 {
                continue
            }
            let roman_after = Roman(rawValue: String.init(c))
            if (index+1 == s.characters.count) {
                return roman_after!.getRomanValue()+intValue
            }
            if (index + 1) > String(c_reversed).characters.count { break}
            
            let c_curr = String(c_reversed).characterAtIndex(index: index+1)!
            let roman =  Roman(rawValue: String.init(c_curr))
        
            if ((roman_after!.getRomanValue() > roman!.getRomanValue()) &&  roman!.isSubtract())
            {
                    intValue =  intValue + roman_after!.getRomanValue() - roman!.getRomanValue()
            }else
            {
                    intValue =  intValue + roman_after!.getRomanValue() + roman!.getRomanValue()
            }
           
        }
        return intValue
    }
}

class Solution1 {
    
        var romanDic: [String: Int] = ["I": 1,
                                       "V": 5,
                                       "X": 10,
                                       "L": 50,
                                       "C": 100,
                                       "D": 500,
                                       "M": 1000]
        func romanToInt(s: String) -> Int {
            if s.characters.count == 1 {
                return romanDic[s] == nil ? romanDic[s]! : 0
        }
        //1.反转字符为字符数组(目的: 使罗马数从右向左依次计算)
        let c_reversed = s.characters.reversed()
        var intValue = 0

        for (index,c) in c_reversed.enumerated() {
            if (index+1) % 2  == 0 {
                continue
            }
            let c_after_value = romanDic[String(c)]!
            
            if (index+1) == s.characters.count{
                return c_after_value + intValue
            }
            let c_curr = String(c_reversed).characterAtIndex(index: index+1)!
            let c_curr_value = romanDic[String(c_curr)]!
            if (c_after_value > c_curr_value) && (c_curr_value == 1 || c_curr_value == 10 || c_curr_value == 100){
            intValue = intValue + c_after_value - c_curr_value
            }else
            {
            intValue = intValue + c_after_value + c_curr_value
            }
        }
            return intValue
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        print(Solution.romanToInt(s: "I"))
        print(Solution.romanToInt(s: "II"))
        print(Solution.romanToInt(s: "III"))
        print(Solution.romanToInt(s: "IV"))
        print(Solution.romanToInt(s: "V"))
        print(Solution.romanToInt(s: "VI"))
        print(Solution.romanToInt(s: "VII"))
        print(Solution.romanToInt(s: "VIII"))
        print(Solution.romanToInt(s: "IX"))
        print(Solution.romanToInt(s: "X"))
        print("")
        
        print(Solution.romanToInt(s: "XL"))
        print(Solution.romanToInt(s: "LXXXIX"))
        print(Solution.romanToInt(s: "XCIV"))
        print(Solution.romanToInt(s: "XCVIII"))
        print("")
        
        print(Solution.romanToInt(s: "XIV"))
        print(Solution.romanToInt(s: "DCXIV"))
        print("")
        
        print(Solution1().romanToInt(s: "DCXIV"))
        print(Solution1().romanToInt(s: "XIV"))
        
    }

}

