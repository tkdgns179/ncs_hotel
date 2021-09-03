package com.edu.test;

import java.util.ArrayList;
import java.util.Arrays;

public class StreamFilter {
	
	public static void main(String[] args) {
		
		ArrayList<String> list = new ArrayList<>(Arrays.asList("Apple", "Banana", "Melon", "Grape", "Strawberry"));
		
		System.out.println(list.stream().filter( s -> s.length() > 5).findFirst().isPresent());
		
	}

}
