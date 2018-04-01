class QuotesController < ApplicationController
  def index
    # Takes sheet and puts in random order, then grabs first one
    @quote = Quote.order("RANDOM()").first
  end

  

  def create
    #Creates quote in db with user parameters
     @quote = Quote.create(quote_params)
      if @quote.invalid?
        flash[:error] = '<strong>Could not save</strong> the data you entered is invalid.'
      end
      redirect_to root_path
    end

  def about
  end

  private

  def quote_params
    #Permits user to add saying and author
    params.require(:quote).permit(:saying, :author)
  end
end