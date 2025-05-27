function KGpay(){
    var IMP = window.IMP;
    IMP.init('imp23623506'); // 가맹점 식별코드

    IMP.request_pay({
        pg: "inicis",                   // KG이니시스 설정
        pay_method: "card",             // 카드결제
        merchant_uid: 'merchant_' + new Date().getTime(),   //주문번호
        name: '결제테스트',             // 상품명
        amount: 100,                    // 결제금액
        buyer_email: 'iamport@siot.do', // 구매자 이메일
        buyer_name: '구매자',           // 구매자 이름
        buyer_tel: '010-1234-5678',     // 구매자 전화번호
        buyer_addr: '서울특별시 강남구 삼성동',   // 구매자 주소
        buyer_postcode: '123-456'       // 구매자 우편번호
    }, function(rsp) {
        if (rsp.success) {
            // 결제 성공 시 로직
            alert('결제가 완료되었습니다.\n' + 
                '고유ID : ' + rsp.imp_uid + '\n' +
                '상점 거래ID : ' + rsp.merchant_uid + '\n' +
                '결제 금액 : ' + rsp.paid_amount + '\n' +
                '카드 승인번호 : ' + rsp.apply_num);
                
            // 여기에 결제 성공 후 이동할 페이지 지정
            // location.href = '결제성공페이지URL';
            
        } else {
            // 결제 실패 시 로직
            alert('결제에 실패하였습니다.\n' + 
                '에러내용: ' + rsp.error_msg);
        }
    });
} 