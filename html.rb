#!/usr/bin/env ruby

require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'rqrcode'
end

require 'base64'
require 'csv'
require 'erb'

class BasicErb
  def initialize
    @qrcodes = CSV.read('qrcodes.csv', encoding: 'utf-8', headers: true)
    @template = File.read('./qrcodes.html.erb')
  end

  def render
    ERB.new(@template).result(binding)
  end
end

STDOUT.write BasicErb.new.render
