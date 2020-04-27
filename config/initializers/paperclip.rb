Paperclip.interpolates :paperclip_root do |_attachment, _style|
  Creds.get(:paperclip_path).presence || Rails.root.join('storage', Rails.env)
end

Paperclip::Attachment.default_options.merge!(
  path: ':paperclip_root/:class/:attachment/:id_partition/:basename-:style:dotextension',
  default_url: 'default/:class/:style/default.jpg'
)
