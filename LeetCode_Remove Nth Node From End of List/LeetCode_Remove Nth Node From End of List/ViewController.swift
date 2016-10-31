//
//  ViewController.swift
//  LeetCode_Remove Nth Node From End of List
//
//  Created by zp on 16/10/31.
//  Copyright © 2016年 ilogie. All rights reserved.
//

import UIKit



class ListNode:Equatable {
    var node: Int
    var nextNode: ListNode?
    init(node: Int) {
        self.node = node
    }
    public static func ==(lhs: ListNode, rhs: ListNode) -> Bool
    {
        return lhs.node == rhs.node && lhs.nextNode == rhs.nextNode
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
    
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        
        var h = head
        var p1,p2,pre: ListNode?
        
        if head == nil || n <= 0 {
            return nil
        }
        p1 = head
        p2 = head
        
        var i = 0
        //1. 遍历n-1次,是为了获取到(2)中的p2位置.
        while i < n-1 {
            p1 = p1?.nextNode
            if p1==nil {
                return nil
            }
            i+=1
        }
        //2. 获取倒数n的节点
        while p1?.nextNode != nil {
            p1 = p1?.nextNode
            pre = p2  //3. 此目的是为了要获取倒数节点的上一个节点,然后重新设置(4)上一个节点的nextNode
            p2 = p2?.nextNode
        }

        if p2 == head {
            h = head?.nextNode
        }else
        {
            //4. 重新设置上一个节点的nextNode
            pre?.nextNode = pre?.nextNode?.nextNode
        }
        // 5. 此步骤和以上步骤没有关系,重新返回头节点
        return h
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
        
        
        let s = Solution()
        
        s.showList(head: firstNode)
        
        let tempList = s.removeNthFromEnd(firstNode, 2)
        
        
        s.showList(head: tempList!)
        
        s.showList(head: firstNode)
    }
    
}

