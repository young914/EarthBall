package com.earthball.member.challenge.mapper;

import com.earthball.member.challenge.dto.ChaFileDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FileUpladMapper {

  int insertChaFile(ChaFileDto chaFileDto);

  Integer getFileNo();

}
