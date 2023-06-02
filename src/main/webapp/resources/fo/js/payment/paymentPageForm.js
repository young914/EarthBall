// 카카오페이 결제요청

// $(function() {
//     $("#payComplete").click(function() {
//         $.ajax({
//             url : "kakaopay",
//             dataType : "json",
//             success : function(rsp) {
//                 // alert(rsp.tid); //결제 고유 번호
//                 // console.log(rsp);

//                 var box = rsp.next_redirect_pc_url;
//                 // window.open(box); // 새창 열기
//                 location.href = box;
//             },
//             error : function(error) {
//                 alert(error);
//             }
//         });
//     });
// });

function orderPay() {

    IMP.init("imp43570318"); // 가맹점 식별코드

    IMP.request_pay({
      pg: "kakaopay.TC0ONETIME",	// kcp, kakaopay, +
      pay_method: "kakaopay",
      merchant_uid: 'merchant_' + new Date().getTime(),   // 주문번호
      name: $(".product_name").html(),
      amount: $(".totalAmount").html(),                         // 숫자 타입
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
					paymentToken : rsp.pg_tid
					},
					success : function(data) {

						console.log(data);
						var msg = "결제가 완료되었습니다.";
						alert(msg);
					},
					error : function() {

						console.log("ajax 실패");
						var msg = "결제에 실패하였습니다." + rsp.error_msg;
						alert(msg);

					}
            });

		} else {

			var msg = "결제 실패";
        	msg += "에러 내용" + rsp.error_msg;
        	alert(msg);
		}

		console.log("뭐지?");
		// document.location.href="/payment.pa";
	});

}

// $(function() {

// 	() => {

// 		$("#sameOrderUser").checked(function() {

// 			if($("#receiveName").val() != ${ loginUser.memberName }) {

// 				$("#receiveName").val() = ${ loginUser.memberName };
// 				$("#receivePhone").val() = ${ loginUser.phone };
// 				$("#postCode").val() = ${ loginUser.postCode };
// 				$("#address1").val() = ${ loginUser.address1 };
// 				$("#address2").val() = ${ loginUser.address2 };
// 			}

// 		}

// 	}
// });





