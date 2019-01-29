# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    classGenerator.rb                                  :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lhernand <lhernand@student.42.us.or>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/01/28 21:42:03 by lhernand          #+#    #+#              #
#    Updated: 2019/01/28 21:42:04 by lhernand         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

require 'fileutils'

def create_ignore
	open(".gitignore", 'w') do |f|
		f.puts '# Compiled source #'
		f.puts '###################'
		f.puts '*.com'
		f.puts '*.class'
		f.puts '*.dll'
		f.puts '*.exe'
		f.puts '*.o'
		f.puts '*.so'
		f.puts
		f.puts '# Packages #'
		f.puts '############'
		f.puts '# it\'s better to unpack these files and commit the raw source'
		f.puts '# git has its own built in compression methods'
		f.puts '*.7z'
		f.puts '*.dmg'
		f.puts '*.gz'
		f.puts '*.iso'
		f.puts '*.jar'
		f.puts '*.rar'
		f.puts '*.tar'
		f.puts '*.zip'
		f.puts
		f.puts '# Logs and databases #'
		f.puts '######################'
		f.puts '*.log'
		f.puts '*.sql'
		f.puts '*.sqlite'
		f.puts
		f.puts '# OS generated files #'
		f.puts '######################'
		f.puts '.DS_Store'
		f.puts '.DS_Store'
		f.puts '._*'
		f.puts '.Spotlight-V100'
		f.puts '.Trashes'
		f.puts 'ehthumbs.db'
		f.puts 'Thumbs.db'
	end
end

def	make_author
	File.open('author', 'w') do |f|
		f.puts "#{ENV['USER']}"
	end
end

def make_file(file_name)
	File.open(file_name, 'w') do |f|
		f.puts "#Your file has been created ^_^#"
		f.puts
	end
end

def make_makefile_c
	File.open("Makefile", 'w') do |f|
		f.puts "MAKE = make -C"
		f.puts "LIB = libft"
		f.puts "NAME ="
		f.puts "CC = gcc"
		f.puts "CFLAGS = -Wall -Wextra -Werror"
		f.puts "CFILES = $(LIB)/libft.a"
		f.puts
		f.puts "LIBM = $(MAKE) $(LIB) re"
		f.puts "LIBC = $(MAKE) $(LIB) clean"
		f.puts "LIBF = $(MAKE) $(LIB) fclean"
		f.puts "OBJECTS = $(CFILES:.c=.o)"
		f.puts
		f.puts "all: $(NAME)"
		f.puts
		f.puts "$(NAME):"
		f.puts "		@$(LIBM)"
		f.puts "		@$(CC) $(CFLAGS) -o $(NAME) -I $(CFILES)"
		f.puts
		f.puts "clean:"
		f.puts "		@$(LIBC)"
		f.puts "		@$/bin/rm -f $(OBJECTS)"
		f.puts
		f.puts "fclean:"
		f.puts "		@$(LIBF)"
		f.puts "		@$(/bin/rm -f $(OBJECTS) $(NAME)"
		f.puts
		f.puts "re: fclean all"
		f.puts
		f.puts ".PHONY: all, clean, fclean, re"
	end
	system 'vim', "+Stdheader", "+wq", file_name
end

def make_makefile_cpp
	file_name = "Makefile"
	print "What would you like to call your program? "
	name = gets.strip.chomp
	File.open("#{file_name}", 'w') do |f|
		f.puts "NAME = #{name}"
		f.puts "CXX = clang++"
		f.puts "CXXFLAGS = -Wall -Wextra -Werror -std=c++98 -pendatic-errors"
		f.puts "CXXFILES = *.cpp"
		f.puts "CXXOBJECTS = $(CFILES:.cpp=.o)"
		f.puts
		f.puts "all: $(NAME)"
		f.puts
		f.puts "$(NAME):"
		f.puts "		@$(CXX) $(CXXLAGS) $(CXXFILES) -o $(NAME) "
		f.puts
		f.puts "clean:"
		f.puts "		@$/bin/rm -f $(CXXOBJECTS)"
		f.puts
		f.puts "fclean:"
		f.puts "		@$/bin/rm -f $(CXXOBJECTS) $(NAME)"
		f.puts
		f.puts "re: fclean all"
		f.puts
		f.puts ".PHONY: all, clean, fclean, re"
	end
	system 'vim', "+Stdheader", "+wq", file_name
end

def make_cpp_source(file)
	file_name = "#{file}.cpp"
	header_name = "#{file.capitalize}.hpp"
	file.capitalize!
	File.open("#{file_name}", 'w') do |f|
		f.puts "# include \"#{header_name}\""
		f.puts
		f.puts "#{file}::#{file}(void)"
		f.puts "{"
		f.puts "	return ;"
		f.puts "}"
		f.puts "#{file}::~#{file}(void)"
		f.puts "{"
		f.puts "	return ;"
		f.puts "}"
		f.puts "#{file}::#{file}(#{file} const & src)"
		f.puts "{"
		f.puts "	*this = src ;"
		f.puts "}"
		f.puts "#{file}		&#{file}::operator=(#{file} const & rhs)"
		f.puts "{"
		f.puts "	if (this == &rhs)"
		f.puts "		return (*this);"
		f.puts "	return (*this);"
		f.puts "}"
	end
	system 'vim', "+Stdheader", "+wq", file_name
end

def make_cpp_header(file)
	header_file = "#{file}.hpp"
	define_header_name = "#{file.upcase}_HPP"
	file.capitalize!
	File.open("#{header_file}", 'w') do |f|
		f.puts "#ifndef #{define_header_name}"
		f.puts "# define #{define_header_name}"
		f.puts
		f.puts "class #{file}"
		f.puts "{"
		f.puts "		public:"
		f.puts "			#{file}(void);"
		f.puts "			~#{file}(void);"
		f.puts "			#{file}(#{file} const & src);"
		f.puts "			#{file} &operator=(#{file} const & rhs);"
		f.puts "			//Add your public methods below here"
		f.puts "		private:"
		f.puts "			//Add your private methods"
		f.puts
		f.puts "			//Add your private attributes below here"
		f.puts
		f.puts "};"
		f.puts
		f.puts "#endif"
	end
	system 'vim', "+Stdheader", "+wq", header_file
end

def make_src
	dir_name = "/src"
	lib_name = "/libft"
	begin
		Dir.mkdir("#{ENV['PWD']}#{dir_name}")
	rescue
		puts "Your src folder is already there... so I'm just going to leave that alone"
	end
end

if $PROGRAM_NAME == __FILE__
	print "Enter the name of the file including extension appended to it => "
	name = gets.strip.chomp
	file = name.split('.').first
	print "Do you need a gitignore for this project? "
	git = gets.strip.chomp.downcase
	create_ignore if (git == 'yes' || git == 'y')
	print "Do you need an author file? "
	auth = gets.strip.chomp.downcase
	make_author if (auth == "yes" || auth == "y")
	if name.include?('.cpp')
		print "Do you need a Makefile for this project? "
		res = gets.strip.chomp.downcase
		make_makefile_cpp if (res == 'yes' || res == 'y')
		make_cpp_source(file)
		make_cpp_header(file)
	elsif name.include?('.c')
		print "do you have a libft you'd like to include? "
		lib = gets.strip.chomp.downcase
		make_src if (lib == 'yes' || lib == 'y')
		make_file(name)
		make_makefile_c
	else
		make_file(name)
	end

end
