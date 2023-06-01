package com.kh.earthball.fo.member.mapper;

import com.kh.earthball.fo.member.vo.Member;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {

  Member loginMember(Member m);

  int insertMember(Member m);

  int updateMember(Member m);

  int idCheck(String checkId);
}
