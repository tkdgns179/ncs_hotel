package com.hotel.vo;

public class Room {
	
	// room table
	private int roomcode; // PK
	private String name;
	private int type;
	private Integer howmany;
	private Integer howmuch;
	
	// roomtype table
	private int type_typecode; // FK
	private String type_name;
	
	public int getRoomcode() {
		return roomcode;
	}
	public void setRoomcode(int roomcode) {
		this.roomcode = roomcode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public Integer getHowmany() {
		return howmany;
	}
	public void setHowmany(Integer howmany) {
		this.howmany = howmany;
	}
	public Integer getHowmuch() {
		return howmuch;
	}
	public void setHowmuch(Integer howmuch) {
		this.howmuch = howmuch;
	}
	
	
	public int getType_typecode() {
		return type_typecode;
	}
	public void setType_typecode(int type_typecode) {
		this.type_typecode = type_typecode;
	}
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	
	@Override
	public String toString() {
		return "Room [roomcode=" + roomcode + ", name=" + name + ", type=" + type + ", howmany=" + howmany
				+ ", howmuch=" + howmuch + ", type_typecode=" + type_typecode + ", type_name=" + type_name + "]";
	}

	
	
	
	
}
