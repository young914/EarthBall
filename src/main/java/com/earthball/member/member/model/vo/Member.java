package com.earthball.member.member.model.vo;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Member {

    private String memberId; // 아이디
    private String memberPwd; // 비밀번호
    private String memberName; // 이름
    private String email; // 이메일
    private Date birthDate; // 생일
    private String phone; // 핸드폰 번호
    private String gender; // 성별
    private Date createdDate; // 생성일
    private String status; // 삭제여부
    private int totalPay; // 총 결제금액
    private String address1; // 메인주소
    private String address2; // 상세주소
    private String changeName; // 바뀐파일이름
    private int postCode; // 우편번호


}
