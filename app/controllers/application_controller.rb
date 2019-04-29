class ApplicationController < ActionController::API
  before_action :puts_hi_100_times

  def puts_hi_100_times
    puts "hi" * 100
  end
end
