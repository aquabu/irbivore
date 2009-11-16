#! /usr/bin/env ruby
require 'rubygems'
require 'irb'
require 'irb/completion'
require 'boson'
require 'init.rb'
# include Irbivore::Livecoding
Boson.start :libraries => [Irbivore::Livecoding]
Irbivore::Livecoding.setup
IRB.start