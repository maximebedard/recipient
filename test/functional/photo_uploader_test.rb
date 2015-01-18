require 'test_helper'

class PhotoUploaderTest < ActiveSupport::TestCase
  def setup
    @subject = FactoryGirl.create :ingredient
    @file = File.open "#{Rails.root}/test/files/orange.jpg"
    PhotoUploader.enable_processing = true
    @uploader = PhotoUploader.new @subject, :photo
  end

  def teardown
    PhotoUploader.enable_processing = false
    @uploader.remove!
  end

  # test 'resize to fill the picture to a 52x52 thumbnail' do
  #   thumb = @uploader.thumb
  #   assert_equals 52, thumb.width
  #   assert_equals 52, thumb.height
  # end

  # test 'resize to fill the picture to a 26x26 icon' do
  #   binding.pry
  #   ImageLoader.load_image(@uploader.icon)
  #   icon = @uploader.icon
  #   assert_equals 26, icon.width
  #   assert_equals 26, icon.height
  # end
end
