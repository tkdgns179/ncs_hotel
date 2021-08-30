package com.hotel.org;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.edu.mapper.RoomMapper;
import com.hotel.vo.Room;


@Controller
@RequestMapping("/book")
public class BookingController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/booking")
	public String book(HttpServletRequest request, Model model) {
		
		RoomMapper roomMapper = sqlSession.getMapper(RoomMapper.class);
		ArrayList<Room> roomList = roomMapper.getRoomList();
		System.out.println(roomList.size());
		model.addAttribute("roomList", roomList);
		return "book/booking";
	}
	
	@RequestMapping("/room")
	public String room(HttpSession session) {
		
		return "book/room";
	}
	
	
	
	
}
