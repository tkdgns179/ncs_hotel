package com.edu.mapper;

import java.util.ArrayList;

import com.hotel.vo.Booking;
import com.hotel.vo.Room;

public interface RoomMapper {
	
	ArrayList<Room> getRoomList();
	ArrayList<Room> getRoomType();
	void doDeleteRoom(int roomcode);
	void doAddRoom(Room room);
	void doUpdateRoom(Room room);
	
	ArrayList<Room> getSearchRooms(Booking booking);
	
}
