// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_self
//= require ckeditor/ckeditor

(function($) {
  $(function() {
    CKEDITOR.disableAutoInline = true;

    $('.page_fragment .edit_button').click(function(e) {
      $(this).parent('.page_fragment').children('.edit_button').hide();
      var fragment = $(this).parent('.page_fragment').children('.editable_area');
      var editor = CKEDITOR.instances[fragment.attr("id")];
      if (typeof(editor) == "undefined") {
        fragment.attr('contenteditable', true);
        CKEDITOR.inline(fragment.prop('id')).on('blur', function() {
          saveData(fragment, true);
        });
      }
      fragment.focus();
    });
  });

  $(window).unload(function() {
    $('.page_fragment .editable_area').each(function(index, element) {
      saveData(element, false);
    });
  });

  function saveData(element, async) {
    var dom_obj = $(element);
    var editor = CKEDITOR.instances[dom_obj.attr("id")];
    if (typeof(editor) != "undefined" && editor.checkDirty()) { // editor will be undefined if current user does not have permission to edit text
      var data = {};
      data["page"] = {};
      if (dom_obj.hasClass("full_page_title")) {
        data["page"]["title"] = editor.getData();
      } else {
        data["page"]["content"] = editor.getData();
      }
      $.ajax({"url": '/simple_cms/' + dom_obj.data("id"), "data": data, "async": async, "type": "POST"})
    }
    if (typeof(editor) != "undefined") {
      editor.destroy();
    }
    dom_obj.attr('contenteditable', false);
    dom_obj.parent('.page_fragment').children('.edit_button').show();
  }

  window['CKEDITOR_BASEPATH'] = "/assets/ckeditor/";

}(jQuery));

