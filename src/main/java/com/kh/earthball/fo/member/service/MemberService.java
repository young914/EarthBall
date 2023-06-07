package com.kh.earthball.fo.member.service;

import com.kh.earthball.fo.member.vo.Member;


public interface MemberService {

  Member loginMember(Member m);

  int insertMember(Member m);

  int updateMember(Member m);

  int idCheck(String checkId);
  
  int updateMailKey(Member m) throws Exception;
  
  int updateMailAuth(Member m) throws Exception;
  
  int emailAuthFail(String memberId) throws Exception;


}
