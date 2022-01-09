# frozen_string_literal: true

require_relative "nekosbest/version"

module Nekosbest

  require "rubygems"
  require "httparty"
  
  __copyright__ = "Copyright 2021 NekoFanatic"

  API_URL = "https://nekos.best/"


  $CATEGORYS = Array.[](
      "baka",
      "bite",
      "blush",
      "bored",
      "cry",
      "cuddle",
      "dance",
      "facepalm",
      "feed",
      "happy",
      "highfive",
      "hug",
      "kiss",
      "laugh",
      "nekos",
      "pat",
      "poke",
      "pout",
      "shrug",
      "slap",
      "sleep",
      "smile",
      "smug",
      "stare",
      "think",
      "thumbsup",
      "tickle",
      "wave",
      "wink",
  )

  class Result

      def initialize(url, artist_href, artist_name, source_url)
          @url, @artist_href, @artist_name, @source_url = url, artist_href, artist_name, source_url
      end

      def to_s
          "<url='#@url', artist_href='#@artist_href', artist_name='#@artist_name', source_url='#@source_url'>"
      end

      def url
          @url
      end

      def artist_href
          @artist_href
      end

      def artist_name
          @artist_name
      end

      def source_url
          @source_url
      end
  end

  class Request
      include HTTParty
      base_uri API_URL

      def initialize(type)
          @type = type
      end

      def posts
          self.class.get("/api/v1/#@type")
      end
  end

  def get_img (type, amount = 1)
      amount = amount.to_i
      if amount == 0
          return "Not a valid amount! It has to be a number between 1 and 20"
      end
      ar = Array.new
      if $CATEGORYS.include? type
          if amount <= 20
              for a in 1..amount do
                  g = Request.new(type)
                  ret = g.posts

                  result = Result.new(ret["url"], ret["artist_href"], ret["artist_name"], ret["source_url"])

                  ar.append(result)
              end
              return ar
          
          else
              return "The amount has to be a number between 1 and 20 !"
          end
      
      else
          return type + " is not an option! It has to be one ofte following:\n #$CATEGORYS"
      end
  end

end
