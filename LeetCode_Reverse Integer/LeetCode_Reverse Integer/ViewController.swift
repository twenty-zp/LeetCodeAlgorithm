//
//  ViewController.swift
//  LeetCode_Reverse Integer
//
//  Created by zp on 16/10/26.
//  Copyright © 2016年 ilogie. All rights reserved.
//

import UIKit



/// 反转一个整形
///Example1: x = 123, return 321
///Example2: x = -123, return -321


class Solution{
    /// 字符串法
    func reverse(x: Int) -> Int {
        var negative: Bool = false
        var m : Int = 0
        if x < 0 {
            m = x * -1
            negative = true
        }
        var xStr = String(m)
        let c: [Character] =  xStr.characters.reversed()
        let rStr = String(c)
        if negative {
            return   -Int(rStr)!
        }
            return Int(rStr)!;
    }
    
    /// 模十法
    func reverseMo10(x: Int) -> Int {
        var result = 0
        var tmp = abs(x)
        while tmp > 0 {
            
            result = result*10 + tmp%10
            tmp/=10
        }
        return x > 0 ? result : -result
    }
}



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let solution = Solution()
        
      print(solution.reverse(x: -123));
      print(solution.reverseMo10(x: -1234567890))
        
    }


}

