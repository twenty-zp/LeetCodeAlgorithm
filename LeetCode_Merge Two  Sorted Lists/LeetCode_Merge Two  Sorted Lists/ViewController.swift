//
//  ViewController.swift
//  LeetCode_Merge Two  Sorted Lists
//
//  Created by zp on 16/11/2.
//  Copyright © 2016年 ilogie. All rights reserved.
//

import UIKit

class ListNode {
    var node: Int
    var nextNode: ListNode?
    init(node: Int) {
        self.node = node
    }
}
class Solution {
    
    
    //输出链表
    func showList(head: ListNode)  {
        var printStr: String =  ""
        var first = head.nextNode
        while (first != nil) {
            if  first!.nextNode != nil {
                printStr =   printStr.appending("\(first!.node)->")
            }else
            {
                printStr =   printStr.appending("\(first!.node)")
            }
            first =  first!.nextNode
            
        }
        let firstStr = String(head.node)
        guard  printStr != "" else {
            print(firstStr)
            return
        }
        printStr = firstStr.appending("->\(printStr)")
        print(printStr)
    }

    //整合链表
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        //1.通过判断节点上的值
        if l1!.node > l2!.node {
            
            //2. 获取到新链表的头部
            let  temp = l2
            //3. 循环得到节点的下一个节点
            temp!.nextNode =  mergeTwoLists(l1, temp!.nextNode)
            return temp
        }else
        {
            //2. 获取到新链表的头部
            let temp = l1
            //3. 循环得到节点的下一个节点
            temp!.nextNode =  mergeTwoLists(temp!.nextNode , l2)
            return temp
        }
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let firstNode = ListNode(node:1)
        let secondNode = ListNode(node: 2)
        firstNode.nextNode = secondNode
        let thirdNode = ListNode(node: 3)
        secondNode.nextNode = thirdNode
        let fourNode = ListNode(node: 4)
        thirdNode.nextNode = fourNode
        let fiveNode = ListNode(node: 5)
        fourNode.nextNode = fiveNode
        
        
        
        let firstNode1 = ListNode(node:3)
        let secondNode1 = ListNode(node: 4)
        firstNode1.nextNode = secondNode1
        let thirdNode1 = ListNode(node: 6)
        secondNode1.nextNode = thirdNode1
        let fourNode1 = ListNode(node: 7)
        thirdNode1.nextNode = fourNode1
        let fiveNode1 = ListNode(node: 8)
        fourNode1.nextNode = fiveNode1
        
        let s = Solution()
        s.showList(head: firstNode)
        s.showList(head: firstNode1)
        s.showList(head: s.mergeTwoLists(firstNode, firstNode1)!)
        
    }

}

