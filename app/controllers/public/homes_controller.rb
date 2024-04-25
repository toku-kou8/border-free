class Public::HomesController < ApplicationController
  # require 'nokogiri'
  # require 'open-uri'

  def top
    # url = 'https://note.com/border_free2021/rss'
    # xml_data = Nokogiri::XML(open(url))
    # @feed = parse_rss(xml_data)
    @medias = MediaPost.page(params[:page]).per(5).order("date_public "+ sort_direction)
  end

  def about
  end

  def show
  end

  def social
  end

  def support
  end

  def classes
  end

  def privacy
  end

  private
  def sort_direction
    # If params[:direction] is nil, set sort_direction to "desc" by default
    %W[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end


  def parse_rss(xml_data)
    # ここでXMLデータを適切にパースしてハッシュやオブジェクトに変換するロジックを書く
    # 例えば、Nokogiriを使ってハッシュに変換する場合：
    title = xml_data.at('channel title').text
    items = xml_data.css('item').map do |item|
      {
        title: item.at('title').text,
        description: item.at('description').text,
        link: item.at('link').text,
        # 他の情報も必要に応じて追加
      }
    end

    OpenStruct.new(title: title, items: items)
  end
end
