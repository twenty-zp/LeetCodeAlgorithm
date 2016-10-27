//
//  ViewController.swift
//  LeetCode_TwoSum
//
//  Created by zp on 16/10/27.
//  Copyright © 2016年 ilogie. All rights reserved.
//

import UIKit
/// 取出整形数组中的两数之和是给出值得数组
class Solution {
    /**
     - parameter nums:   整数数组
     - parameter target: 目标和
     - returns: 返回一个数组
     */
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        //1.
        var hash: [Int: Int] = [:]
        //2.
        var result: [Int] = []
        
        for(i,n) in nums.enumerated() {
            //3.
            if let index = hash[target - n] {
                result.append(index)
                result.append(i)
            }
            //4.
            hash[n] = i
        }
        return result
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var numbers = [1,2,3,4,5]
        numbers.removeLast()
        let newArray = numbers
        print(newArray)
    }

}

