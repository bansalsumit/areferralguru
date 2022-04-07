ActiveAdmin.register_page 'My Rewards' do
  content title: 'Rewards' do
    shop.programs.each do |program|
      panel 'To Advocate get', class: 'block' do
        render partial: 'rewards', locals: {
          section_name: "advocate-#{program.id}", program: program, section_type: 'advocate'
        }
      end
      panel 'How much referred get', class: 'block' do
        render partial: 'rewards', locals: {
          section_name: "rewards-#{program.id}", program: program, section_type: 'rewards'
        }
      end
      panel 'Advance Settings', class: 'block' do
        render partial: 'reward_eligibilities', locals: {
          section_name: "advance-#{program.id}", program: program, section_type: 'advance'
        }
      end
    end
  end

  controller do
    before_action :set_program

    def set_program
      if @shop.programs.blank?
        @shop.programs.create!
      end
    end
  end
end
