module HasPictures
  included do
    # Photo uploader (carrierware)
    mount_uploader :photo, PhotoUploader
  end
end
