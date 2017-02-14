class BunnyService

  attr_reader :send_read

  def initialize
    connection = Bunny.new(
      :host => "experiments.turing.io",
      :port => "5672",
      :user => "student",
      :pass => "PLDa{g7t4Fy@47H"
    )
    connection.start
    channel = connection.create_channel
    @receive_read = channel.queue("read.link")
  end


  def receive_link
    @receive_read.subscribe do |delivery_info, metadata, payload|
    puts "Got: #{payload}"
  
    end
  end

end
