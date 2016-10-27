//
//  ViewController.swift
//  LeetCode_PalindromeNumber
//
//  Created by zp on 16/10/27.
//  Copyright © 2016年 ilogie. All rights reserved.
//

import UIKit

/// 回文数
class Solution {
    func isPalindrome(x: Int) -> Bool {
        if (x<0  || (x != 0 && x % 10 == 0)) {return false}  //判断小0,并且尾数为0的数
        var tmpX = x
        var result = 0
        while tmpX > 0 {
            result = tmpX % 10 + result * 10
            tmpX = tmpX / 10
        }
        return result == x
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let solution = Solution()
        
        print(solution.isPalindrome(x: 123210))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

