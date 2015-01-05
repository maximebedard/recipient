require 'rails_helper'
require 'carrierwave/test/matchers'

describe PhotoUploader do
  include CarrierWave::Test::Matchers

  let(:resource) { FactoryGirl.create :ingredient }
  let(:file)     { File.open(File.join(Rails.root, 'spec', 'fixtures', 'orange.jpg')) }

  before do
    PhotoUploader.enable_processing = true
    @uploader = PhotoUploader.new(resource, :photo)
    @uploader.store!(file)
  end

  after do
    PhotoUploader.enable_processing = false
    @uploader.remove!
  end

  context 'the thumb version' do
    it { expect(@uploader.thumb).to have_dimensions(52, 52) }
  end

  context 'the icon version' do
    it { expect(@uploader.icon).to have_dimensions(26, 26) }
  end

  it 'should make the image readable only to the owner and not executable' do
    expect(@uploader).to have_permissions(0644)
  end
end
