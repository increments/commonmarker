require 'test_helper'

class CommonMarker::TestMaliciousness < Minitest::Test

  def test_init_with_false_type
    assert_raises NodeError do
      render = Node.new(99999)
    end
  end

end
