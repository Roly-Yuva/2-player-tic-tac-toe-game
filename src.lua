local game = true
local board = "  lt|mt|rt\n  lm|mm|rm\n  lb|mb|rb"
local turnNum = 0
local u1; local u2

position = {lt = "lt", mt = "mt", rt = "rt", lm = "lm", mm = "mm", rm = "rm", lb = "lb", mb = "mb", rb = "rb"}

function pick()
  print("Player 1, pick a letter as your marker.")
  p1 = io.read("l")
  user1(p1)
  print("Player 2, pick a letter as your marker.")
  p2 = io.read("l")
  user2(p2)
  fturn()
end

function user1(p)
  print("Player 1, you chose " .. p .. ", correct?")
  local c = io.read("l")
  if c == "yes" then
    u1 = p
    u1 = " " .. u1
  elseif c == "no" then
    print("What should your marker be instead?")
    local r = io.read("l")
    user1(r)
  end
end

function user2(p)
  while p == u1 do
    print("Pick a different marker; player 1 already chose that.")
    p = io.read("l")
    user2(p)
  end
  print("Player 2, you chose " .. p .. ", correct?")
  local c = io.read("l")
  if c == "yes" then
    u2 = p
    u2 = " " .. u2
  elseif c == "no" then
    print("What should your marker be instead?")
    p = io.read("l")
    user2(p)
  end
end

function fturn()
  turnNum = turnNum + 1
  print("Type \"l\", \"m\", or \"r\" for the column position, and type \"t\", \"m\", or \"b\" for the row position")
  print("For example, \"rb\" would put a marker in the bottom right corner of the board.")
  print("This is turn number " .. turnNum .. ".")
  print("Player 1, it's your turn")
  print(" ")
  print(board)
  s = io.read("l")
  print(placePlayer1(s))
  print(" ")
  print(board)
  print(turn("p2"))
end

function turn(n)
  if n == "p1" then
    turnNum = turnNum + 1
    print("This is turn number " .. turnNum .. ".")
    print("This is player 1's turn.")
    s = io.read("l")
    print(placePlayer1(s))
    print(board)
    print("Was the match won this round?")
    v = io.read("l")
    if v == "yes" then
      print("Congratulations player 1!")
      game = false
    elseif v == "no" then
      turn("p2")
    end
  elseif n == "p2" then
    turnNum = turnNum + 1
    print("This is turn number " .. turnNum .. ".")
    print("This is player 2's turn.")
    s = io.read("l")
    print(placePlayer2(s))
    print(board)
    print("Was the match won this round?")
    v = io.read("l")
    if v == "yes" then
      print("Congratulations player 2!")
      game = false
    elseif v == "no" then
      turn("p1")
    end
  end
end

function placePlayer1(s)
  for k, v in pairs(position) do
    if s == position[v] then
      local r = string.gsub(board, position[v], u1)
      board = r
    end
  end
end

function placePlayer2(s)
  for k, v in pairs(position) do
    if s == position[v] then
      local r = string.gsub(board, position[v], u2)
      board = r
    end
  end
end

print("Welcome to two player tic-tac-toe!")
pick()