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
    window.editor = editor;
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
	window.editor = editor;
} )
.catch( error => {
	console.error( error );
} );