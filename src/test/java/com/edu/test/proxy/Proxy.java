package com.edu.test.proxy;

public class Proxy {
	
	public void whatToDo(Animal animal) {
		System.out.println("동작을 수행합니다");
		animal.eat();
		System.out.println("동작이 끝났습니다");
	}
	
	public static void main(String[] args) {
		Animal animal = new Tiger();
		
		Proxy proxy = new Proxy();
		proxy.whatToDo(animal);
	}
}
