package com.earthball.member.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.earthball.member.member.model.dao.MemberDao;
import com.earthball.member.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

      @Autowired
      private SqlSessionTemplate sqlSession;
      
      @Autowired
      private MemberDao memberDao;
    
  @Override
  public Member loginMember(Member m) {
          Member loginUser = memberDao.loginMember(sqlSession, m);
          
          return loginUser;
  }

  @Override
  public int insertMember(Member m) {
           return memberDao.insertMember(sqlSession, m);
  }

  @Override
  public int updateMember(Member m) {
           return memberDao.updateMember(sqlSession, m);
  }

  
    
      
    
  }
  

