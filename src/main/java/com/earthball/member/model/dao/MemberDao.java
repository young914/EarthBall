package com.earthball.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.earthball.member.model.vo.Member;

@Repository
public class MemberDao {
  
<<<<<<< Updated upstream
  public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
        return sqlSession.selectOne("memberMapper.loginMember", m);
  }
  
  public int insertMember(SqlSessionTemplate sqlSession, Member m) {
        return sqlSession.insert("memberMapper.insertMember", m);
  }
=======
    public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
          return sqlSession.selectOne("memberMapper.loginMember", m);
    }
    
>>>>>>> Stashed changes

}
