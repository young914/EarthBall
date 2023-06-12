package com.kh.earthball.fo.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.kh.earthball.fo.member.service.MemberService;
import com.kh.earthball.fo.member.vo.MailHandler;
import com.kh.earthball.fo.member.vo.Member;
import com.kh.earthball.fo.member.vo.TempKey;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class MemberController {


  private final MemberService memberService;

  private final BCryptPasswordEncoder bcryptPasswordEncoder;
  
  private final JavaMailSender mailSender;


  // 로그인 기능
  
//  @RequestMapping("login.me")
//  public String login(String memberId, Member m, Model model) throws Exception {
//    
//    if(memberService.loginMember(m) != 1) {
//        model.addAttribute("loginFailMsg", "아이디 또는 비밀번호가 올바르지 않아요!");
//      
//        return "fo/member/loginForm.me";
//    }
//    
//    if(memberService.emailAuthFail(memberId) != 1) {
//      
//      
//    }
//    
//    return "redirect:/";
//  }
  
  @RequestMapping("login.me")
  public ModelAndView loginMember(Member m,
                                  HttpSession session,
                                  ModelAndView mv,
                                  String saveId,
                                  HttpServletResponse response) {
    // if(memberService.loginUser.(m))


    if (saveId != null && saveId.equals("y")) {

      Cookie cookie = new Cookie("saveId", m.getMemberId());
      cookie.setMaxAge(24 * 60 * 60);

      response.addCookie(cookie);

    } else {

      Cookie cookie = new Cookie("saveId", m.getMemberId());
      cookie.setMaxAge(0);

      response.addCookie(cookie);
    }

    Member loginUser = memberService.loginMember(m);

    // System.out.println(m);

    if (loginUser != null && bcryptPasswordEncoder.matches(m.getMemberPwd(), loginUser.getMemberPwd())) {

      session.setAttribute("loginUser", loginUser);
      session.setAttribute("alertMsg", "로그인에 성공했습니다.");
      // System.out.println("연결성공");
     
      mv.setViewName("redirect:/");
     
    } else {

      // System.out.println("연결 실패");

      mv.addObject("alertMsg", "아이디 혹은 비밀번호를 다시 확인해주세요");

      mv.setViewName("fo/member/loginForm");
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
  public String loginFrom(String store,Model model) {
    model.addAttribute("store",store);
    return "fo/member/loginForm";
  }

  // 회원가입 기능

  @RequestMapping("mem.me")
  public String enrollForm() {

    return "fo/member/memberEnrollForm";
  }
  
  @RequestMapping("registerEmail.me")
  public String emailConfirm(Member m) throws Exception {
    
      memberService.updateMailAuth(m);
      
      return "fo/member/emailAuthSuccess";
  }


  @RequestMapping("insert.me")
  public String insertMember(Member m,
                             Model model,
                             HttpSession session) throws Exception {

    String encPwd = bcryptPasswordEncoder.encode(m.getMemberPwd());
    
    // 랜덤 문자열 생성 후, MAIL_KEY 컬럼에 넣어줌
    String mailKey = new TempKey().getKey(30, false);
    
    m.setMailKey(mailKey);

    m.setMemberPwd(encPwd);

    int result = memberService.insertMember(m);
    
    // 이메일 인증용
    memberService.updateMailKey(m);
    
    MailHandler sendMail = new MailHandler(mailSender);
    sendMail.setSubject("[(web) 지구공 인증메일입니다.]");
    sendMail.setText(
                                  "<h1>지구공 메일인증</h1>" +
                                   "<br>[지구공] 에 오신것을 황영합니다!" +
                                   "<br>아래 [이메일 인증 확인] 을 눌러주세요." +
                                   "<br><a href='http://localhost:8007/registerEmail.me?email=" + 
                                   m.getEmail() + "&mailKey=" + mailKey + 
                                   "'  target='_blank'>이메일 인증 확인</a>");
    sendMail.setFrom("geegu000@gmail.com",  "지구공");
    sendMail.setTo(m.getEmail());
    sendMail.send();

    //  System.out.println("회원가입 정보 : " + result);

    if (result > 0) {

      session.setAttribute("alertMsg", "회원가입 이후 이메일인증을 완료해주세요!");

      return "redirect:/";

    } else {

      session.setAttribute("alertMsg", "회원가입에 실패하였습니다!");

      return "fo/member/memberEnrollForm";
    }

  }

  @RequestMapping("myPage.me")
  public ModelAndView myPage(HttpSession session, ModelAndView mv) {

    log.debug("마이페이지 요청됨");
    
    Member loginUser = (Member) session.getAttribute("loginUser");
    
    if (loginUser != null) {
        int mailAuthStatus = memberService.mailAuthStatus(loginUser.getMemberId());
        mv.addObject("isEmailVerified", mailAuthStatus == 1);
    }

    mv.setViewName("fo/mypage/myPage");
    return mv;
  }

  @RequestMapping("updateInfo.me")
  public String insertInfo() {

    return "fo/mypage/memberEnrollReset";
  }

  @RequestMapping("update.me")
  public String updateMember(Member m,
                             HttpSession session,
                             Model model) {

    System.out.println(m); // m 에 내가 필요한 정보가 다 담겨왔는가? 아이디 누락됨 => ????

    String encPwd = bcryptPasswordEncoder.encode(m.getMemberPwd());

    m.setMemberPwd(encPwd);

    int result = memberService.updateMember(m);

    System.out.println("controller : " + m);

    System.out.println("controller : " + result);


    if (result > 0) {

      Member updateMem = memberService.loginMember(m);

      session.setAttribute("loginUser", updateMem);

      session.setAttribute("alertMsg", "변경이 완료되었습니다!!");

     // System.out.println("변경성공");

      return "redirect:/myPage.me";

    } else {

      model.addAttribute("alertMsg", "정보변경실패!!");

      // System.out.println("변경실패");

      return "fo/mypage/memberEnrollReset";
    }
  }

  @ResponseBody
  @RequestMapping(value = "idCheck.me", produces = "text/html; charset=UTF-8")
  public String idCheck(String checkId) {

    int count = memberService.idCheck(checkId);

    return (count > 0) ? "NNNNN" : "NNNNY";
  }
}
