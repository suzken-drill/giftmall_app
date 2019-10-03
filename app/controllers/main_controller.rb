class MainController < ApplicationController
  before_action :wizard_question, except: :index
  include Giftmall

  # event
  def index
    session[:attributes] = {}
    wizard_question
  end

  # opponent
  def opponent
    @wizard_question.attributes = wizard_params
    session[:attributes] = @wizard_question.attributes
    redirect_to action: :index and return unless @wizard_question.valid?
  end

  # price
  def price
    @wizard_question.attributes = wizard_params
    session[:attributes] = @wizard_question.attributes
    redirect_to action: :index and return unless @wizard_question.valid?
  end

  # 結果
  def result
    #@wizard_question = Wizard::Question::Result.new(session[:attributes])
    @wizard_question.attributes = wizard_params
    session[:attributes] = @wizard_question.attributes
    category = Category.where(event: @wizard_question.event, opponent: @wizard_question.opponent).first
    # スクレイピング
    @items = Giftmall.get_giftmall(category.cat_num, @wizard_question.price)
  end

  private
    def wizard_question
      @wizard_question = "Wizard::Question::#{action_name.camelize}".constantize.new(session[:attributes])
    end
    def wizard_params
      params.permit(Wizard::Question::REGISTRABLE_ATTRIBUTES)
    end
end
