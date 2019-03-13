class User < ApplicationRecord
  def tests(test_level)
    Test.joins('INNER JOIN tests_users ON tests_users.test_id = tests.id')
        .where('tests_users.user_id = ? AND level=?', id, test_level)
        .distinct
  end
end
