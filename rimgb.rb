require "rmagick"
require "readline"

CWD = Dir.pwd
MAX_DIM = ARGV[0]
PREFIX = ARGV[1]

puts "cwd: #{CWD}"
puts "max dimension: #{MAX_DIM}"
puts "prefix: #{PREFIX}"

read = Readline.readline "continue Y/n: "

exit if read.start_with? "n"

i = 1
Dir.foreach(CWD) do |file|
    next if file == "." or file == ".."
    next if !file.end_with? "jpg" and !file.end_with? "JPG"
    
    img = Magick::Image.read(file).first
    resized = img.resize_to_fit MAX_DIM
    newpath = CWD + "/" + PREFIX.sub("$", i.to_s) + ".jpg"
    
    resized.write(newpath) do
        self.quality = 80
    end
    
    File.delete file
    
    i = i + 1
    img.destroy!
    resized.destroy!
end
