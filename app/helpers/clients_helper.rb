module ClientsHelper

  def last_updated_date(things)
    if things.order(updated_at: :desc).first.nil?
      return "-"
    else
      return kio_date_time things.order(updated_at: :desc).first.updated_at
    end
  end
end
