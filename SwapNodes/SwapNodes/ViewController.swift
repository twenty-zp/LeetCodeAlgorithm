//
//  ViewController.swift
//  SwapNodes
//
//  Created by zp on 16/11/15.
//  Copyright © 2016年 ilogie. All rights reserved.
//

import UIKit

public class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int,next: ListNode?) {
        self.val = val
        self.next = next
    }
}


class Solution {
    
    //输出链表
    func showList(head: ListNode)  {
        var printStr: String =  ""
        var first = head.next
        while (first != nil) {
            if  first!.next != nil {
                printStr =   printStr.appending("\(first!.val)->")
            }else
            {
                printStr =   printStr.appending("\(first!.val)")
            }
            first =  first!.next
        }
        let firstStr = String(head.val)
        guard  printStr != "" else {
            print(firstStr)
            return
        }
        printStr = firstStr.appending("->\(printStr)")
        print(printStr)
    }
    //交换相邻节点
    func swapPairs(_ head: ListNode?) -> ListNode? {
        var h = head
        var current = head
        var f: ListNode?
        var s: ListNode?

        if head == nil {
            return nil
        }
        if head?.next == nil {
            return head
        }
        // 1->2->3->4->5->6
        //1. 获取到刚开始的节点 如获取节点2: 1 -> 2
        let temp = current?.next
        //2. 将1的节点换成2后边的节点 如 1->3->4->5->6
        current?.next = (temp?.next)!
        //3. 将2的节点换成1 如 2->1->3->4->5->6
        temp?.next = current!
        //4. 将2做为头节点
        h = temp
        
        //5. 通过判断位置的节点的后节点和再后节点  如:判断列表 2->1->3->4->5->6  节点的3.4节点是否存在
        while current?.next != nil && current?.next?.next != nil {
            //6.  存在即开始替换. 将3，4 节点进行替换,我们都知道如果替换两个值得话，要使用临时成员变量来记录
            f = current?.next
            s = f?.next
            //7.  将当前节点的下一个节点先赋值 如 2->1->4->5->6
            current?.next = s
            //8.  将4的下一个节点5改为3的下一个节点  如  2->1->4  3->5->6
            f?.next = s?.next
            //9.  当前4节点的下一个节点的改为3  如 2->1->4->3->5->6
            s?.next = f
            //10. 重新设置当前的节点为3,开始排序5，6节点
            current = f
        }
        return h
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let six = ListNode(6, next: nil);
        let five = ListNode(5, next: six);
        let first = ListNode(4, next: five);
        let second = ListNode(3, next: first);
        let third = ListNode(2, next: second)
        let four = ListNode(1,next: third)
        let s = Solution()
        
        s.showList(head: four)

        let result =  s.swapPairs(four)
       
        s.showList(head: result!)

    }


}

