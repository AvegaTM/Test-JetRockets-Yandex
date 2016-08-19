#!/usr/bin/ruby
require './Yandex_Dictionary'

yd = Yandex_Dictionary.new

# getLangs(format, key)
# lookup(format, key, text, *var)
#
# format =
# '' = 'xml'
# 'json'
# 'jsonp'
#
puts yd.getLangs(
  '',
  'dict.1.1.20160818T210017Z.ba947b5b0bdcbd0e.' \
  'b65d75a5dbe157bab3c70c841f1881dad6b49d8f'
)

puts yd.lookup(
  '',
  'dict.1.1.20160818T210017Z.ba947b5b0bdcbd0e.' \
  'b65d75a5dbe157bab3c70c841f1881dad6b49d8f',
  'test',
  'en-ru',
  'ru'
)
