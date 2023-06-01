package com.earthball.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.earthball.member.model.service.MemberService;
import com.earthball.member.model.vo.Member;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@RequiredArgsConstructor
@Controller
public class MemberController {


     private final MemberService memberService;


     private final BCryptPasswordEncoder  bcryptPasswordEncoder;



     // 로그인 기능
     @RequestMapping("login.me")
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

       System.out.println(m);

       if(loginUser != null && bcryptPasswordEncoder.matches(m.getMemberPwd(), loginUser.getMemberPwd())) {

            session.setAttribute("loginUser", loginUser);
            session.setAttribute("alertMsg", "로그인에 성공했습니다.");

            System.out.println("연결성공");

            mv.setViewName("redirect:/");

       } else {

         System.out.println("연결 실패");

             mv.addObject("alertMsg", "아이디 혹은 비밀번호를 다시 확인해주세요");

             mv.setViewName("member/loginForm");
       }

           return mv;

     }

     // 로그아웃 기능

     @RequestMapping("logout.me")
     public String logoutMember(HttpSession session) {

       session.invalidate(); // 세션 자체를 무효

       return "redirect:/";
     }

     // 로그인 기능
     @RequestMapping("loginForm.me")
     public String loginFrom() {

       return "member/member/loginForm";
     }

     // 회원가입 기능

     @RequestMapping("mem.me")
     public String enrollForm() {

       return "member/member/memberEnrollForm";
     }


     @RequestMapping("insert.me")
     public String insertMember(Member m,
                                                       Model model,
                                                       HttpSession session) {

           String encPwd = bcryptPasswordEncoder.encode(m.getMemberPwd());

           m.setMemberPwd(encPwd);

           int result = memberService.insertMember(m);

          //  System.out.println("회원가입 정보 : " + result);

           if(result > 0 ) {

             session.setAttribute("alertMsg", "회원가입이 완료되었습니다");

             return "redirect:/";

           } else {

             session.setAttribute("alertMsg", "회원가입에 실패하였습니다!");

             return "member/memberEnrollForm";
           }

     }




}
