package com.edu.design.adapter;

import org.junit.Test;

public class MovableAdapterImpl implements MovableAdapter{
	
	private Movable luxuryCars;
	
	public MovableAdapterImpl(Movable luxuryCars) {
		this.luxuryCars = luxuryCars;
	}
	
	@Override
	public double getSpeed() {
		return convertPHtoKMPH(luxuryCars.getSpeed());
	}
	
	private double convertPHtoKMPH(double mph) {
		return mph * 1.60934;
	}
	
}
