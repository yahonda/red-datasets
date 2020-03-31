class HousingTest < Test::Unit::TestCase

  def setup
    @dataset = Datasets::Housing.new
  end

  def record(*args)
    Datasets::Housing::Record.new(*args)
  end

  test('#each') do
    records = @dataset.each.to_a
    assert_equal([
      506,
      {
        :crim => 0.00632,
        :zn => 18.00,
        :indus => 2.310,
        :chas => 0,
        :nox => 0.5380,
        :rm => 6.5750,
        :age => 65.20,
        :dis => 4.0900,
        :rad => 1,
        :tax => 296.0,
        :ptratio => 15.30,
        :b => 396.90,
        :lstat => 4.98,
        :medv => 24.00
      },
      {
        :crim => 0.04741,
        :zn => 0.00,
        :indus => 11.930,
        :chas => 0,
        :nox => 0.5730,
        :rm => 6.0300,
        :age => 80.80,
        :dis => 2.5050,
        :rad => 1,
        :tax => 273.0,
        :ptratio => 21.00,
        :b => 396.90,
        :lstat => 7.88,
        :medv => 11.90
      }
    ],
    [
        records.size,
        records[0].to_h,
        records[-1].to_h
    ]
  )
  end

  sub_test_case("#metadata") do
     test("#description") do
       description = @dataset.metadata.description
       assert do
        description.start_with?("The Boston Housing Dataset")
       end
     end
   end
end
