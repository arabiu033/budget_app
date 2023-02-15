module ApplicationHelper
  def format_date(date)
    DateTime.parse(date.to_s).to_formatted_s(:long)
  end
end
