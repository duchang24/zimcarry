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
		
		$(".main-panel").animate({
			scrollTop: 3000
		}, 500);
	});
});

