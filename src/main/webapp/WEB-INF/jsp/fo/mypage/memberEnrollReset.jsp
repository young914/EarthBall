<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
 *  {
        box-sizing: border-box; /*전체에 박스사이징*/
        outline: none; /*focus 했을때 테두리 나오게 */
     }

    body{
        font-family: 'Noto Sans KR', sans-serif;
        font-size:14px;
        background-color: #f5f6f7;
        line-height: 1.5em;
        color : #222;
        margin: 0;
    }

    a{
        text-decoration: none;
        color: #222;
    }

    /*member sign in*/
    .member{
        width: 400px;
        /* border: 1px solid #000; */
        margin: auto; /*중앙 정렬*/
        padding: 0 px;
        margin-bottom: 20px;
    }

    .member .logo{
        /*로고는 이미지라 인라인 블록이니까 마진 오토 안됨 블록요소만 됨 */
        display: block;
        margin :60px px;
    }

    .member .field{
        margin :5px 0; /*상하로 좀 띄워주기*/
    }

    .logo {
        width: 345px;
    }

    .member b{
        /* border: 1px solid #000; */
        display: block; /*수직 정렬하기 */
        margin-bottom: 5px;
    }

    /*input 중 radio 는 width 가 100%면 안되니까 */
    .member input:not(input[type=radio]),.member select{
        border: 1px solid #dadada;
        padding: 15px;
        width: 100%;
        margin-bottom: 5px;
    }

    .member input[type=button],
    .member input[type=submit]{
    background-color: #19A7CE;
    color:#fff
    }

    .member input:focus, .member select:focus{
        border: 1px solid #19A7CE;
    }

    .field.birth div{ /*field 이면서 birth*/
        display: flex;
        gap:10px; /*간격 벌려줄때 공식처럼 사용핟나 */
    }

    /* .field.birth div > * {  gap 사용한거랑 같은 효과를 줌 
        flex:1;
    } */

    .field.tel-number div {
        display: flex;
    }

    .field.tel-number div input:nth-child(1){
        flex:2;
    }

    .field.tel-number div input:nth-child(2){
        flex:1;
    }

    .field.gender div{
        border: 1px solid #dadada;
        padding: 15px 5px;
        background-color: #fff;
    }

    .placehold-text{
        display: block; /*span 으로 감싸서 크기영역을 블록요소로 만들어ㅜ저야한다*/
        position:relative;
        /* border: 1px solid #000; */
    }

    .placehold-text:before{ 
        position:absolute; /*before은 inline 요소이기 때문에 span으로 감싸줌 */
        right : 1px;
        top:13px;
        pointer-events: none; /*자체가 가지고 있는 pointer event 를 없애준다 */
    }

    .userpw{
        background:url(./images/images2/icon-01.png) no-repeat center right 15px;
        background-size: 20px;
        background-color: #fff;
    }

    .userpw-confirm{
        background:url(./images/images2/icon-02.png) no-repeat center right 15px;
        background-size: 20px;
        background-color: #fff;
    }

    .member-footer {
        text-align: center;
        font-size: 12px;
        margin-top: 20px;
    }

    .member-footer div a:hover{
        text-decoration: underline;
        color:#19A7CE;
    }

    .member-footer div a:after{
        content:'|';
        font-size: 10px;
        color:#bbb;
        margin-right: 5px;
        margin-left: 7px;
        /*살짝 내려가 있기 때문에 위로 올려주기 위해 transform 사용하기*/
        display: inline-block;
        transform: translateY(-1px);

    }
    
    #submit1:hover {
    	cursor: pointer;
	}
	
	#button1:hover {
		cursor:pointer;
	}
    .member-footer div a:last-child:after{
        display: none;
    }

    @media (max-width:768px) {
        .member{
            width: 100%;
        }
    }

</style>
<title>회원 정보 수정</title>
</head>
<body>
    
    <div class="member">
        <!-- 1. 로고 -->
        <a href="/">
        <img class="logo" src="/resources/fo/img/logo2.png" alt="지구공 로고">
							 </a>
    <form action="update.me" method="post">
        <!-- 2. 필드 -->
        <div class="field">
            <b>아이디 *</b>
            <span class="placehold-text">
            <input type="text" name="memberId" value="${loginUser.memberId }" readonly></span>
        </div>
        <div class="field">
            <b>비밀번호 *</b>
            <input class="userpw" type="password" placeholder="8자 이상 - 대문자 특수문자 포함 비밀번호를 입력해주세요" name="memberPwd">
        </div>
        <div class="field">
            <b>비밀번호 재확인 *</b>
            <input class="userpw-confirm" type="password" placeholder="다시한번 입력해주세요">
        </div>
        <div class="field">
            <b>닉네임 *</b>
            <input type="text" name="memberName" value="${loginUser.memberName}">
        </div>

        <!-- 3. 필드(생년월일) -->
        <div class="field birth" >
            <b>생년월일 *</b>
            <div>
                <input type="date"  name="birthDate" id="birthDate" value="${loginUser.birthDate}">                
    	   </div>
    	 </div>

        <!-- 4. 필드(성별) -->
        <div class="field gender">
		    <b>성별</b>
		    <div>
		        <label><input type="radio" id="Male" value="M" name="gender" {{(gender === 'M') ? 'checked' : ''}}>남자</label>
		        <label><input type="radio" id="Female" value="F" name="gender" {{(gender === 'F') ? 'checked' : ''}}>여자</label>
		    </div>
		</div>

        <!-- 5. 이메일_전화번호 -->
        <div class="field">
            <b>본인 확인 이메일<small> *</small></b>
            <input type="email" placeholder="선택입력" name="email" value="${loginUser.email}">
        </div>
        
        <div class="field tel-number">
            <b>휴대전화 *</b>
            <select>
                <option value="" >대한민국 +82</option>
            </select>
            <div>
                <input type="tel" placeholder="전화번호 입력" name="phone" value="${loginUser.phone}">
                <input type="button" value="인증번호 받기" id="button1">
            </div>
            <input type="number" placeholder="인증번호를 입력하세요" disabled>
        </div>

        <!-- 6. 가입하기 버튼 -->
        <input type="submit" value="수정하기" id="submit1">

        </form>

        <!-- 7. 푸터 -->
        <div class="member-footer">
            <div>
                <a href="#none">이용약관</a>
                <a href="#none">개인정보처리방침</a>
                <a href="#none">회원정보 고객센터</a>
            </div>
            <span><a href="#none">Gigu0.</a></span>
        </div>
    </div>    

</body>
</html>