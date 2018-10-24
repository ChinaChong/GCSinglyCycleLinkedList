//
//  SinglyCycleLinkedList.m
//  OC版数据结构
//
//  Created by 崇 on 2018/10/22.
//  Copyright © 2018年 崇. All rights reserved.
//

#import "SinglyCycleLinkedList.h"

@interface SinglyCycleLinkedListNode : NSObject

@property (nonatomic, assign) NSInteger element;

@property (nonatomic, strong) SinglyCycleLinkedListNode *nextNode;

@end


@implementation SinglyCycleLinkedListNode

- (instancetype)initWithItem:(NSInteger)item {
    self = [super init];
    if (self)
    {
        self.element = item;
        return self;
    }
    
    return nil;
}

@end

@interface SinglyCycleLinkedList()

@property (nonatomic, strong) SinglyCycleLinkedListNode *headNode;

@end

@implementation SinglyCycleLinkedList

- (instancetype)initWithNode:(SinglyCycleLinkedListNode *)node {
    self = [super init];
    
    if (self)
    {
        self.headNode = node;
        
        // 判断node不为空的情况，循环指向自己
        if (node)
        {
            node.nextNode = node;
        }
    }
    
    return self;
}

// 判断是否为空
- (BOOL)isEmpty {
    return self.headNode == nil;
}

// 链表节点个数
- (NSInteger)length {
    if ([self isEmpty]) return 0;
    
    SinglyCycleLinkedListNode *cur =  self.headNode;
    
    NSInteger count = 1;
    
    while (cur.nextNode != self.headNode) {
        count++;
        cur = cur.nextNode;
    }
    
    return count;
}

// 遍历
- (void)travel {
    // 空链表的情况
    if ([self isEmpty]) return;
    
    SinglyCycleLinkedListNode *cur = self.headNode;
    
    while (cur.nextNode != self.headNode) {
        NSLog(@"%ld", cur.element);
        cur = cur.nextNode;
    }
    
    // 退出循环，cur指向尾节点，但尾节点的元素未打印
    NSLog(@"%ld", cur.element);
}

// 头插法
- (void)insertNodeAtHeadWithItem:(NSInteger)item {
    SinglyCycleLinkedListNode *node = [[SinglyCycleLinkedListNode alloc] initWithItem: item];
    
    if ([self isEmpty])
    {
        self.headNode = node;
        node.nextNode = node;
    }
    else {
        SinglyCycleLinkedListNode *cur = self.headNode;
        
        while (cur.nextNode != self.headNode) {
            cur = cur.nextNode;
        }
        
        // 利用循环将游标指向尾节点，退出循环
        node.nextNode = self.headNode;
        self.headNode = node;
        cur.nextNode = self.headNode; // cur.nextNode = node;
    }
}

// 尾插法
- (void)appendNodeWithItem:(NSInteger)item {
    SinglyCycleLinkedListNode *node = [[SinglyCycleLinkedListNode alloc] initWithItem: item];
    
    if ([self isEmpty])
    {
        self.headNode = node;
        node.nextNode = node;
    }
    else  {
        SinglyCycleLinkedListNode *cur = self.headNode;
        
        while (cur.nextNode != self.headNode) {
            cur = cur.nextNode; // 让游标指向尾节点
        }
        
        cur.nextNode = node;
        node.nextNode = self.headNode;
        
    }
}

// 指定位置插入节点
- (void)insertNodeWithItem:(NSInteger)item atIndex:(NSInteger)index {
    if (index <= 0)
    {
        [self insertNodeAtHeadWithItem: item];
    }
    else if (index > ([self length] - 1))
    {
        [self appendNodeWithItem:item];
    }
    else {
        // 这里需要的就是让游标指向前一个节点
        SinglyCycleLinkedListNode *pre = self.headNode;
        
        for (int i = 0; i < index - 1; ++i)
        {
            pre = pre.nextNode;
        }
        
        SinglyCycleLinkedListNode *node = [[SinglyCycleLinkedListNode alloc] initWithItem: item];
        node.nextNode = pre.nextNode;
        pre.nextNode = node;
    }
}

// 删除节点
- (void)removeNodeWithItem:(NSInteger)item {
    if ([self isEmpty]) return;
    
    SinglyCycleLinkedListNode *cur = self.headNode;
    SinglyCycleLinkedListNode *pre = [[SinglyCycleLinkedListNode alloc] init];
    
    // 这个循环的终点就是cur指向尾节点
    while (cur.nextNode != self.headNode) {
        if (cur.element == item)
        {
            if (cur == self.headNode) // 恰好这个cur指向的是头节点
            {
                // 我们需要先找到尾节点
                SinglyCycleLinkedListNode *rear = self.headNode;
                while (rear.nextNode != self.headNode) {
                    rear = rear.nextNode;
                }
                
                self.headNode = cur.nextNode;
                rear.nextNode = self.headNode;
                
            }
            else {
                pre.nextNode = cur.nextNode;
            }
            return;
        }
        else {
            pre = cur;
            cur = cur.nextNode;
        }
    }
    
    // 退出循环，cur指向尾节点
    if (cur.element == item)
    {
        if (cur == self.headNode) // 证明链表只有一个头节点
        {
            self.headNode = nil;
        }
        else {
            pre.nextNode = cur.nextNode;
        }
    }
}

// 查找节点是否存在
- (BOOL)searchNodeWithItem:(NSInteger)item {
    if ([self isEmpty]) return NO;
    
    SinglyCycleLinkedListNode *cur = self.headNode;
    
    while (cur.nextNode != self.headNode) {
        if (cur.element == item)
        {
            return YES;
        }
        else {
            cur = cur.nextNode;
        }
    }
    
    // 循环结束，cur指向尾节点
    if (cur.element == item)
    {
        return YES;
    }
    
    return NO;
}

@end
