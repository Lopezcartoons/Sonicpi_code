vocal =#place samples here
  impact =
  impact0 =
  #sample vocal, "world", 5, amp: 3, attack: 0.2
  
use_bpm 125
slider = 0.125
slider0 = 0.125
live_loop :clk do
  #cue :tme
  
  #cue :bld1
  #cue :drp
  
  sleep 1
end
live_loop :clk1 do
  cue :bld2
  #cue :drp2
  sleep 0.1
end
#-------introamb
live_loop :vcl do
  sync :tme
  
  with_fx :reverb, room: 1, mix: 0.5, amp: 5 do
    with_fx :echo,  phase: 3  do
      3
      #sample vocal, "world", rrand_i(1,5), finish: 0.6
      sample vocal, "world", 3, amp: 2
      
      sleep 16
      
    end
  end
end

live_loop :vcl1 do
  sync :tme
  
  with_fx :reverb, room: 1, mix: 0.7 do
    with_fx :echo,decay: 4,  phase: 5  do
      
      sample vocal, "world", 5, amp: 3, attack: 0.2
      #sample vocal, "world", 3
      
      sleep 16
      
    end
  end
end




live_loop :bzaws do
  sync :tme
  
  fx =   with_fx :gverb, spread: 1,release: 4,
  room: 1,  mix: slider do
    fx
    slider = 0
    #sleep 2
    
    with_fx :distortion, mix: 1 do
      with_fx :krush, res: 0.9 do
        with_fx :octaver,  sub_amp: 0.3 do
          use_synth :dsaw
          sleep 1
          cue :pulse
          play (scale :ds2, :minor_pentatonic).pick,
            release: 6 , amp: 0.1, attack: 1
          
          
          sleep 1
          sleep 4 if dice = 3
          #slider = 1 if dice = 1
        end
      end
    end
  end
end


live_loop :padszaws do
  sync :tme
  
  fx =   with_fx :gverb, spread: 1,release: 4, room: 1,  mix: slider do
    fx
    with_fx :lpf, cutoff:  40  do
      slider = 0
      #sleep 2
      use_synth :dsaw
      sleep 1
      play (scale :ds2, :minor_pentatonic).pick,release: 10 , amp: 1, attack: 5
      
      sleep 10
      sleep 4 if dice = 3
      slider = 1 if dice = 1
    end
  end
end

live_loop :kick do
  sync :tme
  
  sync :pulse, amp: 4
  sample impact
  sample :bd_pure, amp: 5
  sleep 1
end

#-------buildup


#sleep 5.5:

live_loop :hit do
  sync :bld1
  with_fx :reverb, room: 1, mix: 0.8 do
    sample impact0, amp: 2, decay: 5
  end
  sleep 60
end
live_loop :leadzaw do
  
  
  use_synth :tech_saws
  sync :bld2
  
  with_fx :reverb, mix: slider0 do
    with_fx :echo, mix: slider0 do
      slider0 = 0
      with_fx :compressor, mix: 0.7 do
        with_fx :band_eq, res: 0.1   do
          
          play_pattern_timed chord(:ds5, :minor7).shuffle.drop(2), [0.25],
            release: 0.2, slide: 23, cutoff: (range 50,120,10).mirror.tick
          sleep 0.75 if dice == 75
          slider0 = 0.8
          
        end
      end
    end
  end
end

with_fx :hpf, cutoff: (range 40,100,25).tick do
  live_loop :riz do
    sync :bld1
    
    use_synth :tri
    play 39, sustain: 16, attack: 2, pitch: (range 0,24,2).tick
    sleep 16
    play 39+2, sustain: 16, attack: 2, pitch: (range 0,24,2).tick
    sleep 16
    play 39+4, sustain: 16, attack: 2, pitch: (range 0,24,2).tick
    sleep 8
    play 39+8, sustain: 8, attack: 2, pitch: (range 0,24,2).tick
    stop
  end
  
  
  live_loop :drmz do
    sync :bld1
    
    with_fx :reverb, mix: 0.6, room: 0.7 do
      sleep 16
      8.times do
        sample :bd_pure, amp: 5
        sample  :elec_mid_snare
        sleep 2
      end
      4.times do
        sample :bd_pure, amp: 5
        sample  :elec_hi_snare
        sleep 2
      end
      
      16.times do
        sample :bd_pure, amp: 5
        sample  :elec_hi_snare
        sleep 0.5
      end
      32.times do
        sample :bd_pure, amp: 5
        sample  :elec_hi_snare, amp: rand
        sample :drum_roll, finish: 0.1, decay: 0.16, sustain: 0.17, amp: 2
        sleep 0.25
      end
    end
  end
  
  
  sleep 1
end





#-----------------------


live_loop :drpkick do
  sync :drp
  sample vocal, 1, amp: rand, finish: 0.5, beat_stretch: 16
  sleep 16
  
end



live_loop :drpkicks do
  with_fx :distortion do
    
    sync  "/cue/drp2"
    sample  :bd_mehackit, amp: 4, finish: 0.7
    sleep 1
  end
end


live_loop :drpkick1 do
  with_fx :distortion do
    sync "/live_loop/bzaws1"
    sync "/live_loop/leadzaw"
    10.times do
      sleep 0.25
      sample :drum_cymbal_open, amp: rand if dice == 420
      
      sample :drum_cymbal_closed, amp: rrand_i(0.3,1.5)
    end
    sample :drum_cymbal_open, decay: 0.2, finish: 0.3 if dice == 4
  end
end


live_loop :bzaws1 do
  sync :drp2
  bsamp = 1
  # with_fx :slicer, smooth_up: 1, phase: 0.5   do
  
  with_fx :gverb, spread: 1,release: 0.2,
  room: 1,  mix: slider do
    
    slider = 0
    
    
    with_fx :distortion, mix: 1 do
      with_fx :slicer, mix: 1 do
        
        #with_fx :krush, res: 0.9 do
        with_fx :octaver,  sub_amp: 1 do
          use_synth :dsaw
          sleep 1
          cue :pulse
          play (scale :ds2, :minor_pentatonic).pick,
            release: 0.75 , amp: (range 0,0.5,0.4).mirror.tick, attack: 1, finish: 0.2
          
          #sleep 1
          slider = 1 if dice = 1
        end
      end
    end
  end
  #end
  
end

live_loop :vcldrp do
  sync :drp
  
  with_fx :reverb, room: 1, mix: 0.5, amp: 5 do
    with_fx :echo,  phase: 3  do
      
      sample vocal, "world", 3, amp: 4
      
      sleep 16
      
      sample vocal, "world", 1, finish: 0.6, amp: 4
      
      sleep 16
      sample vocal, "world", 4, finish: 0.6, amp: 4
      
      sleep 16
      
      
      sample vocal, "world", 7, amp: 4
      
      sleep 16
    end
  end
  
end
live_loop :vcl12 do
  sync  :bld2
  sample vocal, "world", 5, amp: 4
  sleep 8
end


live_loop :vcldrp1 do
  sync  "/live_loop/drpkick1"
  
  with_fx :reverb, room: 1, mix: 0.5, amp: 5 do
    with_fx :echo,  phase: 3  do
      
      sample vocal, "world", 4, finish: 0.6, amp: 2
      sleep 16
      
    end
  end
  
end

