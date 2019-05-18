class KDDCupTest < Test::Unit::TestCase
  def setup
    @dataset = Datasets::KDDCup.new
  end

  def record(*args)
    Datasets::KDDCup::Record.new(*args)
  end

  test("#each") do
    records = @dataset.each.to_a
    assert_equal([
                    4898431,
                    {},
                    {}
                 ],
                 [
                   records.size,
                   records[0],
                   records[-1],
                 ])
  end

  sub_test_case("#metadata") do
    test("#description") do
      omit("Skip temporarily")
      description = @dataset.metadata.description
      assert do
        description.start_with?("1. Title: KDDCup Plants Database")
      end
    end
  end
end
