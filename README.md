# Omniauth::Coub

Official OmniAuth Strategy for the Coub OAuth2 API

## Installation

Add this line to your application's Gemfile:

```bash
gem 'omniauth-coub'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install omniauth-coub
```

## Usage

### With Sinatra

```ruby
use OmniAuth::Builder do
  provider :coub, ENV['COUB_KEY'], ENV['COUB_SECRET'], scope: 'logged_in,channel_edit,like'
end
```

### With Rails

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :coub, ENV['COUB_KEY'], ENV['COUB_SECRET'], scope: 'logged_in,channel_edit,like'
end
```

## Authentication Hash

An example auth hash available in `request.env['omniauth.auth']`:
```ruby
{
  provider: 'coub',
  uid: 1,
  info: {
    id: 1,
    permalink: "janedoecoubs",
    name: "Jane Doe",
    sex: "female",
    city: null,
    current_channel: {
      id: 1,
      permalink: "janedoecoubs",
      title: "Jane Doe",
      i_follow_him: false,
      followers_count: 1,
      following_count: 23,
      avatar_versions: {
        template: "http:\/\/ell.akamai.coub.com\/get\/bucket:12.21\/p\/channel\/cw_avatar\/a6b57593e53\/f731a331b290a5d0c2b55\/%{version}_1406187797_540952659342151.jpg",
        versions: [
          "medium",
          "medium_2x",
          "profile_pic",
          "profile_pic_2x",
          "profile_pic_new",
          "profile_pic_new_2x",
          "tiny",
          "tiny_2x",
          "small",
          "small_2x",
          "ios_large",
          "ios_small"
        ]
      }
    },
    created_at: "2014-10-07T18:17:28Z",
    updated_at: "2015-01-14T15:35:17Z",
    api_token: "b25e6d75165b13de5f539993f61ce240f6c1a622dd07edb69c6471824sd2c127de16b0a5b1d62c8a13770474965deb652afba7f46c7944565de57ff1353bec07"
  },
  credentials: {
    token: "b0d236139bdcb89226f5c9545c60293514c16438a71fbea1649d2cc2cd081939",
    expires_at: 1456396146,
    expires: true
  },
  extra: {
    raw_info: {
      id: 1,
      permalink: "janedoecoubs",
      name: "Jane Doe",
      sex: "female",
      city: null,
      current_channel: {
        id: 1,
        permalink: "janedoecoubs",
        title: "Jane Doe",
        i_follow_him: false,
        followers_count: 1,
        following_count: 23,
        avatar_versions: {
          template: "http:\/\/ell.akamai.coub.com\/get\/bucket:12.21\/p\/channel\/cw_avatar\/a6b57593e53\/f731a331b290a5d0c2b55\/%{version}_1406187797_540952659342151.jpg",
          versions: [
            "medium",
            "medium_2x",
            "profile_pic",
            "profile_pic_2x",
            "profile_pic_new",
            "profile_pic_new_2x",
            "tiny",
            "tiny_2x",
            "small",
            "small_2x",
            "ios_large",
            "ios_small"
          ]
        }
      }
    }
  }
}
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
