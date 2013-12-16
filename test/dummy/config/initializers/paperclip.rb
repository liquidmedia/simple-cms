Paperclip::Attachment.default_options[:storage] = :s3
Paperclip::Attachment.default_options[:s3_credentials] = {
    :bucket => 'liquidmedia-lta-files-development-jeremie',
    :access_key_id => 'AKIAJD5QR62OCYY4I7AA',
    :secret_access_key => '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'
}