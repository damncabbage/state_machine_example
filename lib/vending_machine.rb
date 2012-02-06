require 'state_machine'

class VendingMachine

  attr_accessor :tray

  def initialize
  	self.tray = []
    super
  end

  state_machine :state, :initial => :idle do
    state :idle
    state :awaiting_selection

    event :insert_dollar do
      transition :idle => :awaiting_selection
    end

    event :push_button do
      transition :awaiting_selection => :idle
    end

    before_transition :awaiting_selection => :idle do |m,transition|
      m.vend(*transition.args)
    end
  end

  def vend(variety)
    self.tray << variety
  end

end
