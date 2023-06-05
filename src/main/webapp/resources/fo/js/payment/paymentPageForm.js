//카카오페이 결제요청

//$(function() {
//  $("#payComplete").click(function() {
//      $.ajax({
//          url : "kakaopay",
//          dataType : "json",
//          success : function(rsp) {
//              // alert(rsp.tid); //결제 고유 번호
//              // console.log(rsp);

//              var box = rsp.next_redirect_pc_url;
//              // window.open(box); // 새창 열기
//              location.href = box;
//          },
//          error : function(error) {
//              alert(error);
//          }
//      });
//  });
//});

function orderPay() {

	let today = new Date();
	let year = today.getFullYear(); // 년도
	let month = ('0' + (today.getMonth() + 1)).slice(-2);;  // 월
	let date = ('0' + today.getDate()).slice(-2);  // 일
	let hours = ('0' + today.getHours()).slice(-2); // 시
	let minutes = ('0' + today.getMinutes()).slice(-2);  // 분
	let seconds = ('0' + today.getSeconds()).slice(-2);  // 초
	let milliseconds = ('0' + today.getMilliseconds()).slice(-2); // 밀리초

	IMP.init("imp43570318"); // 가맹점 식별코드

	if($("input[name=pay]:checked").val() === "KGinisis") {

		// 카드결제 (KG이니시스)

		console.log($(".realTotalAmount").html());

		IMP.request_pay({
			pg: "html5_inicis.INIpayTest",	// KGinisis
			pay_method: "card",
			merchant_uid: "" + year+month+date+hours+minutes+seconds+milliseconds,   // 주문번호
			name: $(".product_name").html(),
			amount: $(".realTotalAmount").html(),                         // 숫자 타입
			buyer_email: $("#email").html(),
			buyer_name: $("#name").html(),
			buyer_tel: $("#receivePhone").val(),
			buyer_addr: $("#address1").val() + " " + $("#address2").val(),
			buyer_postcode: $("#postCode").val(),
		}, function (rsp) { // callback
			//rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
				console.log(rsp);

				// console.log("rep.success : " + rsp.success);

				if(rsp.success) {

					// var msg = "결제 완료";
		   //       msg += '고유ID : ' + rsp.imp_uid;                //아임포트 uid는 실제 결제 시 결제 고유번호를 서버와 비교해서 결제처리하는데 필요없긴함.
		   //       msg += '// 상점 거래ID : ' + rsp.merchant_uid;
		   //       msg += '// 결제 금액 : ' + rsp.paid_amount;
		   //       msg += '// 카드 승인번호 : ' + rsp.apply_num;

					console.log(rsp.imp_uid);

					console.log("----------");
					console.log(rsp.merchant_uid);
					console.log($('.sessionMemberId').val());
					console.log(rsp.pg_provider);
					console.log(rsp.paid_amount);
					console.log(rsp.buyer_name);
					console.log(rsp.buyer_tel);
					console.log(rsp.buyer_postcode);
					console.log(rsp.pg_tid);
					console.log("----------");
					console.log();

					$.ajax({
					url : "/paySuccess",
					type : "post",
					// async : true,
					data : {
						paymentNo : rsp.merchant_uid,
						memberId : $('.sessionMemberId').val(),
						paymentType : rsp.pg_provider,
						paymentTotal : rsp.paid_amount,
						receiveName : rsp.buyer_name,
						receivePhone : rsp.buyer_tel,
						postCode : rsp.buyer_postcode,
						receiveAddress1 : $("#address1").val(),
						receiveAddress2 : $("#address2").val(),
						deliveryComent : $("#deliveryComent").val(),
						paymentToken : rsp.pg_tid
					},
					success : function(data) {

						console.log("db insert 결과 : " + data);

						if(data == 1) {
							var msg = "결제가 완료되었습니다.";
							alert(msg);
							document.location.href="/payComplete.pa";
						} else {
							var msg = "결제에 실패하였습니다. 다시 시도해 주세요.";
							alert(msg);
						}
					},
					error : function() {

						console.log("ajax 실패");
						var msg = "결제에 실패하였습니다." + rsp.error_msg;
						alert(msg);
					}
				});

			} else {

				var msg = "결제 실패 : ";
		     	msg += rsp.error_msg;
		     	alert(msg);
			}
		});

	} else if($("input[name=pay]:checked").val() === "kakaopay") {

		// 카카오페이 결제
		console.log($(".totalAmount").html());

		IMP.request_pay({
			pg: "kakaopay.TC0ONETIME",	// kakaopay
			pay_method: "kakaopay",
			merchant_uid: "" + year+month+date+hours+minutes+seconds+milliseconds,   // 주문번호
			name: $(".product_name").html(),
			amount: $(".realTotalAmount").html(),                         // 숫자 타입
			buyer_email: $("#email").html(),
			buyer_name: $("#name").html(),
			buyer_tel: $("#receivePhone").val(),
			buyer_addr: $("#address1").val() + $("#address2").val(),
			buyer_postcode: $("#postCode").val()
		}, function (rsp) { // callback
			//rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
				console.log(rsp);

				// console.log("rep.success : " + rsp.success);

				if(rsp.success) {

					// var msg = "결제 완료";
		   //       msg += '고유ID : ' + rsp.imp_uid;                //아임포트 uid는 실제 결제 시 결제 고유번호를 서버와 비교해서 결제처리하는데 필요없긴함.
		   //       msg += '// 상점 거래ID : ' + rsp.merchant_uid;
		   //       msg += '// 결제 금액 : ' + rsp.paid_amount;
		   //       msg += '// 카드 승인번호 : ' + rsp.apply_num;

					console.log(rsp.imp_uid);

					console.log("----------");
					console.log(rsp.merchant_uid);
					console.log($('.sessionMemberId').val());
					console.log(rsp.pg_provider);
					console.log(rsp.paid_amount);
					console.log(rsp.buyer_name);
					console.log(rsp.buyer_tel);
					console.log(rsp.buyer_postcode);
					console.log(rsp.pg_tid);
					console.log("----------");
					console.log();

					$.ajax({
					url : "/paySuccess",
					type : "post",
					// async : true,
					data : {
						paymentNo : rsp.merchant_uid,
						memberId : $('.sessionMemberId').val(),
						paymentType : rsp.pg_provider,
						paymentTotal : rsp.paid_amount,
						receiveName : rsp.buyer_name,
						receivePhone : rsp.buyer_tel,
						postCode : rsp.buyer_postcode,
						receiveAddress1 : $("#address1").val(),
						receiveAddress2 : $("#address2").val(),
						deliveryComent : $("#deliveryComent").val(),
						paymentToken : rsp.pg_tid
					},
					success : function(data) {

						console.log("db insert 결과 : " + data);

						if(data == 1) {
							var msg = "결제가 완료되었습니다.";
							alert(msg);
							document.location.href="/payComplete.pa";
						} else {
							var msg = "결제에 실패하였습니다. 다시 시도해 주세요.";
							alert(msg);
						}
					},
					error : function() {

						console.log("ajax 실패");
						var msg = "결제에 실패하였습니다." + rsp.error_msg;
						alert(msg);
					}
	         });

			} else {

				var msg = "결제 실패 : ";
		     	msg += rsp.error_msg;
		     	alert(msg);
			}
		});
	}



}

