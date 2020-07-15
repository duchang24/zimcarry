let qEditor;
let aEditor;

ClassicEditor
.create( document.querySelector( '#fQuestion' ), {
    toolbar: {
        items: [
            'heading',
            '|',
            'bold',
            'italic',
            '|',
            'indent',
            'outdent',
            '|',
            'undo',
            'redo'
        ]
    },
    language: 'ko',
    licenseKey: '',
} )
.then( editor => {
	qEditor = editor;
} )
.catch( error => {
    console.error( error );
} );
ClassicEditor
.create( document.querySelector( '#fAnswer' ), {
	toolbar: {
		items: [
			'heading',
			'|',
			'bold',
			'italic',
			'|',
			'indent',
			'outdent',
			'|',
			'undo',
			'redo'
			]
	},
	language: 'ko',
	licenseKey: '',
} )
.then( editor => {
	aEditor = editor;
} )
.catch( error => {
	console.error( error );
} );

$(document).ready(function() {
	$('.btn_edit').on('click', function() {
		
		let fIdx = $(this).val();
		let fQuestion = $(this).parent().parent().parent().find('.q_area').text().trim();
		let fAnswer = $(this).parent().parent().parent().next().find('div').html().trim();
		let fHidden = $(this).parent().parent().find('p.data').text().trim().split('//')[1].split(':')[1].trim();

		$('#noIdx').val('');
		qEditor.setData('');
		aEditor.setData('');
		
		$('#noIdx').val(fIdx);
		qEditor.setData(fQuestion);
		aEditor.setData(fAnswer);
		if (fHidden == 'x') {
			$("input:radio[name='fHidden']:radio[value='x']").prop('checked', true);
		} else {
			$("input:radio[name='fHidden']:radio[value='o']").prop('checked', true);
		}
		
		$('#btn_wrap').html('<input type="submit" value="수정"> <input type="button" value="비우기(취소)">');
		
		$('input:button[value="비우기(취소)"]').on('click', function() {
			$('#noIdx').val('');
			qEditor.setData('');
			aEditor.setData('');
			$("input:radio[name='fHidden']:radio[value='x']").prop('checked', false);
			$("input:radio[name='fHidden']:radio[value='o']").prop('checked', false);
			$('#btn_wrap').html('<input type="submit" value="등록" id="btn_write" name="btn_write">');
		});
		
		$(".main-panel").animate({
			scrollTop: 3000
		}, 500);
	});
});

function checkFaq() {
	if (qEditor.getData() == null || qEditor.getData() == '') {
		alert('질문을 작성하세요');
		return false;
	}
	if (aEditor.getData() == null || aEditor.getData() == '') {
		alert('답변을 작성하세요');
		return false;
	}
	let f_hiddenCheck = false;
	for (let i = 0; i < $('input:radio[name="fHidden"]').length; i++) {
   		if ($('input:radio[name="fHidden"]').eq(i).is(':checked') == true) {
   			no_hiddenCheck = true;
   			console.log('체크됨')
  	    	break;
    	}
    }
	if (!f_hiddenCheck) {
		alert('숨김 여부를 체크해주세요');
		return false;
	}
	return true;
}
