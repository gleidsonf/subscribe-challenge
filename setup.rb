# frozen_string_literal: true

$LOAD_PATH << File.expand_path('.')

require 'input/process'

require 'product/record'
require 'product/tax_calculator'
require 'product/classifier'

filepath = ARGV[0]

if filepath.nil?
  puts "Please provide a filepath"
  exit 1
end

input = File.read(filepath)

Input::Process.new(input:).call
