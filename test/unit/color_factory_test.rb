require 'test_helper'

class ColorFactoryTest < ActiveSupport::TestCase
  test '#create_random_pastel generate a pastel color' do
    Kernel.stubs(:rand).with(256).returns(150, 200, 250)
    color = ColorFactory.create_random_pastel
    assert_equal((150 + 255) / 2, color.red)
    assert_equal((200 + 255) / 2, color.green)
    assert_equal((250 + 255) / 2, color.blue)
    assert_equal('CAE3FC', color.to_hex)
  end
end
