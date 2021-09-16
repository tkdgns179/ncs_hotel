package com.edu.test.anonymous;

import java.io.ObjectOutputStream.PutField;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class AnonymousClass { // ** Syntactic sugar
	
	public static void main(String[] args) {
		
		TestClass t1 = new TestClass() { // TestClass를 상속받은 익명클래스 
			public int num = 10;		 // [class com.edu.test.anonymous.AnonymousClass$2]
			@Override
			public int getNum() {
			 return this.num;	
			}
		};
					
		System.out.println(t1.getNum());
		
		List<String> list  = new ArrayList<String>() {{ // double brace initialization
			add("hello");
			add("myname");
			add("kim");
		}};
		
		List<String> list2 = Arrays.asList("A", "B", "C");
		
		System.out.println("["+list.getClass() + "] [" + list2.getClass() + "]");
		
		for (String item : list) {
			System.out.println(item);
		}
		System.out.println("-------------------");
		for (String item : list2) {
			System.out.println(item);
		}
		
	}
	
}
	