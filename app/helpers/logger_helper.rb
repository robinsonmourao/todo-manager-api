module LoggerHelper
  def print(data)
    length = data.length
    sharps = '#' * length

    Rails.logger.info("#"+sharps)
    Rails.logger.info("#{data}")
    Rails.logger.info("#"+sharps)
  end
end
