# frozen_string_literal: true

require_relative "nekosbest/version"
require "rubygems"
require "httparty"

module Nekosbest

  __copyright__ = "Copyright 2022 NekoFanatic"
  __version__ = "2.0.1"

  API_URL = "https://nekos.best/"
  $API_VERSION = "v2"

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
      "kitsune",
      "laugh",
      "neko",
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


  class Request
    include HTTParty
    base_uri API_URL

    def initialize(type, amount)
      @type, @amount = type, amount
    end

    def posts
      self.class.get("/api/#$API_VERSION/#@type?amount=#@amount")
    end
  end

  def get_img (type, amount = 1)
    amount = amount.to_i
    if amount == 0
      return "Not a valid amount! It has to be a number between 1 and 20"
    end
    if $CATEGORYS.include? type
      if amount <= 20
          g = Request.new(type, amount)
          res = g.posts["results"]

          if res.length() > 1
              return res
          else
              return res[0]
          end
          
      else
        return "The amount has to be a number between 1 and 20 !"
      end
      
    else
      return type + " is not an option! It has to be one of the following:\n #$CATEGORYS"
    end
  end
end
