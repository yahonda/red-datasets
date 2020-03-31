require "csv"

require_relative "dataset"

 module Datasets
   class Housing < Dataset
     Record = Struct.new(
       :crim,
       :zn,
       :indus,
       :chas,
       :nox,
       :rm,
       :age,
       :dis,
       :rad,
       :tax,
       :ptratio,
       :b,
       :lstat,
       :medv
     )
    def initialize
      super()
      @metadata.id = "housing"
      @metadata.name = "Housing"
      @metadata.url = "TODO"
      @metadata.description = lambda do
        read_names
      end
    end

    def each
    end

    private
    def base_url
      "https://archive.ics.uci.edu/ml/machine-learning-databases/housing/"
    end

    def open_data
    end
    def read_names

    end
   end

 end
