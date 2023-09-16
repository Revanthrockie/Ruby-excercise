module FileManager
    private 

    def save_file
        Dir.mkdir('saved_games') unless Dir.exist?('saved_games')
        File.open("./saved_games/#{save_custom_name}.yml", 'w') do |f|
            f.write(YAML.dump(self))
        end
        puts '\nYour file has been saved!'
        exit
    end

    def save_custom_name
        saved_games = Dir.glob('./saved_games/*')
        loop do 
            puts 'Enter a name to save your game: '
            file_name = gets.chomp.strip
            if saved_games.include?("saved_games/#{file_name}.yml")
                puts "\nFile already exists"
                next
            end
            return file_name unless /s+|^$/.match?(file_name)
        end
    end

    def load_file
       if !Dir.exist?('./saved_games/')
        loop do 
         puts '\nNo saved games!'
         break if user_input == '1'
        end
       else
        loaded_game = File.open("./saved_games/#{load_file_name}.yml", 'r') do |file|
            YAML.load(file)
            end
            loaded_game.start_game
        end
    end
   
    def load_file_name
        saved_games = Dir.glob('saved_games/*').map {|game| game.split('/').last.split('.yml').first}
        file_count = saved_games.count 
        loop do 
            puts "Enter a number to load the game: "
            saved_games.each_with_index {|game , idx| puts "#{idx + 1} , #{game}"}
            file_number = gets.chomp.strip
            if /\A[0-9]+\Z/.match?(file_number) &&  file_number.to_i <= file_count
            return saved_games[file_number.to_i - 1]
            end
        puts "\nInvalid input.\n\n"
        end
    end

end