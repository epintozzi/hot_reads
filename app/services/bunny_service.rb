class BunnyService

  attr_reader :receive_read

  def initialize
    connection = Bunny.new(
      :host => "experiments.turing.io",
      :port => "5672",
      :user => "student",
      :pass => "PLDa{g7t4Fy@47H"
    )
    connection.start
    channel = connection.create_channel
    @receive_read = channel.queue("ep.read.link")
  end


  def receive_link
    @receive_read.subscribe do |delivery_info, metadata, payload|
      link = Link.create(url: payload)
      # link.read_count += 1
      # link.save
    end
  end

end
