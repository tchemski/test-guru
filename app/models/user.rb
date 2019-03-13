class User < ApplicationRecord
  def tests(test_level = nil)
    t = Test.joins('INNER JOIN tests_users ON tests_users.test_id = tests.id')
            .where('tests_users.user_id = ?', id)
            .distinct
    t = t.where('level=?', test_level) if test_level
    t
  end
end
