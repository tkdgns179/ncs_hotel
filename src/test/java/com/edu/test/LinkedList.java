package com.edu.test;

class ListNode {
	private String data;
	public ListNode link;
	
	public ListNode() {
		this.data = null;
		this.link = null;
	}
	
	public ListNode(String data) {
		this.data = data;
		this.link = null;
	}
	
	public ListNode(String data, ListNode link) {
		this.data = data;
		this.link = link;
	}
	
	public String getData() {
		return this.data;
	}
}

public class LinkedList {
	
	private ListNode head;
	
	public LinkedList() {
		head = null;
	}
	
	// 노드 중간삽입 preNode 뒤에 새로 node를 삽입한다
	public void insertNode(ListNode preNode, String data) {
		ListNode newNode = new ListNode(data);
		
		
		// preNode의 link(preNode의 뒤에 오는 노드)를 newNode가 받음 
		newNode.link = preNode.link;
		
		// 그 다음에 preNode의 뒤에는 data를 가지고 있는 newNode가 되어야 함
		preNode.link = newNode;
	}
	
	public void insertNode(String data) {
		ListNode newNode = new ListNode(data);
		
		if(head == null) {
			this.head = newNode;
		}
		else {
			ListNode tempNode = head;
			
			while (tempNode.link != null) {
				tempNode = tempNode.link; // link가 없을 때 까지 이동
			}
			
			tempNode.link = newNode; // 헤더 부터 마지막 노드까지 도착하면 새 노드 삽입
		}
	}
	
	// 중간 노드 삭제
	public void deleteNode(String data) { // data를 가지고있는 노드 삭제
		ListNode preNode = head ;
		
		ListNode tempNode = head.link;
		
		// preNode는 현재 head를 참조
		if (data.equals(preNode.getData())) {
			
			head = preNode.link;
			preNode.link = null;
		}
		else {
			while (tempNode != null) {
				if (data.equals(tempNode.getData())) {
					if (tempNode.link == null) {
						preNode.link = null;
					}
					else {
						preNode.link = tempNode.link;
						tempNode.link = null;
					}
					break;
				}
				else {
					// 못 지웠으면 한 칸 이동
					preNode = tempNode;
					tempNode = tempNode.link;
				}
			}
		}
		
	}
	
	public void delete() {
		ListNode preNode;
		ListNode tempNode;
		
		if (head == null) {
			return;
		}
		
		if (head.link == null) {
			head = null;
		}
		else {
			preNode = head;
			tempNode = head.link;
			
			while (tempNode.link != null) {
				preNode = tempNode;
				tempNode = tempNode.link;
			}
			
			preNode.link = null;
		}
	}
	
	public ListNode searchNode(String data) {
		
		ListNode tempNode = this.head;
		
		while (tempNode != null) {
			if (data.equals(tempNode.getData())) {
				return tempNode;
			}
			else {
				tempNode = tempNode.link;
			}
		}
		
		return tempNode;
	}
	
	// TODO 연결리스트 역순 구현하기
	public void reverseList() {
		ListNode nextNode = head;
		ListNode currentNode = head.link;
		ListNode preNode = head.link.link;
		
		while (nextNode != null) {
			preNode = currentNode;
			currentNode = nextNode;
			nextNode = nextNode.link;
			currentNode = preNode;
		}
		
		head = currentNode;
	}
	
	
	public void printList() {
		ListNode tempNode = this.head;
	
	
	while (tempNode != null) {
		System.out.println(tempNode.getData() + " ");
		tempNode = tempNode.link;
	}
	System.out.println();
	}
}
