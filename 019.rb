sev,cnt = 0,0
1900.upto(2000) do |year|
  1.upto(12) do |month|
    if month.to_s =~ /[469]|11/
      month_end = 30
    elsif month==2
      if year%4<1 && !(year%400>0 && year%100<1)
        month_end = 29
      else
        month_end = 28
      end
    else
      month_end = 31
    end
    1.upto(month_end) do |day|
      if sev==6
        sev = 0
        cnt += 1 if day==1
      else
        sev += 1
      end
    end
  end
end
p cnt-2

