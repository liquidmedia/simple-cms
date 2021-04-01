module SimpleCms
  module FilesHelper

    def file_icon_url(file)
      case file_type(file)
        when 'image'
          file.upload.url(:thumb)
        when 'pdf'
          image_url 'simple_cms/file_icons/pdf.png'
        else
          image_url 'simple_cms/file_icons/any.png'
      end
    end

    def file_type(file)
      if file.upload_content_type.match(/image/)
        'image'
      elsif file.upload_content_type.match(/pdf/)
        'pdf'
      else
        'misc'
      end
    end

  end
end