require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'

template_letter = File.read('form_letter.erb')
erb_template = ERB.new template_letter



def clean_phone_numbers(number)
    number.gsub!(/[^\d]/, '')
    if number.length == 10
        number
    elsif number.length > 10 && number[0] == "1"
        number[1..10]
    else 
        'Wrong Number!'
    end
end

def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5, '0')[0..4]
end

def legislators_by_zipcode(zip)
    civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
    civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

    begin
        legislators = civic_info.representative_info_by_address(
            address: zip,
            levels: 'country',
            roles: ['legislatorUpperBody', 'legislatorLowerBody']
        ).officials
    rescue
        'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
    end
end

def save_thank_you_letter(id,form_letter)
    Dir.mkdir('output') unless Dir.exist?('output')

    filename = "output/thanks_#{id}.html"

    File.open(filename, 'w') do |file|
        file.puts form_letter
    end
end

def find_maximum(array)
    array.max_by {|a| array.count(a)}
end

puts 'Event manager initialized!'

hour_of_the_day = Array.new
day_of_the_week = Array.new
name_of_the_day = {0=> "Sunday", 1=> "Monday", 2=> "Tuesday", 3=> "Wednesday", 4=> "Thursday", 5=> "Friday", 6=> "Saturday"}

contents = CSV.open('./lib/event_attendees.csv', 
    headers: true,
    header_converters: :symbol)

contents.each do |row|
    id = row[0]

    name = row[:first_name]
    zipcode = clean_zipcode(row[:zipcode])
    legislators = legislators_by_zipcode(zipcode)
    number = clean_phone_numbers(row[:homephone])
    reg_date = row[:regdate]

    form_letter = erb_template.result(binding)

    time_targeting = DateTime.strptime(reg_date, "%m/%d/%y %H:%M")
    hour_of_the_day.push(time_targeting.hour)
    day_of_the_week.push(time_targeting.wday)

   save_thank_you_letter(id , form_letter)
   puts number
end

puts "Most Active Hour is: #{find_maximum(hour_of_the_day)}"
puts "Most Active Day is: #{name_of_the_day[find_maximum(day_of_the_week)]}"