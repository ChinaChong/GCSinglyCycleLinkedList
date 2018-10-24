//
//  SinglyCycleLinkedList.h
//  OC版数据结构
//
//  Created by 崇 on 2018/10/22.
//  Copyright © 2018年 崇. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SinglyCycleLinkedListNode;

@interface SinglyCycleLinkedList : NSObject

/**
 初始化一个单向循环链表

 @param node 链表的头节点
 @return 返回一个已初始化的单向循环链表
 */
- (instancetype)initWithNode:(SinglyCycleLinkedListNode *)node;

/**
 判断链表是否为空

 @return 为空返回YES，反之为NO
 */
- (BOOL)isEmpty;

/**
 获取链表拥有的总节点数

 @return 总节点数
 */
- (NSInteger)length;

/**
 遍历链表
 */
- (void)travel;

/**
 头插法：在链表的头部插入节点

 @param item 插入的元素
 */
- (void)insertNodeAtHeadWithItem:(NSInteger)item;

/**
 尾插法：在链表的尾部插入节点

 @param item 插入的元素
 */
- (void)appendNodeWithItem:(NSInteger)item;

/**
 指定位置插入节点

 @param item 插入的元素
 @param index 位置的索引
 */
- (void)insertNodeWithItem:(NSInteger)item atIndex:(NSInteger)index;

/**
 删除节点

 @param item 删除的元素
 */
- (void)removeNodeWithItem:(NSInteger)item;

/**
 查询某个节点是否存在

 @param item 查询的元素
 @return 存在返回YES，反之为NO
 */
- (BOOL)searchNodeWithItem:(NSInteger)item;
@end
