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

.dropdown-menu {
    display: none;
    position: absolute;
    top: 100%;
    left: 0;
    background-color: white;
    border: 1px solid #ddd;
    min-width: 150px;
    box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    z-index: 1000;
}

.dropdown-menu li {
    padding: 8px 12px;
}

.dropdown-menu li a {
    color: #333;
    text-decoration: none;
    display: block;
}

.dropdown-menu li a:hover {
    background-color: #f0f0f0;
}

/* Bootstrap 드롭다운 표시 방식으로 변경 */
.dropdown:hover .dropdown-menu {
    display: none;
}

.dropdown.show .dropdown-menu {
    display: block;
}

/* 드롭다운 토글 버튼 스타일 */
.nav-link.dropdown-toggle::after {
    display: inline-block;
    margin-left: 0.255em;
    vertical-align: 0.255em;
    content: "";
    border-top: 0.3em solid;
    border-right: 0.3em solid transparent;
    border-bottom: 0;
    border-left: 0.3em solid transparent;
}

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // 드롭다운 토글 버튼 클릭 이벤트
        var dropdownToggles = document.querySelectorAll('.dropdown-toggle');
        dropdownToggles.forEach(function(toggle) {
            toggle.addEventListener('click', function(e) {
                e.preventDefault();
                var parent = this.parentElement;
                parent.classList.toggle('show');
            });
        });

        // 드롭다운 외부 클릭시 닫기
        document.addEventListener('click', function(e) {
            if (!e.target.closest('.dropdown')) {
                var dropdowns = document.querySelectorAll('.dropdown');
                dropdowns.forEach(function(dropdown) {
                    dropdown.classList.remove('show');
                });
            }
        });
    });
</script> 