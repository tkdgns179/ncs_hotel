package com.hotel.vo;

public class Booking {
	
	private int bookcode; // PK
	private int roomcode;// FK
	
	private int person;
	private String checkin;
	private String checkout;
	private String name;
	private String mobile;
	private int total;
	
	// room table
	private String room_name;
	private String room_typename; // join room - roomtype
	private int howmany;
	private int howmuch;
	
	
	public int getPerson() {
		return person;
	}
	public void setPerson(int person) {
		this.person = person;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public int getBookcode() {
		return bookcode;
	}
	public void setBookcode(int bookcode) {
		this.bookcode = bookcode;
	}
	public int getRoomcode() {
		return roomcode;
	}
	public void setRoomcode(int roomcode) {
		this.roomcode = roomcode;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public String getRoom_typename() {
		return room_typename;
	}
	public void setRoom_typename(String room_typename) {
		this.room_typename = room_typename;
	}
	public int getHowmany() {
		return howmany;
	}
	public void setHowmany(int howmany) {
		this.howmany = howmany;
	}
	public int getHowmuch() {
		return howmuch;
	}
	public void setHowmuch(int howmuch) {
		this.howmuch = howmuch;
	}
	
	
	@Override
	public String toString() {
		return "Booking [bookcode=" + bookcode + ", roomcode=" + roomcode + ", person=" + person + ", checkin="
				+ checkin + ", checkout=" + checkout + ", name=" + name + ", mobile=" + mobile + ", total=" + total
				+ ", room_name=" + room_name + ", room_typename=" + room_typename + ", howmany=" + howmany
				+ ", howmuch=" + howmuch + "]";
	}
	
	
	
	
	
	
	
	
}
