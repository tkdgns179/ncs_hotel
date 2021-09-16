package com.edu.test.ds;

import java.util.Arrays;

public class MyList<T> { // ArrayList<T>의 List Interface는 길이에 제한을 두지 않음
	
	private final static int MAX_SIZE = 100;
	private T[] items;
	private int index;
	
	public MyList() {
		this.index = 0;
		this.items = (T[]) new Object[MAX_SIZE];
	}
	
	/**
	 * 마지막에 아이템 넣기
	 * @param obj
	 */
	public void pushItem(T obj) {
		items[index] = obj;
		index++;
	}
	/**
	 * 중간에 아이템 넣기
	 * @param obj
	 * @param idx
	 */
	public void pushItem(T obj, int idx) {
		T stored = items[idx];
		
		for (int i = this.index+1; i>idx ; i--) {
			T temp = items[i];
			items[i] = items[i-1];
			items[i-1]  = temp;
		}
		
		items[idx] = obj;
		this.index++;
	}
	/**
	 * 마지막 아이템 뽑기
	 * @return
	 */
	public T popItem() {
		T obj =  items[index--];
		items[index + 1] = null;
		return obj;
	}
	/**
	 * 중간에 있는 아이템 뽑기
	 * @param idx
	 * @return
	 */
	public T popItem(int idx) {
		T obj = items[idx];
		items[idx] = null;
		
		for (int i = idx; i<this.index; i++) {
			T temp = items[i];
			items[i] = items[i+1];
			items[i+1] = temp;
		}
		
		this.index--;
		return obj;
	}
	/**
	 * 인덱스로 아이템 가져오기
	 * @param idx
	 * @return
	 */
	public T getItem(int idx) {
		return items[idx];
	}

	public void printMyList() {
		String str = "[";
		for (int i=0; i<index; i++) {
			str += (i == index-1)? (items[i].toString()) : (items[i].toString() + ", ");
		}
		str += "]";
		System.out.println(str);
	}
}
