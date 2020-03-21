# frozen_string_literal: true

require 'pry'
require 'test/unit'
Test::Unit::AutoRunner.default_runner = 'gtk2'

# @author Tyson Tiatia
module Stampr
    # The core controller for the testing engine
    class TestHarness
        def initialize(path)
            @path = path
            Dir.chdir @path
        end

        def create_test_classes
            get_all_test_folders(@path).each_with_index do |folder, i|
                if folder_valid?(folder)
                    TestFactory.make_test('test', folder, true)
                else
                    # throw exception in future
                end
            end

        end

        private

        def get_all_test_folders(path)
            folders = []
            Dir.open path do |dir|
                dir.entries.each do |location|
                    next if ['.', '..'].include? location
                    fullpath = dir.to_path + '\\' + location
                    folders << fullpath if File.directory? fullpath
                end
            end

            folders
        end

        def folder_valid?(folder) # rubocop:disable Metrics/AbcSize
            Dir.chdir folder
            subfolder1 = Dir.glob '\\expected'
            subfolder2 = Dir.glob '\\source'
            Dir.chdir @path

            !subfolder1.empty? && !subfolder2.empty? && File.directory?(Dir.pwd + '/' + subfolder1.first) && File.directory?(Dir.pwd + '/' + subfolder2.first)
        end
    end

    # Factory class responsible for creating test cases
    class TestFactory
        def self.make_test(name, path, positive)
            binding.pry
            test_klass = Class.new(Test::Unit::TestCase) do
                define_method :setup do
                    # Do something
                    puts 'SETUP'
                end

                define_method :teardown do
                    puts 'TEARDOWN'
                end

                define_method "test_#{name}".to_sym do
                    assert true
                end
            end

            Kernel.const_set name, test_klass
            test_klass
        end
    end
end

harness = Stampr::TestHarness.new('G:\\Tyson\\Documents\\Personal Projects\\Stampr\\stampr\\testing')
klasses = harness.create_test_classes
