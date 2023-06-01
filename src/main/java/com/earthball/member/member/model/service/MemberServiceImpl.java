package com.earthball.member.member.model.service;

import org.springframework.stereotype.Service;
import com.earthball.member.member.controller.MemberController;
import com.earthball.member.member.model.mapper.MemberMapper;
import com.earthball.member.member.model.vo.Member;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

      private final MemberMapper memberMapper;
    
  @Override
  public Member loginMember(Member m) {
    
    return memberMapper.loginMember(m);
            }

  @Override
  public int insertMember(Member m) {
            return memberMapper.insertMember(m);
  }

  @Override
  public int updateMember(Member m) {
            return memberMapper.updateMember(m);
  }

  
    
      
    
  }
  

