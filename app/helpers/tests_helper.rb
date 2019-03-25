module TestsHelper
  TEST_LEVELS = %i[easy elementary advanced hard].freeze
  EXTRA_LEVEL = :hero

  def level(test)
    TEST_LEVELS[test.level] || EXTRA_LEVEL
  end
end
