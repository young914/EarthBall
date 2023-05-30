package com.earthball.member.model.service;

import com.earthball.member.model.vo.Member;



public interface MemberService {
  
          Member loginMember(Member m);
          
          int insertMember(Member m);
          
          
  
}
