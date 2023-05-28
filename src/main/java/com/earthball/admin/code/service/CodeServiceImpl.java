package com.earthball.admin.code.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.earthball.admin.code.mapper.CodeMapper;
import com.earthball.admin.code.vo.Code;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class CodeServiceImpl implements CodeService {

	private final CodeMapper codeMapper;

	@Override
	public int insertCode(Code code) {
		int result = codeMapper.insertCode(code);

//		log.info("Code 들어왔니? 서비스 : " + code);
//		log.info("result? 서비스 : " + result);

		return result;
	}

	@Override
	public List<Code> selectCodeList(String grpCode) {
		return codeMapper.selectCodeList(grpCode);
	}

	@Override
	public Code selectCode(String grpCode, String code) {
		return codeMapper.selectCode(grpCode, code);
	}

	@Transactional
	@Override
	public int updateCode(Code code) {

		log.info("service에 업데이트 넘어옴?:" + code);

		int result = codeMapper.updateCode(code);

		log.info("업데이트 result 나왔음? : " + result);

		return result;
	}

	@Override
	public int deleteCode(String grpCode, String code) {
		return codeMapper.deleteCode(grpCode, code);
	}

}
