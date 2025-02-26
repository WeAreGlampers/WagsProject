<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CDN 사용 설치 -->
<!-- EasePick CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@easepick/bundle@1.2.1/dist/index.css">

<!-- EasePick JS -->
<script src="https://cdn.jsdelivr.net/npm/@easepick/bundle@1.2.1/dist/index.umd.min.js"></script>

<!-- EasePick 적용 (초기화 및 설정) -->
<script>
	const allowedDates = [
		'2025-03-01',
        '2025-03-03',
        '2025-03-07',
        '2025-03-11',
        '2025-03-17',
        '2025-03-21',
	]
	
document.addEventListener("DOMContentLoaded", function () {
    const picker = new easepick.create({
        element: document.getElementById('datepicker'),
        css: [
            "https://cdn.jsdelivr.net/npm/@easepick/bundle@1.2.1/dist/index.css"
        ],
        plugins: ["RangePlugin","LockPlugin"], // 범위 선택 기능 활성화
        RangePlugin: {
            tooltip: true // 선택한 날짜 툴팁 표시
        },
        LockPlugin: {
	        format: "YYYY-MM-DD", // 날짜 포맷 설정
	        minDate: new Date(), // 오늘 이전 날짜 선택 불가
	        filter(date, picked) {
	            return allowedDates.includes(date.format('YYYY-MM-DD'));
	        } 
        }
    });
});
</script>



</head>
<body>
 <input id="datepicker" type="text" readonly placeholder="예약 날짜 선택" />



</body>
</html>