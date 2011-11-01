class PagesController < ApplicationController
  skip_before_filter :authorize
  def home
  end

  def about
  end

  def report_a_child
  end

  def contact
  end

end
