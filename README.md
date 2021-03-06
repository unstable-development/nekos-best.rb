# Nekosbest

This gem is for the [nekos.best API](https://nekos.best/) to provide you with fully SFW pictures and gifs.

## Installation

Download the [`nekosbest-2.0.6.gem`](https://github.com/unstable-development/nekos-best.rb/blob/master/nekosbest-2.0.6.gem) file and install the gem with:

    $ gem install nekosbest

## Usage

```ruby
require "nekosbest"

include Nekosbest

# one image / gif 
print Nekosbest.get_img("neko")

# more images / gifs (list with max 20 objects)
print Nekosbest.get_img("neko", 3)
```

### Listed topics

```ruby
["baka", "bite", "blush", "bored", "cry", "cuddle", "dance", "facepalm", "feed", "happy", "handhold", "highfive", "hug", "kick", "kiss", "kitsune", "laugh", "nekos", "pat", "poke", "pout", "punch", "shoot""shrug", "slap", "sleep", "smile", "smug", "stare", "think", "thumbsup", "tickle", "wave", "waifu", "wink"]
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Nekosbest project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/unstable-development/nekos-best.rb/blob/master/CODE_OF_CONDUCT.md).
