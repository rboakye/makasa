# config/initializers/paperclip.rb
if Rails.env.production?
Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
end

if Rails.env.development?
Paperclip::Attachment.default_options[:url] = "/assets/:class/:attachment/:id/:basename_:style.:extension"
Paperclip::Attachment.default_options[:path] = ":rails_root/app/assets/images/:class/:attachment/:id/:basename_:style.:extension"
end