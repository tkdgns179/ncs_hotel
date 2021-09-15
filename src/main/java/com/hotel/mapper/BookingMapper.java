package com.hotel.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hotel.vo.Booking;

public interface BookingMapper {
	void addBooking(Booking booking);
	ArrayList<Booking> getBookings();
	Booking getOneBooking(int id);
	void doDeleteBooking(int id);
	void doUpdateBooking(@Param("id")int id, @Param("booking")Booking booking);
}
