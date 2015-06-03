module StarrableTest
  extend ActiveSupport::Concern
  included do
    test '#starred the starrable can only be done once' do
      @subject.starred(@user)
      assert_no_difference -> { @subject.stars.size } do
        @subject.starred(@user)
      end
    end

    test '#starred add a star to the starrable' do
      assert_difference -> { @subject.stars.size }, 1 do
        @subject.starred(@user)
      end
    end

    test '#starred a starrable' do
      star = @subject.starred(@user)
      assert_equal @user, star.user
      assert_equal @subject, star.starrable
    end

    test '#unstarred a starrable that is not starred does nothing' do
      assert_no_difference -> { @subject.stars.size } do
        @subject.unstarred(@user)
      end
    end

    test '#unstarred a starred starrable' do
      @subject.starred(@user)
      assert_difference -> { @subject.stars.size }, -1 do
        @subject.unstarred(@user)
      end
    end

    test '#starred?' do
      refute @subject.starred?(@user)
      @subject.starred(@user)
      assert @subject.starred?(@user)
    end

    test '#toggle_starred add star if not present' do
      @subject.toggle_starred(@user)
      assert @subject.starred?(@user)
    end

    test '#toggle_star remove star if present' do
      @subject.starred(@user)
      @subject.toggle_starred(@user)
      refute @subject.starred?(@user)
    end
  end
end
