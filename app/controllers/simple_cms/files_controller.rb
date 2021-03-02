class SimpleCms::FilesController < ApplicationController

  skip_before_action :verify_authenticity_token

  def browse
    @files = SimpleCms::File.order(:upload_file_name)
    render layout: 'simple_cms/layouts/file_browser'
  end

  def upload
    params.permit!
    @file = SimpleCms::File.create(upload: params[:upload])
    render html: "<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction(#{params[:CKEditorFuncNum]}, '#{@file.upload.url}', '');</script>".html_safe
  end

end