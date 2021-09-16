package com.edu.design.proxy;

public class MainClass {
	
	public static void main(String[] args) {
		Animal animal = new Tiger();
		
		Proxy proxy = new Proxy();
		proxy.whatToDo(animal);
	}
	
}
