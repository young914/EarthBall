package com.earthball.member.member.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import com.earthball.member.member.model.vo.Member;

@Mapper
public interface MemberMapper {

   Member loginMember(Member m);

   int insertMember(Member m);

   int updateMember(Member m);
}
