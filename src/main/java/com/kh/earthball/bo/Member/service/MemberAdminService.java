package com.kh.earthball.bo.Member.service;

import java.util.List;
import com.kh.earthball.bo.Member.vo.adminMember;
import com.kh.earthball.fo.common.vo.PageInfo;

public interface MemberAdminService {
  
  int AdminMemberListCount();
  
  List<adminMember>selectAdminMemberList(PageInfo pageInfo);
  
  List<adminMember> searchAdminMember(String keyword);
}
