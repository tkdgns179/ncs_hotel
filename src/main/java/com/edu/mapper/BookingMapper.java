package com.edu.mapper;

import java.util.ArrayList;

import com.hotel.vo.Booking;
import com.hotel.vo.Room;

public interface BookingMapper {
	void addBooking(Booking booking);
	ArrayList<Booking> getBookings();
	Booking getOneBooking(int id);
	void doDeleteBooking(int id);
}
