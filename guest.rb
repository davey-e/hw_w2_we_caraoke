class Guest

  attr_reader :first_name, :last_name, :wallet

  def initialize(first_name, last_name, wallet)
    @first_name = first_name
    @last_name = last_name
    @wallet = wallet
  end

end
