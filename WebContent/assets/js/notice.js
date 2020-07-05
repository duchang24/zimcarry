$(function () {
	$('table tr td a').on('click', function(target) {
		
		$('#no_title').val('');
		$('#no_writer').val('');
		$('#no_content').html('');
		$('#no_content').val('');
		$('#og_file').val('');
		
		let no_title = "";
		let no_writer = "";
		let no_content = "";
		let no_hidden = "";
		let no_file = "";
			
		let noticeContent = new Array();
		let no_idx = $(this).parent().prev().html();
		console.log(no_idx);
			
		$.ajax({
			type: "GET",
			url: "./data/notice_ok.jsp?noIdx=" + no_idx,
			dataType: "json",
			success: function(noticeJSON) {
				no_title = noticeJSON.no_title;
				no_writer = noticeJSON.no_writer;
				no_content = noticeJSON.no_content;
				no_hidden = noticeJSON.no_hidden;
				no_file = noticeJSON.no_file;
					
				$('#no_title').val(no_title);
				$('#no_writer').val(no_writer);
				$('#no_content').val(no_content);
				$('#no_content').html(no_content);
				$('#og_file').val(no_file);
				if (no_hidden == 'n') {
					$('#no_hiddenno').prop('checked', true);
				} else {
					$('#no_hiddenyes').prop('checked', true);
				}
					
				$('#btn_wrap').html('<input type="submit" value="수정" id="btn_edit" name="btn_edit"> <input type="button" value="비우기" id="btn_clear">');
				$('#btn_clear').on('click', function() {
			 		$('#no_title').val('');
					$('#no_writer').val('');
					$('#no_content').html('');
					$('#btn_wrap').html('<input type="submit" value="작성" id="btn_write" name="btn_write">');
			  	});
			}
		});
	});
});

function checkForm() {
	
	if ($('#no_title').val() == '') {
		alert('제목을 입력해주세요');
		return false;
	}
	if ($('#no_writer').val() == '') {
		alert('작성자를 입력해주세요');
		return false;
	}
	if ($('#no_content').val() == '') {
		alert('내용을 입력해주세요');
		return false;
	}
	let no_hiddenCheck = false;
	for (let i = 0; i < $('[name="no_hidden"]').length; i++) {
   		if ($('[name="no_hidden"]').eq(i).is(':checked') == true) {
   			no_hiddenCheck = true;
  	    	break;
    	}
    }
	if (!no_hiddenCheck) {
		alert('숨김 여부를 체크해주세요');
		return false;
	}
	return true;
}