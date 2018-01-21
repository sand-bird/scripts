i = 0
f = File.open("new_skills.json","w")
f.print("[")
File.open("skills.txt", "r").each_line do |line|
  i+=1
  f.print(",") unless i == 1
  f.print(rplce = "{\"id\": #{i},\"name\": \"#{line.chomp}\",\"timeworn\": [0,0],\"shining\": [0,0],\"mystery\": [0,0]}")
end
f.print("]")
