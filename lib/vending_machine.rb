require 'state_machine'

class VendingMachine

  state_machine :state, :initial => :idle do
    state :idle
    state :awaiting_selection

    event :insert_dollar do
      transition :idle => :awaiting_selection
    end

    event :push_button do
      transition :awaiting_selection => :idle
    end
  end

end
