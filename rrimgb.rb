require "rmagick"
require "readline"

CWD = ARGV[0]
MAX_DIM = ARGV[1]

puts "cwd: #{CWD}"
puts "max dimension: #{MAX_DIM}"

read = Readline.readline "continue Y/n: "

exit if read.start_with? "n"

Dir.glob(CWD + "/**/*") do |file|
    next if file == "." or file == ".."
    next if !file.end_with? "jpg" and !file.end_with? "JPG"
    
    img = Magick::Image.read(file).first
    resized = img.resize_to_fit MAX_DIM
    
    puts file
    
    resized.write(file) do
        self.quality = 80
    end
    
    img.destroy!
    resized.destroy!
end
