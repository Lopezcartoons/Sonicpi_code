
sprbth = "Loopop_Superbooth_2021_Sample_Pack/**"

in_thread do
  loop do
    cue [:first,:second,:third].choose
    cue [:first,:second,:third,:fourth,:fifth,:sixth].choose
    
    
    sleep 1
    sleep 8 if dice = 3
  end
end

live_loop :st1 do
  sync :first
  live_loop :vcl do
    sample sprbth, "vocal", [1,2].shuffle,
      attack: 1, decay: rand
    sleep 2
  end
  
  live_loop :hbach do
    sample sprbth, "Hainbach", [1,5].shuffle,
      amp: 2, cutoff: rrand(50,100)
    sleep 2
  end
end


live_loop :sn2 do
  sync :second
  live_loop :qsr do
    sample sprbth, "Rotation", [1,2].shuffle,
      attack: 1, finish: rand
    sleep 2
    sleep 2 if dice = 5
  end
end

live_loop :rd3 do
  sync :third
  live_loop :hbach1 do
    sample sprbth, "Hainbach", [1,2].shuffle,
      amp: 2
    sleep 1
  end
end

#--------------------



live_loop :th4 do
  sync :fourth
  live_loop :chr do
    sample sprbth, "choir", [1,2].shuffle,
      attack: 4 , release: 4
    sleep 16
  end
  
  live_loop :snr do
    sleep 2.5
    sleep rand
    sample sprbth, "tr1", [1,17].shuffle.take(4),
      finish: rand if dice = 5
  end
  
end


live_loop :th5 do
  sync :fifth
  live_loop :drms do
    sample sprbth, "drums", [1,2].shuffle,
      finish: rand, amp: rand
    sleep 0.5
    sleep 2 if dice = 9
  end
end

live_loop :th6 do
  sync :sixth
  live_loop :Buchla do
    sample sprbth, "mic", [1,17].shuffle,
      amp: rand, rate: 0.5
    sleep 1.5
  end
end