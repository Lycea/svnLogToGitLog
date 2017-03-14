
-- see if the file exists
function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

-- get all lines from a file, returns an empty 
-- list/table if the file does not exist
function lines_from(file)
  if not file_exists(file) then 
    return {} 
  end
    
  a_lines = {}
  
  for line in io.lines(file) do 
    a_lines[#a_lines + 1] = line
  end
  return a_lines
end



-- uses the functions above
local file = 'branch.log'
local lines = lines_from(file)

local log2 = 'new_log.log'
fnew = io.open(log2,"w")

-- print all line numbers and their contents
for num,txt in pairs(lines) do
  not_matched = true
  --get first four letters to check
  s_sub = string.sub(txt,1, 4)
  
  --check for nonsense
  if string.match(s_sub,"[-]") then
    if num == 1 then
      a_lines[num] = "" 
      print("")
      fnew:write("")
      not_matched = false
    else
      a_lines[num] = "" 
      print("\n")
      fnew:write("\n")
      not_matched = false
    end
  end
  
  --find the revisions
  if string.match(s_sub,"r%d+")and not_matched then 
     rev  = string.match(txt,"r(%d+)")
     
     name = string.match(txt,"|.-|")
     name = string.sub(name,3,#name-2)
     
     y,m,d,h,mins,s = string.match(txt,"| (2...)%D(%d%d)%D(%d%d).(%d%d)%D(%d%d)%D(%d%d).-|")
     --print(rev.." "..name.." "..y.."."..m.."."..d.." "..h..":"..mins..":"..s)
     unix_t = os.time({year=y,month=m,day=d,hour=h,min=mins,sec=s,true})
    
    --git log --reverse --numstat --pretty=format:"author: %an|%ae%ndate: %ct%n" --name-status --no-merges > log.txt
    
    print("info: "..name.."|"..name.."@xyz.com|"..unix_t.."2")
    fnew:write("info: "..name.."|"..name.."@xyz.com|"..unix_t.."\n")
    
     not_matched = false
  end
  
  --find modified /added/deleted stuff
  if string.match(s_sub," [ADM]")and not_matched then
    if string.len(txt) >7 then
      
      txt = string.match(txt," ([ADM].+)")
      ps = string.find(txt,"/")
      --txt = string.gsub(txt," \"," ")
      --print(pos)
      if pos == 3 then
        txt = string.gsub(txt," /"," " )
      end
      
      print(txt)
      fnew:write(txt.."\n")
       not_matched = false
     else
       txt = ""
      print(txt)
      fnew:write(txt.."")
       not_matched = false
     end
  end
  
  
end
io.close(fnew)