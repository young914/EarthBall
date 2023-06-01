package com.earthball.member.model.service;

import org.springframework.stereotype.Service;
import com.earthball.member.model.dao.MemberMapper;
import com.earthball.member.model.vo.Member;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
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





  }


