package com.earthball.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.earthball.member.model.service.MemberService;
import com.earthball.member.model.vo.Member;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {

     @Autowired
     private MemberService memberService;
     
     @Autowired
     private BCryptPasswordEncoder  bcryptPasswordEncoder;
     
     
     
     // 로그인 기능
     
     public ModelAndView loginMember(Member m,
                                                                     HttpSession session,
                                                                     ModelAndView mv,
                                                                     String saveId,
                                                                     HttpServletResponse response) {
       
       if(saveId != null && saveId.equals("y")) {
         
         Cookie cookie = new Cookie("saveId", m.getMemberId());
         cookie.setMaxAge(24 * 60 * 60 * 1);
         
         response.addCookie(cookie);
         
       } else {
         
         Cookie cookie = new Cookie("saveId", m.getMemberId());
         cookie.setMaxAge(0);
         
         response.addCookie(cookie);
       }
       
       Member loginUser = memberService.loginMember(m);
       
       if(loginUser != null && bcryptPasswordEncoder.matches(m.getMemberPwd(), loginUser.getMemberPwd())) {
         
            session.setAttribute("loginUser", loginUser);
            session.setAttribute("alertMsg", "로그인에 성공했습니다.");
            
            mv.setViewName("redirect:/");
         
       } else {
         
             mv.addObject("alertMsg", "아이디 혹은 비밀번호를 다시 확인해주세요");
             
       }
           
           return mv;
       
     }
     
     // 로그아웃 기능
     
     @RequestMapping("logout.me")
     public String logoutMember(HttpSession session) {
       
       session.invalidate(); // 새션 자체를 무효
       
       return "redirect:/";
     }
     
     // 회원가입 기능
     
     @RequestMapping("mem.me")
     public String enrollForm() {
         
       return "member/memberEnrollForm";
     }
     
     
     @RequestMapping("insert.me")
     public String insertMember(Member m,
                                                       Model model,
                                                       HttpSession session) {
       
           String encPwd = bcryptPasswordEncoder.encode(m.getMemberPwd());
           
           m.setMemberPwd(encPwd);
           
           int result = memberService.insertMember(m);
           
           if(result > 0 ) {
             
             session.setAttribute("alertMsg", "회원가입이 완료되었습니다");
             
             return "redirect:/";
             
           } else {
             
             session.setAttribute("alertMsg", "회원가입에 실패하였습니다!");
             
             return "member/memberEnrollForm";
           }
           
     }
     
     
     

}
