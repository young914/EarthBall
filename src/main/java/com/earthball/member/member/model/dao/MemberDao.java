package com.earthball.member.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.earthball.member.member.model.vo.Member;

@Repository
public class MemberDao {
  
  public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
        return sqlSession.selectOne("memberMapper.loginMember", m);
  }
  
  public int insertMember(SqlSessionTemplate sqlSession, Member m) {
        return sqlSession.insert("memberMapper.insertMember", m);
  }
  
  public int updateMember(SqlSessionTemplate sqlSession, Member m) {
        
       
    int result = sqlSession.update("memberMapper.updateMember", m);
    
    System.out.println("Dao result" + result);
    
    return result;
  }

}
