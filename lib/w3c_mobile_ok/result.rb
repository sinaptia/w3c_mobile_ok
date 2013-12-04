module W3CMobileOk
  class Result
    attr_accessor :failures, :network_usage, :page_size, :resources, :score

    def initialize
      @failures = []
      @resources = []
    end
  end
end
