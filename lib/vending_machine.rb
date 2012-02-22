require 'state_machine'

class VendingMachine

  attr_accessor :tray, :inserted

  DRINK_PRICE = 2

  def initialize
    self.tray = []
    self.inserted = 0
    super
  end

  state_machine :state, :initial => :idle do
    state :idle
    state :accepting_money
    state :awaiting_selection
    state :broken

    event :insert_dollar do
      transition [:idle, :accepting_money] => :awaiting_selection, :if => :paid?
      transition :idle => :accepting_money
    end

    event :push_button do
      transition :awaiting_selection => :idle
    end

    before_transition :awaiting_selection => :idle do |m,transition|
      m.accept_money
      m.vend(*transition.args)
    end

    event :crowbar do
      transition any - :broken => :broken
    end

    after_transition :to => :broken do |m,transition|
      rand(30).times do
        m.vend([:cola, :lemonade, :orange].sample)
      end
    end
  end

  # Events
  def insert_dollar
    self.inserted += 1
    super
  end

  # Helpers
  def accept_money
    self.inserted -= DRINK_PRICE
  end

  def vend(variety)
    self.tray << variety
  end

  def paid?
    inserted >= DRINK_PRICE
  end

end
