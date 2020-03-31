require "csv"

require_relative "dataset"

 module Datasets
   class Housing < Dataset
     Record = Struct.new(
       :foo
     )
    def initialize
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
