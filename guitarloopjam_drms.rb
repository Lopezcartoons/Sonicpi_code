
live_loop :clck, delay: 16 do
  stop
  64.times do
    cue :click
    sleep 1
  end
  16.times do
    cue :click2
    sleep 0.5
  end
  64.times do
    cue :click1
    #sleep 1
    sleep 2
  end
  16.times do
    cue :click2
    sleep 0.5
  end
  64.times do
    cue :click
    sleep 0.5
  end
  16.times do
    cue :click2
    sleep 1
  end
  64.times do
    cue :click1
    #sleep 1
    sleep 1
  end
  16.times do
    #sleep 1
    sleep 1
  end
end


live_loop :chats do
  sync  "/cue/click"
  sample :drum_cymbal_closed, amp: rand, finish: rand
  
  sleep 0.125
  sleep 0.125 if dice == 3
  sample :drum_splash_soft if dice == 9
  
end

live_loop :ohats do
  sync  "/cue/click1"
  sample :drum_cymbal_open, amp: rand, finish: rrand(0.3,1)  #if dice = 2
  sleep 1
  sample :drum_splash_soft if dice == 300
end

live_loop :ohats1 do
  sync  "/cue/click2"
  sample :drum_cymbal_open, amp: rand, finish: rrand(0.3,1)  #if dice = 2
  sleep 1
  sample :drum_splash_soft if dice == 300
end

live_loop :drm1 do
  sync "/cue/click1"
  sample :drum_bass_hard
  sleep 0.25
  
  sleep 0.25
  
  
  sleep 0.5
  sample :drum_bass_hard
  
  sleep 0.25
  sample :drum_bass_hard
  sleep 0.25
  sample :sn_generic, amp: rand if dice == 3
  
  sleep 0.25
  
  sleep 0.25
  sample :drum_bass_hard
  sleep 0.25
  sample :drum_bass_hard
  
  sleep 0.25
  
  sample :sn_generic, amp: rand
  
  sleep 0.25
  sample :drum_bass_hard
  sleep 0.25
  sample :drum_bass_hard
  
  sleep 0.5
  
  sample :sn_generic, amp: rrand_i(0.3,1)
  
  sleep 0.25
  sample  :drum_splash_soft if dice == 50
  sleep 0.25
  
  
  
end

live_loop :drm do
  sync "/cue/click"
  sample :drum_bass_hard
  sleep 0.25
  
  sleep 0.25
  sample :sn_generic
  
  
  sleep 0.5
  sample :drum_bass_hard
  
  sleep 0.25
  sample :drum_bass_hard
  sleep 0.25
  sample :sn_generic, amp: rand if dice == 3
  
  sleep 0.25
  sample :drum_bass_hard if dice == 3
  
  sleep 0.25
  sample :drum_bass_hard
  sleep 0.25
  sample :drum_bass_hard
  
  sleep 0.25
  
  sample :sn_generic, amp: rand
  
  sleep 0.25
  sample :drum_bass_hard
  sleep 0.25
  sample :drum_bass_hard
  
  sleep 0.5
  
  sample :sn_generic, amp: rrand_i(0.3,1)
  
  sleep 0.25
  sample  :drum_splash_soft if dice == 50
  sleep 0.25
  
  
  
end


bname=("d5")
with_fx :record, buffer: buffer(bname,8) do
  with_fx   :reverb do
    
    live_audio :woo
    
  end
end
#sleep 32

live_loop :ch5 do
  with_fx  :krush, gain: 8 do
    stop
    sample buffer[:c4], finish: rand, start: rand
    sleep 8
    
  end
end

live_loop :ch6 do
  with_fx :reverb, room: 0.4,mix: 0.9 do
    stop
    sample buffer[:c3]
    sleep 8
    
  end
end

live_loop :ch7 do
  with_fx :reverb, room: 1,mix: 0.9 do
    
    sample buffer[:c4], finish: rand
    sleep 8
    
  end
end

live_loop :ch8 do
  with_fx :reverb, room: 0.4,mix: 0.4 do
    stop
    sample buffer[:c5]
    sleep 8
    
  end
end

#--------------
live_loop :ch1 do
  with_fx :reverb, room: 1 do
    sample buffer[:d1], rate: 1, start: rand
    sleep 8
    stop
  end
end

live_loop :ch2 do
  with_fx :distortion, mix: 0.4 do
    stop
    sample buffer[:d2], rate: 1, start: rand
    sleep 8
  end
end

with_fx  :krush, gain: 10 do
  live_loop :ch3 do
    stop
    sample buffer[:d3], rate: 1, start: rand,amp: 0.5
    sleep  8
  end
end


with_fx  :krush, gain: 10 do
  live_loop :ch4 do
    stop
    sample buffer[:d5], rate: 1 if dice == 3
    sleep  4
  end
end








