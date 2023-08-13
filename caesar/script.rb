def caesar_cipher (string, shift)
    ascii_code = string.split('').map {|l| l.ord}
    # p ascii_code
    shift = ascii_code.map do |num|
        if num.between?(65,90)
            if shift.positive?
                num + shift > 90 ? ( num + shift) - 26 : num + shift
            else
                num + shift < 65 ? ( num + shift) + 26 : num + shift
            end

        elsif num.between?(97,122)
            if shift.positive?
                num + shift > 122? ( num + shift) - 26 : num + shift
            else
                num + shift < 97 ? (num + shift) + 26 : num + shift
            end
        else
              num  
        end
    end
     shifted_string = shift.map! {|l| l.chr}.join
     p shifted_string
end

caesar_cipher('AbCd', -1)