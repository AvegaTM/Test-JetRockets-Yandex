require 'open-uri'
# Yandex_Dictionary
class Yandex_Dictionary
  URL = 'https://dictionary.yandex.net/api/v1/dicservice'
  QUERY_XML = '/'
  QUERY_JSON = '.json/'
  JSONP_ADDON = '&callback=myCallback'

  def getLangs(format, key)
    key = 'getLangs?key=' + key
    query =
      case format
      when 'json'
        URL + QUERY_JSON + key
      when 'jsonp'
        URL + QUERY_JSON + key + JSONP_ADDON
      else
        URL + QUERY_XML + key
      end
    yandex_content = open(query).read
    yandex_content
  end

  def lookup(format, key, text, *var)
    lang, ui, flags = var
    param = 'lookup?key=' + key + '&lang=' + lang + '&text=' + text
    param << '&ui=' + ui unless ui.nil?
    param << '&flag=' + flags unless flags.nil?

    query =
      case format
      when 'json'
        URL + QUERY_JSON + param
      when 'jsonp'
        URL + QUERY_JSON + param + JSONP_ADDON
      else
        URL + QUERY_XML + param
      end
    yandex_content = open(query).read
    yandex_content
  end
end
