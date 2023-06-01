package com.earthball.member.model.dao;

import org.apache.ibatis.annotations.Mapper;
import com.earthball.member.model.vo.Member;

@Mapper
public interface MemberMapper {

  public Member loginMember(Member m);

  public int insertMember(Member m);

}
