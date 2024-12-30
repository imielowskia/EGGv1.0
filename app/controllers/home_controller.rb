class HomeController < ApplicationController
  allow_unauthenticated_access only: %i[ index ]
  def index
    if authenticated?
      @session = Current.session

      if !Current.user.pobral

        for i in (1..3)
          egz=Egzam.new
          nr = rand(4)+1
          #egz = Egzam.where(user_id: current_user.id).joins(:question).where('questions.gr' => i).first
          egz.user_id = Current.user.id
          egz.question_id = nr+(i-1)*4
          egz.created_at = DateTime.now
          egz.updated_at = DateTime.now
          egz.save!
        end
        Current.user.pobral = true
        Current.user.save!
      end
      @zestaw = Egzam.where(user_id: Current.user.id).order(:question_id)
      #@user = current_user
    end
  end


  def show
    @zestaw = Egzam.where(user_id: Current.user.id).order(:question_id)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Egzamin: #{Current.user.name} #{Current.user.surname}",
               page_size: 'A4',
               template: "home/show",
               layout: "pdf",
               orientation: "Portrait",
               lowquality: false,
               zoom: 1,
               dpi: 150,
               encoding: 'UTF-8'
      end


    end
  end

end
