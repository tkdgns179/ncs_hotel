package com.edu.test.ds;

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
		
		MyLinkedList linkedList = new MyLinkedList();
		
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
		
		System.out.println("----------------------------------");
		
		MyList<String> myList = new MyList<String>();
		
		myList.pushItem("first");
		System.out.println(myList.getItem(0));
		
		myList.pushItem("second");
		System.out.println(myList.getItem(1));
		
		myList.pushItem("third");
		myList.pushItem("forth");
		myList.pushItem("fifth");
		
		System.out.println("뽑힌 아이템 = " + myList.popItem(1).toString());
		
		myList.printMyList();
		
		myList.pushItem("second", 1);
		System.out.println(myList.getItem(1));
		myList.printMyList();
		
	}
}
