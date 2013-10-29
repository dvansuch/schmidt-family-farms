class PublicController < ApplicationController

  def root
    redirect_to "/index"
  end
  
  def index
    render :index
  end

  def about
    render :about
  end

  def products
    render :products
  end

  def beef
    render :beef
  end

  def pork
    render :pork
  end

  def chicken
    render :chicken
  end

  def lamb
    render :lamb
  end
  
  def services
    render :services
  end

  def order
    render :order
  end

  def news
    render :news
  end

  def faq
    render :faq
  end

  def contact
    render :contact
  end

  def admin_login
    render :admin_login
  end
end
