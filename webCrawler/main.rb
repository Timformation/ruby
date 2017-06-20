############################################################
#
# Name:         Timothy Sirchuk
# Assignment:   Webcrawler
# Date:         05/31/2017
# Class:        CIS 283 Ruby Programming (II)
# Description:  Gathers links + their: status, type and response codes from a website.
#
############################################################

require 'net/https'
require 'prawn'
require_relative 'linkChecker'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

checker = Link_checker.new(ARGV[0])

website = ARGV[0]

response = Net::HTTP.get_response(website, '/')

body = response.body

links = body.scan(/<a .*?\/a>/)


links.each do |object|
  object.scan(/href="(.+?)".*>(.+?)<\/a/)
  link = Link.new($1, $2)
  checker.add_link(link)
  link.check_link($1)
  puts "Link type for #{$1} checked..."
  link.check_code
  puts "Response code for #{$1} checked..."
end


Prawn::Document.generate("helloworld.pdf") do
  Prawn::Font::AFM.hide_m17n_warning = true
  move_down 5
  font "Helvetica", :size => 35
  text "#{checker.baseurl}", :align => :center

  move_down 5

  font "Helvetica", :size => 25
  text "Number of Links: #{checker.print_link_count.to_s}", :align => :center

  move_down 20

  font "Helvetica", :size => 18
  text "Valid URL's"

  move_down 15

  font "Helvetica", :size => 14
  text "#{checker.print_valid}".encode("Windows-1252", "UTF-8", invalid: :replace, undef: :replace), :align => :left

  move_down 20

  font "Helvetica", :size => 18
  text "Redirected URL's"

  move_down 20

  font "Helvetica", :size => 14
  text "#{checker.print_redirect}".encode("Windows-1252", "UTF-8", invalid: :replace, undef: :replace), :align => :left

  start_new_page
  font "Helvetica", :size => 18
  text "Invalid URL's"

  font "Helvetica", :size => 14
  text "#{checker.print_invalid}".encode("Windows-1252", "UTF-8", invalid: :replace, undef: :replace), :align => :left
end