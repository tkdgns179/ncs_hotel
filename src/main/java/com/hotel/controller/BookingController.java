package com.hotel.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.edu.mapper.RoomMapper;
import com.hotel.vo.Room;


@Controller
@RequestMapping("/book")
public class BookingController {
	
	@Autowired
	private SqlSession sqlSession;
	

	@ModelAttribute("roomTypes")
	public ArrayList<Room> roomtype() { return  sqlSession.getMapper(RoomMapper.class).getRoomType(); }
	
	@ModelAttribute("roomList")
	public ArrayList<Room> roomList() { return  sqlSession.getMapper(RoomMapper.class).getRoomList(); }
	
	
	
	@RequestMapping(value = "/booking")
	public String book(HttpServletRequest request, Model model) {
		
		return "book/booking";
	}
	
	@RequestMapping("/room")
	public String room(HttpSession session, Model model) {
		
		return "book/room";
	}
	
	@RequestMapping(value = "/deleteRoom", method = RequestMethod.POST)
	@ResponseBody
	public String getRoomDelete(HttpServletRequest request) {
		int roomcode = Integer.parseInt(request.getParameter("roomcode"));
//		System.out.println(roomcode);
		RoomMapper roomMapper = sqlSession.getMapper(RoomMapper.class);
		roomMapper.doDeleteRoom(roomcode);
		return "OK";
	}
	
	@RequestMapping(value = "/addRoom", method = RequestMethod.POST)
	@ResponseBody
	public String addRoom(Room room) {
		RoomMapper roomMapper = sqlSession.getMapper(RoomMapper.class);
		System.out.println(room.toString());
		roomMapper.doAddRoom(room);
		
		return "OK";
	}
	
	@RequestMapping(value = "/updateRoom" , method = RequestMethod.POST)
	@ResponseBody
	public String updateRoom(Room room) {
		RoomMapper roomMapper = sqlSession.getMapper(RoomMapper.class);
		System.out.println(room.toString());
		roomMapper.doUpdateRoom(room);
		return "OK";
	}
	
//	FIXME ModelAttribute 데이터를 JSON 데이터로 넘겼음 그러나 Jquery에 JSTL로 구현해서 사용했기 때문에 막아둠
//	@RequestMapping(value="/getRoomType", method=RequestMethod.POST)
//	@ResponseBody
//	public List<Room> getRoomType(HttpServletRequest request) {
//		RoomMapper roomMapper = sqlSession.getMapper(RoomMapper.class);
//		List<Room> roomList = roomMapper.getRoomType();
//				
//		return roomList;
//	}
	
//	@RequestMapping(value="/getRoomList", produces = "application/text; charse=utf8" , method=RequestMethod.POST)
//	@ResponseBody
//	public String getRoomList(HttpServletRequest request) {
//		RoomMapper roomMapper = sqlSession.getMapper(RoomMapper.class);
//		List<Room> roomList = roomMapper.getRoomType();
//				
//		JSONArray ja = new JSONArray();
//		for (int i=0; i<roomList.size(); i++) {
//			JSONObject jo = new JSONObject();
//			jo.put("typecode", roomList.get(i).getType_typecode());
//			jo.put("type_name", roomList.get(i).getType_name());
//			ja.add(jo);
//		}
//		return ja.toString();
//	}
}
