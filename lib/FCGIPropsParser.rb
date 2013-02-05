require 'ostruct'

class FCGIPropsParser
   def self.parse( file )
      fullpath = File.expand_path( file )
      raise "File, #{file}, doesn't exist !!" if !File.exists?( fullpath )

      props = {}
      File.open( fullpath, "r" ).each_line{ |line|
         parts = line.chomp.gsub( /\A[ \t]+|[ \t]+\Z/, "" ).chop.split( " ", 3 )
         if parts.empty? or parts.length != 3 or parts[ 0 ][ 0 ] == "#"
           next
         end
         props[ parts[ 1 ].gsub( /\A[ \t]+|[ \t]+\Z/, "") ] = parts[ 2 ].gsub( /\A[ \t]+|[ \t]+\Z/, "").gsub( /\A"|"\Z/, "")
      }

      OpenStruct.new( props )
   end
end
