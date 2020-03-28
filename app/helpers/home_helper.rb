# frozen_string_literal: true

module HomeHelper


  def youtube_thumbnail(url)
    id = get_youtube_id(url)
    "https://img.youtube.com/vi/#{id}/mqdefault.jpg"
  end

  private
    def get_youtube_id(url)
      url = url.gsub(/(>|<)/i, "").split(/(vi\/|v=|\/v\/|youtu\.be\/|\/embed\/)/)
      url[2].present? ? url[2].split(/[^0-9a-z_\-]/i)[0] : url
    end
end
