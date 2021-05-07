require "minitest/autorun/assertions"
include Test::Unit::Assertions
require './17.rb'

arr = %w{ apple banana qiwi baseball antanta query queue balls alladin }

assert_equal(look_matches(arr, "a"), [apple, antanta, alladin])
