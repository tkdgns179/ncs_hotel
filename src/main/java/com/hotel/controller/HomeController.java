package com.hotel.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hotel.common.ExistingMemberException;
import com.hotel.mapper.MemberMapper;
import com.hotel.service.MemberService;
import com.hotel.vo.Member;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private MemberService memberService;
	
	HttpSession session; // 초기화 필요없음 필드임
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Model model) {
		
		return "home";
	}
	
	@RequestMapping(value = "/login_form")
	public String login_form(HttpServletRequest requset, Model model) {
		
		return "login";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value = "/sign_form")
	public String sign_form(HttpServletRequest requset, Model model) {
		
		return "sign";
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.POST) 
	public String signup(@ModelAttribute("member") @Valid Member member, Errors errors) {
		
		System.out.println(member.toString());
		
		if (errors.hasErrors()) {
			System.out.println("에러검출 "+errors.toString());
			return "sign";
		}
		
		try {
			memberService.addCheckedMember(member);
		}
		catch (ExistingMemberException ex) {
			System.out.println("예외진입");
			return "sign";
		}
				
		
		return "redirect:/login_form";
	}
	
	/*
	 * @RequestMapping(value = "/login", method = RequestMethod.POST) public String
	 * login(HttpServletRequest request, Model model, HttpSession session) { String
	 * id = request.getParameter("id"); String password =
	 * request.getParameter("password"); model.addAttribute("id", id);
	 * model.addAttribute("password", password);
	 * 
	 * session.setAttribute("id", id); return "/book"; }
	 */
	
	@RequestMapping(value = "/check_user", method = RequestMethod.POST)
	public String check_user(HttpServletRequest request, Model model, Member member ,RedirectAttributes rdat) {
		
		// TODO DB에서 User 확인 : 기존유저면 booking, 없으면 home으로 Intercepter
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
//		List<Member> memberList = memberMapper.getMembers();
		int checkVal = memberMapper.doCheckUser(member);
		
		HttpSession session = request.getSession();
		
		System.out.println(member.toString());
		
//		XXX 리스트를 싹다 가져와서 체크하기
//		
//		String user_id = member.getLoginid();
//		String user_pwd = member.getPasscode();
//		
//		for (Member _member : memberList) {
//			
//			if (user_id.equals( _member.getLoginid()) && user_pwd.equals(_member.getPasscode()) ) {
//				session.setAttribute("user_id", user_id);
//				return "redirect:/book/booking";
//			}
//		}
		
		if (checkVal == 1) {
			session.setAttribute("user_id", member.getLoginid());
			return "redirect:/book/booking";
		}
		
		
		rdat.addFlashAttribute("errorMsg", "로그인에 실패하였습니다.");
		return "redirect:/login_form";
	}
	
}
