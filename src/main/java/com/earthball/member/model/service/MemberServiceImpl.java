package com.earthball.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
<<<<<<< Updated upstream
import org.springframework.stereotype.Service;
import com.earthball.member.model.dao.MemberDao;
import com.earthball.member.model.vo.Member;

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

  
    
      
    
  }
  
=======
import com.earthball.member.model.dao.MemberDao;
import com.earthball.member.model.vo.Member;

public class MemberServiceImpl implements MemberService  {
  
    @Autowired
    private SqlSessionTemplate sqlSession;
    
    @Autowired
    private MemberDao memberDao;
  

  @Override
  public Member loginMember(Member m) {
  
    Member loginMember = memberDao.loginMember(sqlSession, m);
    
    return loginMember;
  }
  
  
>>>>>>> Stashed changes

