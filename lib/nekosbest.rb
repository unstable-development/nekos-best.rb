# frozen_string_literal: true

require_relative "nekosbest/version"
require "rubygems"
require "httparty"

module Nekosbest

  __copyright__ = "Copyright 2022 unstable-development"
  __version__ = "2.0.6"

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
      "handhold",
      "highfive",
      "hug",
      "kick",
      "kiss",
      "kitsune",
      "laugh",
      "neko",
      "pat",
      "poke",
      "pout",
      "punch",
      "shoot",
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
      "waifu",
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
    amount = Integer(amount, exception: false)

    if $CATEGORYS.include? type
        g = Request.new(type, amount)
        res = g.posts["results"]

        if res.length() > 1
            return res
        else
            return res[0]
        end
      
    else
      raise "'%s' is not an option! It has to be one of the following:\n #$CATEGORYS" % type
    end
  end
end
