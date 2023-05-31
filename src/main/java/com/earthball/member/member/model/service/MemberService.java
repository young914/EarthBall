package com.earthball.member.member.model.service;

import com.earthball.member.member.model.vo.Member;



public interface MemberService {
  
          Member loginMember(Member m);
          
          int insertMember(Member m);
          
          int updateMember(Member m);
          
          
  
}
