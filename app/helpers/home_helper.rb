module HomeHelper
  def issue_ratings(count)
    return 0 if count.empty?
    return 4 if count['CRITICAL'] > 1
    return 3 if count['CRITICAL'] == 1
    return 2 if count['MAJOR'] > 1
    return 1 if count['MAJOR'] == 1
    return 1 if count['MINOR'] > 1
    return 1 if count['COSMETIC'] == 1 && COUNT['MINOR'] == 1
    return 0
  end
end
