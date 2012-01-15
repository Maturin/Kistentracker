

# Extending the Array Class 
class Array

  def text_join(sep_char, sep_word)
    my_size = self.size
    if my_size == 0
      return ''
    elsif my_size == 1
      return self.first.to_s
    elsif my_size == 2
      return "#{self.first} #{sep_word} #{self.last}"
    else
      dup = self.map { |el| el.to_s }
      last = dup.pop
      return dup.join(sep_char + ' ') + " #{sep_word} #{last}"
    end
  end

end

birthday_childs = []

now_year = Time.now.year
now_month = Time.now.month
now_day = Time.now.day

# Searching all 'Geburtstagskinder'

Teammate.all.each do |tm|
  if tm.dob.nil? == false
    if (tm.dob.day == now_day) && (tm.dob.month == now_month)
      birthday_childs << tm
    end
  end
end


if birthday_childs.size > 0

  # Adding all 'Geburtstagskindern' a new crate.

  birthday_childs.each do |tm|
    crate = Crate.new
    crate.cratepayer_id = tm.cratepayer.id
    crate.reason = 'Geburtstag'
    crate.date = Time.now
    crate.crate_type = "Kiste"
    crate.crate_priority_value = 10
    crate.save
  end
  
  # Sending congretulations Email

  birthday_names = birthday_childs.map { |bc| bc.cratepayer.name }

  birthday_names = birthday_names.text_join(',', 'und')

  res = BirthdayNotifier.send_mail(<recipient>, birthday_names)

  res.send
end
