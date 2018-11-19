module TodoStateMachine
  extend ActiveSupport::Concern
  included do
    include AASM
    attr_accessor :event

    aasm column: :status do

      error_on_all_events :set_status_error
      state :not_assigned, initial: true
      state :assigned
      state :in_progress
      state :done

      event :not_assigned do
        transitions from: :not_assigned, to: :not_assigned
      end
      
      event :assign do
        transitions from: :assigned, to: :assigned
        transitions from: :not_assigned, to: :assigned
      end

      event :in_progress do
        transitions from: :assigned, to: :in_progress
        transitions from: :in_progress, to: :in_progress
      end

      event :done do
        transitions from: :in_progress, to: :done
        transitions from: :done, to: :done
      end
    end

    def set_status_error(error)
      self.errors.add(:base, "cannot transition to #{aasm.to_state} from #{aasm.from_state}")
      self.errors.add(:base, error.message)
    end

  end
end
