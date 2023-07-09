# frozen_string_literal: true

# The coolest program
class CoolProgram
  attr_reader :coolness

  def initialize
    @coolness = 11
  end
end

puts "Coolness: #{CoolProgram.new.coolness}/10"

require 'slack-ruby-client'

Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
end

client = Slack::Web::Client.new
client.auth_test

channels = client.conversations_list.channels

pp channels.map { |x| [x["id"], x["name"]] }

history = client.conversations_history(:channel => 'C05G3ATLFQB')

pp history["messages"].map { |x| [x["text"], x["ts"]]}
