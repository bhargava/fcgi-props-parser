fcgi-props-parser
=================

Parse FastCGI params specified in nginx + php-fpm setting


Usage
=====
require 'FCGIPropsParser'

props = FCGIPropsParser.parse( my_props_file )

puts props.prop_name
