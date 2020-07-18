$(function() {
	$('#all').on('click', function() {
		location.href='./reservation.jsp?btn=all';
	});
	$('#future').on('click', function() {
		location.href='./reservation.jsp?btn=future';
	});
	$('#past').on('click', function() {
		location.href='./reservation.jsp?btn=past';
	});
});

window.onload = function() {
	$('#all').removeClass('on');
	$('#future').removeClass('on');
	$('#past').removeClass('on');
	if ($('.card-title').text() == '모든 예약') {
		$('#all').addClass('on');
	} else if ($('.card-title').text() == '지난 예약') {
		$('#past').addClass('on');
	} else {
		$('#future').addClass('on');
	}
}