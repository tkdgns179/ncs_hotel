package com.edu.design.decorator;

public class CaffeOfKim {
	
	public static void main(String[] args) {
		Beverage beverage = new Espresso();
		System.out.println(beverage.getDescription() + beverage.cost());
		
		System.out.println("--------------------------------------------");
		
		beverage = new Mocha(new Mocha(beverage));
//		beverage = new Mocha(beverage);
//		beverage = new Mocha(beverage);
		System.out.println(beverage.getDescription() + beverage.cost());
		
	}
	
}
