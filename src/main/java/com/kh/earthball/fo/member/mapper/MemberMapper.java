package com.kh.earthball.fo.member.mapper;

import com.kh.earthball.fo.member.vo.Member;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {

  Member loginMember(Member m);

  int insertMember(Member m);

  int updateMember(Member m);

  int idCheck(String checkId);
  
  int updateMailKey(Member m);
  
  int updateMailAuth(Member m);
  
  int emailAuthFail(String memberId);
  
  int mailAuthStatus(String memberId);
  
  int updateImg(String orgFileName, String memberId);
  
  void updateProfile(String memberId, String profileName);
  
  String selectProfile(String memberId);
}
