package com.kh.earthball.bo.store.controller;

import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.kh.earthball.bo.store.service.AdminStoreService;
import com.kh.earthball.bo.store.vo.AdminAtta;
import com.kh.earthball.bo.store.vo.AdminStore;
import com.kh.earthball.fo.common.template.ChangeFileName;
import com.kh.earthball.fo.common.template.Pagination;
import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.member.vo.Member;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Controller
@Slf4j
public class AdminStoreController {

  private final AdminStoreService storeService;


  @GetMapping("adminlist.st")
  public ModelAndView adminStoreList(@RequestParam(value="cPage", defaultValue="1") int currentPage,
                                 ModelAndView mv, HttpSession session) {
    
    Member loginUser = (Member) session.getAttribute("loginUser");
    if (loginUser == null || !"admin".equals(loginUser.getMemberId())) {
      mv.setViewName("redirect:/loginForm.me");
      return mv;
    }
    
    int listCount = storeService.selectListCount();
    int pageLimit = 10;
    int boardLimit = 10;

    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

    ArrayList<AdminStore> list = storeService.adminAllStoreList(pi);

    mv.addObject("pi", pi).addObject("list", list).setViewName("bo/store/storeList");
    return mv;
  }

  @GetMapping("storeEnrollForm.st")
  public String storeEnrollForm(HttpSession session) {
    Member loginUser = (Member) session.getAttribute("loginUser");
    if (loginUser == null || 1 != loginUser.getMailAuth()) {
      
      return "fo/common/emailAuthError";
    }
    return "bo/store/storeEnrollForm";
  }


  @RequestMapping("insert.st")
  public String insertStore(AdminStore s, String startAmPm, String endAmPm,  @RequestParam int  startHour, @RequestParam int  endHour, String startMin, String endMin, String address_detail,
                            MultipartFile upfile1, MultipartFile upfile2, MultipartFile upfile3, MultipartFile upfile4, MultipartFile upfile5,
                            MultipartFile upfile6, MultipartFile upfile7, MultipartFile upfile8, MultipartFile upfile9, MultipartFile upfile10,
                            HttpSession session,
                            ModelAndView mv) {
  
   String regionAddress = s.getStoreAddress();
   String[] addressParts = regionAddress.split(" ");
   String city = addressParts[0];
   String provinces = addressParts[1];
   int regionNo = storeService.getRegionNo(city, provinces);
   s.setStoreRegionNo(regionNo);
    if (startAmPm.equals("pm")) {
      startHour += 12;
    }
    if (endAmPm.equals("pm")){
      endHour += 12;
    }
    String businessHours = startHour+ ":" + startMin + " - " + endHour + ":" + endMin;

   s.setBusinessHours(businessHours);
    ArrayList<MultipartFile> fileList = new ArrayList<>();
    fileList.add(upfile1);
    fileList.add(upfile2);
    fileList.add(upfile3);
    fileList.add(upfile4);
    fileList.add(upfile5);
    fileList.add(upfile6);
    fileList.add(upfile7);
    fileList.add(upfile8);
    fileList.add(upfile9);
    fileList.add(upfile10);
    
    ArrayList<AdminAtta> list = new ArrayList<>();

    for(int i = 0; i < fileList.size(); i++) {
      MultipartFile file = fileList.get(i);

      if(!file.isEmpty()) {
        String changerName = ChangeFileName.saveFile(file, session);
        
        AdminAtta at = new AdminAtta();
        at.setChangerName(changerName);
        at.setFileLevel(i);

        list.add(at);
      }
    }

    
    int result = storeService.insertStore(s,list);

    if(result>0) {
      session.setAttribute("alertMsg", "매장추가 성공");
      return  "redirect:/main";
    }else {
      session.setAttribute("alertMsg", "매장추가 실패");
      return "redirect:/main";
    }
  }
  
