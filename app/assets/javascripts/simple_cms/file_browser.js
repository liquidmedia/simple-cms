//= require jquery
//= require jquery_ujs
//= require_self

(function($) {
  $(function() {
    $('#file_browser .file').click(function() {
      console.log('file clicked on');
      var funcNum = getUrlParam( 'CKEditorFuncNum' );
      var fileUrl = $(this).data('url');
      console.log(funcNum);
      console.log(fileUrl);
      window.opener.CKEDITOR.tools.callFunction( funcNum, fileUrl );
      window.close();
    });

    $('#file_browser .folder').click(function() {
      $('#file_browser .folder').removeClass('selected');
      $(this).addClass('selected');
      var file_type = $(this).data('type')
      if (file_type === 'all') {
        $('#file_browser .file').show();
      } else {
        $('#file_browser .file').hide();
        $('#file_browser .file[data-type="' + file_type + '"]').show();
      }
    });
  });

  // Helper function to get parameters from the query string.
  function getUrlParam( paramName ) {
    var reParam = new RegExp( '(?:[\?&]|&)' + paramName + '=([^&]+)', 'i' ) ;
    var match = window.location.search.match(reParam) ;

    return ( match && match.length > 1 ) ? match[ 1 ] : null ;
  }

}(jQuery));