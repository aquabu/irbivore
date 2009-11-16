#! /usr/bin/env ruby
require 'rubygems'
require 'irb'
require 'irb/completion'
require 'boson'
require File.expand_path(File.dirname(__FILE__)) + '/init.rb'
# include Irbivore::Livecoding
puts "\n\n\n"
puts "Irbivore welcomes you"
puts "Commands: midiator_start, play"
Boson.start :libraries => [Irbivore::Livecoding]
Irbivore::Livecoding.setup
IRB.start
