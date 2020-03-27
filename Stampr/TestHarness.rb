# frozen_string_literal: true

require 'pry'
require 'test/unit'
require  './RequireTemp.rb'
Test::Unit::AutoRunner.default_runner = 'gtk2'

module TempTest
    class TempTester < Test::Unit::TestCase
        def test_try_this()
            puts "THIS IS A TEST"
        end
    end
end
