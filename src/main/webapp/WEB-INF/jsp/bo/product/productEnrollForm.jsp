<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<!-- =========================================================
* Sneat - Bootstrap 5 HTML Admin Template - Pro | v1.0.0
==============================================================

* Product Page: https://themeselection.com/products/sneat-bootstrap-html-admin-template/
* Created by: ThemeSelection
* License: You must have a valid license purchased in order to legally use the theme for your project.
* Copyright ThemeSelection (https://themeselection.com)

=========================================================
-->
<!-- beautify ignore:start -->
<html
    lang="kr"
    class="light-style layout-menu-fixed"
    dir="ltr"
    data-theme="theme-default"
    data-assets-path="/resources/admin/assets/"
    data-template="vertical-menu-template-free"
>
<head>
  <jsp:include page="/WEB-INF/jsp/bo/common/commonHead.jsp" />
  <style>
    .content{
      width: calc(100% - (1.625rem * 2));
      margin: 0.75rem auto 0;
      border-radius: 0.375rem;
      padding: 0 1.5rem;
      background-color: white;
      /* 그림자효과 */
      box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
    }
    .title{
      font-size: 1.5rem;
      font-weight: 600;
      margin-bottom: 1.5rem;
      margin-top: 1.5rem;
    }
	.insertForm{
		width: 100%;
	}
	.insertForm td{
		padding: 10px;
	}
	.btn-area{
		text-align: center;
		margin-top: 30px;
		margin-bottom: 30px;
	}
	.btn-area>*{
		width: 100px;
		height: 30px;
		border-radius: 10px;
		border: none;
		background-color: #19a7ce;
		color: white;
		font-weight: 600;
	}
	.btn-area>*:hover{
		background-color: #0d8db8;
	}
	.insertForm img{
		width: 300px;
		height: 300px;

	}
  </style>
</head>

<body>
<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
  <div class="layout-container">
    <!-- Menu -->

    <jsp:include page="/WEB-INF/jsp/bo/common/commonLayoutMenu.jsp">
      <jsp:param name="menuId" value="51"/>
    </jsp:include>
    <!-- / Menu -->

    <!-- Layout container -->
    <div class="layout-page">
      <!-- Navbar -->
      <jsp:include page="/WEB-INF/jsp/bo/common/commonLayoutNavbar.jsp" />
      <!-- / Navbar -->

      <!-- Content wrapper -->
      <div class="content-wrapper">
        <!-- Content -->
        <div class="content">
			<div class="listArea">
				<h1 class="title">상품 추가</h1>
				<form action="insert.pro" method="post" enctype="multipart/form-data">
					<div>
						<table class="insertForm">
							<tr>
								<td width="100">상품명</td>
								<td><input type="text" name="productName" required></td>
							</tr>
							<tr>
								<td>카테고리</td>
								<td>
									<select name="category" required>
										<option value="전체">전체</option>
										<option value="욕실">욕실</option>
										<option value="식품">식품</option>
										<option value="주방">주방</option>
										<option value="생활">생활</option>
										<option value="취미">취미</option>
										<option value="음료용품">음료용품</option>
										<option value="여성용품">여성용품</option>
										<option value="반려동물">반려동물</option>
										<option value="화장품">화장품</option>
										<option value="문구">문구</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>가격</td>
								<td><input type="number" name="price" required></td>
							</tr>
							<tr>
								<td>할인률</td>
								<td><input type="number" name="discount" required></td>
							</tr>
							<tr>
								<td>재고</td>
								<td><input type="number" name="stock" required></td>
							</tr>
							<tr>
								<td>사진</td>
								<td>
									<table class="fileArea">
										<tr>
											<td>1번<input type="file" name="upfile1" onchange="loadImg(this, 1);" required> <img id="preview1"></td>
											<td>2번<input type="file" name="upfile2" onchange="loadImg(this, 2);"> <img id="preview2"></td>
										</tr>
										<tr>
											<td>3번<input type="file" name="upfile3" onchange="loadImg(this, 3);"> <img id="preview3"></td>
											<td>4번<input type="file" name="upfile4" onchange="loadImg(this, 4);"> <img id="preview4"></td>
										</tr>
										<tr>
											<td>5번<input type="file" name="upfile5" onchange="loadImg(this, 5);"> <img id="preview5"></td>
											<td>6번<input type="file" name="upfile6" onchange="loadImg(this, 6);"> <img id="preview6"></td>
										</tr>
										<tr>
											<td>7번<input type="file" name="upfile7" onchange="loadImg(this, 7);"> <img id="preview7"></td>
											<td>8번<input type="file" name="upfile8" onchange="loadImg(this, 8);"> <img id="preview8"></td>
										</tr>
										<tr>
											<td>9번<input type="file" name="upfile9" onchange="loadImg(this, 9);"> <img id="preview9"></td>
											<td>10번<input type="file" name="upfile10" onchange="loadImg(this, 10);"> <img id="preview10"></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</div>
					<div class="btn-area">
						<button type="submit">추가</button>
						<input type="button" value="취소" onclick="window.history.back();">

					</div>
				</form>
			</div>
	    </div>
        <!-- / Content -->


        <!-- Footer -->
        <footer class="content-footer footer bg-footer-theme">
          <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
            <div class="mb-2 mb-md-0">
              ©
              <script>
                  document.write(new Date().getFullYear());
              </script>
            </div>
          </div>
        </footer>
        <!-- / Footer -->

        <div class="content-backdrop fade"></div>
      </div>
      <!-- Content wrapper -->
    </div>
    <!-- / Layout page -->
  </div>

  <!-- Overlay -->
  <div class="layout-overlay layout-menu-toggle"></div>
</div>
<jsp:include page="/WEB-INF/jsp/bo/common/commonScript.jsp" />
<script type="text/javascript">
	$(function(){
		$(".fileArea input[type=file]").hide();

		$("#preview1").click(function(){
			$("input[name=upfile1]").click();
		});
		$("#preview2").click(function(){
			$("input[name=upfile2]").click();
		});
		$("#preview3").click(function(){
			$("input[name=upfile3]").click();
		});
		$("#preview4").click(function(){
			$("input[name=upfile4]").click();
		});
		$("#preview5").click(function(){
			$("input[name=upfile5]").click();
		});
		$("#preview6").click(function(){
			$("input[name=upfile6]").click();
		});
		$("#preview7").click(function(){
			$("input[name=upfile7]").click();
		});
		$("#preview8").click(function(){
			$("input[name=upfile8]").click();
		});
		$("#preview9").click(function(){
			$("input[name=upfile9]").click();
		});
		$("#preview10").click(function(){
			$("input[name=upfile10]").click();
		});
	});

	function loadImg(input, num){
		if(input.files.length == 1){
			let reader = new FileReader();
			reader.readAsDataURL(input.files[0]);
			reader.onload = function(e){
				switch(num){
					case 1 : $("#preview1").attr("src", e.target.result); break;
					case 2 : $("#preview2").attr("src", e.target.result); break;
					case 3 : $("#preview3").attr("src", e.target.result); break;
					case 4 : $("#preview4").attr("src", e.target.result); break;
					case 5 : $("#preview5").attr("src", e.target.result); break;
					case 6 : $("#preview6").attr("src", e.target.result); break;
					case 7 : $("#preview7").attr("src", e.target.result); break;
					case 8 : $("#preview8").attr("src", e.target.result); break;
					case 9 : $("#preview9").attr("src", e.target.result); break;
					case 10 : $("#preview10").attr("src", e.target.result); break;
				}
			};
		}else{
			switch(num){
				case 1 : $("#preview1").attr("src", null); break;
				case 2 : $("#preview2").attr("src", null); break;
				case 3 : $("#preview3").attr("src", null); break;
				case 4 : $("#preview4").attr("src", null); break;
				case 5 : $("#preview5").attr("src", null); break;
				case 6 : $("#preview6").attr("src", null); break;
				case 7 : $("#preview7").attr("src", null); break;
				case 8 : $("#preview8").attr("src", null); break;
				case 9 : $("#preview9").attr("src", null); break;
				case 10 : $("#preview10").attr("src", null); break;
			}
		}
	}
</script>
</body>
</html>