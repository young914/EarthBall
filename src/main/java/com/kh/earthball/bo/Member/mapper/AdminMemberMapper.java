package com.kh.earthball.bo.Member.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.kh.earthball.bo.Member.vo.adminMember;

@Mapper
public interface AdminMemberMapper {
  
  int AdminMemberListCount();
  
  List<adminMember>selectAdminMemberList(@Param("offset") int offset, @Param("limit") int limit);

  List<adminMember> searchAdminMember(@Param("keyword") String keyword);
}
