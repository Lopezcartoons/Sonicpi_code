#newhousesketch

with_fx :ixi_techno, phase: rrand_i(0.2,3), mix: 0.1 do
  live_loop :sprsw do
    use_synth  :supersaw
    sleep 4 if dice = 1
    
    
    #play chord(:a3, :minor7).shuffle.pick(1), release: 0.4, attack: rrand_i(0.2, 1),amp: 0.4 if dice == 2
    # play chord(:a2, :minor7).shuffle.pick(1), release: rand, attack: rrand_i(0.8, 1.5),amp: rand if dice == 1
    
    sleep 0.25
    sleep 0.25 if dice == 1
    
    #play chord(:a4, :minor).shuffle.pick(2), attack: 0.5,release: 0.2, amp: 0.1 if dice == 1
    sleep 0.25
    #play chord(:a3, :minor7).shuffle.pick(1), release: 0.3, attack: rrand_i(0.3, 1.5), amp: 0.2
    
    sleep 0.25 if dice = 1
  end
end



live_loop :bdrm do
  
  use_synth :sine
  # play 33,release: 0.2,  amp: 1.5
  sleep 1
  # play 33,release: 0.2 if dice == 1
  sleep 0.5
end

live_loop :hhdrm do
  stop
  use_synth :bnoise
  sleep 0.25
  play 69,decay: 0.02, env_curve: 6, release: rrand_i(0,0.5) , amp: rrand_i(0,0.9) #rrand_i(0,0.8)
  sleep 0.25
  play 69,decay: 0.02, env_curve: 6, release: rrand_i(0,0.5) , amp: rrand_i(0.1,0.8) if dice == 1
  
end


live_loop :splash do
  stop
  use_synth :pnoise
  sleep 8
  sleep 1 if dice == 2
  play 69,decay: 0.2, amp: 0.2,env_curve: 3,  release: 0.3, cutoff: 120  if dice == 3
end


live_loop :sdrm1 do
  
  
  use_synth :chipnoise
  sleep 1
  
  #  play 116, env_curve: 4, release: 0.1, freq_band: 6,  amp: 0.27 if dice == 1
end

with_fx :ixi_techno, phase: rrand_i(0.25,3) do
  with_fx :distortion, distort: 0.7 do
    live_loop :sbss do
      
      
      use_synth  :mod_sine
      sleep 0.5
      
      
      #play chord(:a0, :minor7).shuffle.pick(1), release: rand, attack: rand, amp: 0.3 , mod_phase: 0.5
      
      sleep 1
      # play chord(:a1, :minor).shuffle.pick(1) , amp: 0.3, mod_phase: 0.5 if dice == 1
      sleep 0.5
    end
  end
end

live_loop :piano do
  
  use_synth  :piano
  
  play chord(:a4, :minor7).shuffle.pick(1), release: rand, attack: rrand_i(0.4, 1.5) if dice == 2
  #play chord(:a2, :minor7).shuffle.pick(1), release: rand, attack: rrand_i(0.8, 1.5) if dice == 1
  
  sleep 0.75
  sleep 0.25 if dice == 1
  
  #  play chord(:a4, :minor).shuffle.pick(2), attack: 1.5 if dice == 1
  sleep 0.25
  #play chord(:a3, :minor7).shuffle.pick(1), release: rand, attack: rrand_i(0.9, 1.5), amp: rand
  
  sleep 0.75 if dice = 1
  
end
live_loop :pad do
  
  use_synth  :piano
  
  # play chord(:a2, :minor7).shuffle.pick(1), release: 2, attack: rrand_i(0.8, 1.5) if dice == 2
  # play chord(:a3, :minor7).shuffle.pick(1), release: rand, attack: rrand_i(0.8, 1.5) if dice == 1
  
  sleep 1
  sleep 0.25 if dice == 1
  
  #play chord(:a1, :minor).shuffle.pick(2), attack: 1.5, release: 2 if dice == 1
  sleep 0.25
  play chord(:a3, :minor7).shuffle.pick(1), release: rand, attack: rrand_i(0.9, 1.5), amp: rand
  
  sleep 0.75 if dice = 1
  
end

live_loop :trumpet do
  lfo1 = (range 0.5, 0.8, 0.4).mirror.tick
  use_synth :tech_saws
  sleep 0.5
  # play chord(:a4, :minor7).shuffle.pick(2), release: 0.2, attack: 0.6, sustain: 0.4, cutoff: lfo1*100, pitch: 0.25 ,decay: rrand_i(0,0.5)
  sleep 1.75
  sleep 4 if dice == 4
end


with_fx :ring_mod, freq: rrand_i(70,100) do
  
  
  with_fx :ixi_techno, phase: rrand_i(0.25,3) do
    with_fx :tremolo, depth: 0.4 do
      
      with_fx :slicer, phase: rrand_i(0.25,1), pulse_width: rand,smooth: rand,smooth_up: 0.5, wave: rrand_i(0,3) do
        
        # with_fx :autotuner, pre_mix: 0.8, pre_amp: 0.6, formant_ratio: rrand_i(0.1, 2),amp: 3 do |a|
        #with_fx :vowel, vowel_sound: rrand_i(1,5) ,voice: 4, amp: 0.2  do
        with_fx :gverb, spread: rand, damp: rand,room: 3, tail_level: 0.2,mix: 0.3 do
          with_fx :slicer, phase: rrand_i(1,2),smooth: rand, wave: rrand_i(0,3) do
            
            live_loop :speech do
              
              
              use_synth :mod_fm
              #  play choose(chord(:a4, :minor).shuffle), amp: 0.2,attack: 0.1,release: 0.3,sustain: 0.2, cutoff: 80, env_curve: 7,  divisor: rrand_i(1,2), depth: rrand_i(1,1.5), mod_phase: rrand_i(0.005, 0.4), mod_phase: rrand_i(0.005, 0.2), mod_range: rrand_i(1,18), mod_pulse_width: rrand_i(0.5,1), mod_phase_offset: rand, mod_wave: 1,_slide: rand if dice == 1
              
              sleep 1
              play choose(chord(:a4, :minor).shuffle) ,amp: rrand_i(0,0.4), attack: 0.5,release: 0.3,sustain: 0.5, cutoff: 80, env_curve: 7,  divisor: rrand_i(1,2), depth: rrand_i(1,1.5), mod_phase: rrand_i(0.005, 0.4), mod_phase: rrand_i(0.005, 0.2), mod_range: rrand_i(1,18), mod_pulse_width: rrand_i(0.5,1), mod_phase_offset: rand, mod_wave: 1,_slide: rand
              
              sleep 1
              # play choose(chord(:a3, :minor).shuffle),amp: 0.8,  attack: 1,release: rand,sustain: 0.5, cutoff: 110, env_curve: 7,  divisor: rrand_i(1,2), depth: rrand_i(1.5,2), mod_phase: rrand_i(0.1, 0.4), mod_phase: rrand_i(0.05, 0.2), mod_range: rrand_i(1,12), mod_pulse_width: rrand_i(0.5,1), mod_phase_offset: rand, mod_wave: 1,_slide: rand #if dice == 1
              sleep 2
              play choose(chord(:a2, :minor).shuffle), amp: 0.5, release: 3, env_curve: 6,  divisor: rrand_i(1,5), depth: rand, mod_phase: rrand_i(0.005, 0.5) if dice == 2
              #  control a, note: (scale :a1, :minor_pentatonic, num_octaves: 2).choose
            end
          end
        end
      end
    end
  end
end
#end




