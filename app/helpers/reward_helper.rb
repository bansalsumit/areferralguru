module RewardHelper
  def set_reward_object(object, program, section_type)
    object = if section_type == 'advocate'
      object = if program.advocate_programeable.present? && program.advocate_programeable.class ==  object.class
        program.advocate_programeable
      else
        object
      end
    else
      object = if program.referred_programeable.present?
        program.referred_programeable
      else
        object
      end
    end
  end

  def set_reward_eligibility(program)
    object = if program.reward_eligibility.present?
      program.reward_eligibility
    else
      RewardEligibility.new
    end
  end
end
