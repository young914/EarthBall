package com.kh.earthball.fo.member.service;

import com.kh.earthball.fo.member.mapper.MemberMapper;
import com.kh.earthball.fo.member.vo.Member;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

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

  @Override
  public int deleteMember(String memberId) {
    return 0;
  }

  @Override
  public int idCheck(String checkId) {
    return memberMapper.idCheck(checkId);
  }


}
  