  @GetMapping("adminSignUpList.st")
  public ModelAndView storeSignUpList(@RequestParam(value="cPage", defaultValue="1") int currentPage,
      HttpSession session, ModelAndView mv) {

    Member loginUser = (Member) session.getAttribute("loginUser");
    if (loginUser == null || !"admin".equals(loginUser.getMemberId())) {
      mv.setViewName("redirect:/loginForm.me");
      return mv;
    }
      
      int listCount = storeService.selectSignUpListCount();
      int pageLimit = 10;
      int boardLimit = 10;
      
      PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
      
      ArrayList<AdminStore> list = storeService.selectSignUpList(pi);
      
      mv.addObject("pi", pi).addObject("list", list).setViewName("bo/store/storeSignUpList");
      return mv;
      }
  @GetMapping("storeUpdateForm.st")
  public String storeUpdateForm(int storeNo, Model model) {
   
    AdminStore beforeData = storeService.selectStore(storeNo);
    ArrayList<AdminAtta> beforeAttaList = storeService.selectAtta(storeNo);
    
    
    model.addAttribute("beforeData", beforeData);
    model.addAttribute("beforeAtta", beforeAttaList);
    return "bo/store/storeUpdateForm";
  }

  @PostMapping("updateStore.st")
  public String updateStore(AdminStore s, String startAmPm, String endAmPm,  @RequestParam int  startHour, @RequestParam int  endHour, String startMin, String endMin, String address_detail,
                            MultipartFile upfile1, MultipartFile upfile2, MultipartFile upfile3, MultipartFile upfile4, MultipartFile upfile5,
                            MultipartFile upfile6, MultipartFile upfile7, MultipartFile upfile8, MultipartFile upfile9, MultipartFile upfile10,
                            HttpSession session,
                            ModelAndView mv) {
    
    int storeNo = s.getStoreNo();
    String regionAddress = s.getStoreAddress();
    String[] addressParts = regionAddress.split(" ");
    String city = addressParts[0];
    String provinces = addressParts[1];
    int regionNo = storeService.getRegionNo(city, provinces);
    
    s.setStoreRegionNo(regionNo);
    
    if (startAmPm.equals("pm")) {
      startHour += 12;
    }
    if (endAmPm.equals("pm")){
      endHour += 12;
    }
    String businessHours = startHour+ ":" + startMin + " - " + endHour + ":" + endMin;
  
    
   s.setBusinessHours(businessHours);
    
    ArrayList<MultipartFile> fileList = new ArrayList<>();
    fileList.add(upfile1);
    fileList.add(upfile2);
    fileList.add(upfile3);
    fileList.add(upfile4);
    fileList.add(upfile5);
    fileList.add(upfile6);
    fileList.add(upfile7);
    fileList.add(upfile8);
    fileList.add(upfile9);
    fileList.add(upfile10);
    ArrayList<AdminAtta> list = new ArrayList<>();

    for(int i = 0; i < fileList.size(); i++) {
      MultipartFile file = fileList.get(i);

      if(!file.isEmpty()) {
        String changerName = ChangeFileName.saveFile(file, session);
        
        AdminAtta at = new AdminAtta();
        at.setChangerName(changerName);
        at.setFileLevel(i);

        list.add(at);
      }
    }
    int result = storeService.updateStore(s,list);

    if(result>0) {
      session.setAttribute("alertMsg", "매장수정 성공");
      return "bo/store/storeList";
    }else {
      session.setAttribute("alertMsg", "매장수정 실패");
      return "bo/store/storeList";
    }
  }
  @GetMapping("deleteStore.st")
  public String deleteStore(@RequestParam("storeNo") int storeNo, HttpSession session) {
    int result = storeService.deleteService(storeNo);
    if(result>0) {
      session.setAttribute("alertMsg", "매장삭제 성공");
      return  "redirect:/adminlist.st";
    }else {
      session.setAttribute("alertMsg", "매장삭제 실패");
      return "redirect:/adminlist.st";
    }
  }
  
  @GetMapping("detailStore.st")
  public String detailStore(@RequestParam("storeNo") int storeNo, Model model) {
    
    AdminStore detailData = storeService.selectStore(storeNo);
    ArrayList<AdminAtta> detailAtta = storeService.selectAtta(storeNo);
    model.addAttribute("beforeData", detailData);
    model.addAttribute("beforeAtta", detailAtta);
    return "bo/store/storeDetailView";
  }
  
  @GetMapping("approvalStore.st")
  public String approvalStore(int storeNo, HttpSession session) {
    
    int result = storeService.approvalStore(storeNo);
    if(result>0) {
      session.setAttribute("alertMsg", "매장승인 성공");
    }else {
      session.setAttribute("alertMsg", "매장승인 실패");
    }
    
    return "redirect:adminSignUpList.st";
  }
}