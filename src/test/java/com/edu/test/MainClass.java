package com.edu.test;

public class MainClass {

	public static void main(String[] args) {
		ListNode nodeSec = new ListNode("i'm Second");
		ListNode nodeFir = new ListNode("i'm First", nodeSec);
		
		ListNode refNode = nodeSec;
		ListNode refNode2 = nodeFir;
		
		nodeSec = null;
//		System.out.println(nodeSec);
//		System.out.println(nodeFir.link.getData());
//		System.out.println(refNode.getData());
//		System.out.println(refNode2.link.getData());
//		
//		nodeFir = null;
//		
//		System.out.println(nodeSec.getData());
//		System.out.println(refNode2.link.getData());
		
		LinkedList linkedList = new LinkedList();
		
//		linkedList.insertNode("hello");
//		linkedList.insertNode("babo");
//		linkedList.deleteNode("babo");
//		System.out.println(linkedList.searchNode("hello").getData());
//		linkedList.printList();
		
		linkedList.insertNode("1");
		linkedList.insertNode("2");
		linkedList.insertNode("3");
		linkedList.insertNode("4");
		
		
		
		linkedList.printList();
	}
}
