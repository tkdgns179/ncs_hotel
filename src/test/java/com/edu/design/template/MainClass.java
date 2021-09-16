package com.edu.design.template;

public class MainClass {
	
	public static void main(String[] args) {
		
		OrderProcessTemplate implOrder = new NetOrder();
		implOrder.processOrder(true);
	}

}
