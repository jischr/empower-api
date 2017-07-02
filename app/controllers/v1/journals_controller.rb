class V1::JournalsController < ApplicationController
  skip_before_action :authenticate_request

  def create
    @journal = Journal.new(journal_params)
    if @journal.save
      render json: @journal
    else
      render :status => 400
    end
  end

  private

  def journal_params
    params.require(:journal).permit(:title, :user_id, :content, :sentiment)
  end
end
