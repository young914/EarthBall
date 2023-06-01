package com.kh.earthball.fo.member.service;

import com.kh.earthball.fo.member.vo.Member;


public interface MemberService {

  Member loginMember(Member m);

  int insertMember(Member m);

  int updateMember(Member m);

  int deleteMember(String memberId);

  int idCheck(String checkId);


}
