require 'test_helper'

class PromotionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @promo = Promotion.new(
      code: "a",
      amount: "0.1"
      )
  end
  
  test "Promotion should be valid" do
    assert @promo.valid?
  end
  
  test "Promotion code should be present" do
    @promo.code = nil
    assert_not @promo.valid?
  end
  
  test "Promotion amount should be present" do
    @promo.amount = nil
    assert_not @promo.valid?
  end
  
  test "Promotion amount should not be 0%" do
    @promo.amount = "0"
    assert_not @promo.valid?
  end
  
  test "Promotion amount should not be 100%" do
    @promo.amount = "1"
    assert_not @promo.valid?
  end
  
  test "Promotion amount should only be float" do
    @promo.amount = "a"
    assert_not @promo.valid?
  end
end
