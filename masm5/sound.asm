.model  tiny
.code
.startup
      mov   dx,  100
      in    al,  61h
      and   al,  11111100b
sound: xor   al,  2
      out   61h, al
      mov   cx,  140h
wait1: loop  wait1
      dec   dx
      jne   sound
.exit 0
end
