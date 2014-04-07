/* Korean initialisation for the jQuery calendar extension. */
/* Written by DaeKwon Kang (ncrash.dk@gmail.com), Edited by Genie. */
jQuery(function($){
	$.datepicker.regional['ko'] = {
		closeText: '닫기',
		prevText: '이전달',
		nextText: '다음달',
		currentText: '오늘',
		monthNames: ['1월','2월','3월','4월','5월','6월',
		'7월','8월','9월','10월','11월','12월'],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월',
		'7월','8월','9월','10월','11월','12월'],
		dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
		dayNamesShort: ['일','월','화','수','목','금','토'],
		dayNamesMin: ['일','월','화','수','목','금','토'],
		weekHeader: 'Wk',
		dateFormat: 'yy-mm-dd',
		firstDay: 0,
		changeMonth: true,  // 월변경 가능
		changeYear: true,  // 연변경 가능
		isRTL: false,
		buttonImageOnly: true,  // 이미지 표시
		buttonImage: '/img/icon_date.gif', // 이미지 주소
		yearRange: 'c-99:c+99', // 1990~2020년 까지
		maxDate: '+6Y',   // 오늘 부터 6년 후까지만.  +0d 오늘 이전 날짜만 선택
		minDate: '-3Y'};             // 30일 이전까지만 선택 가능    };
	$.datepicker.setDefaults($.datepicker.regional['ko']);
});


