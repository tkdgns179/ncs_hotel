package com.edu.design.template;

public abstract class OrderProcessTemplate {
	
	public abstract void doSelect();
	
	public abstract void doPayment();
	
	public final void giftWarp()
	{
		try
		{
			System.out.println("Gift wrap successful");
		}
		catch (Exception e)
		{
			System.out.println("Gift wrap unsuccessful");
		}
	}
	
	public abstract void doDelivery();
	
	public final void processOrder(boolean isGift)
	{
		doSelect();
		doPayment();
		if (isGift) {
			giftWarp();
		}
		doDelivery();
	}
	
}

class NetOrder extends OrderProcessTemplate
{
	@Override
	public void doSelect() {
		System.out.println("Item added to online shopping cart");
		System.out.println("Get ift wrap perference");
		System.out.println("Get delivery address.");
	}

	@Override
	public void doPayment() {
		System.out.println("Online Payment through Netbanking, card or Paym");
	}

	@Override
	public void doDelivery() {
		System.out.println("Shop the item through post to delivery address");
	}
}
