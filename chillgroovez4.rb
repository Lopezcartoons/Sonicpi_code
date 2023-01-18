#ambient synth machine By Equal Equals

live_loop :clock do
  cue [:first, :second, :first].choose
  sleep 0.8
end

live_loop :pluckclck do
  16.times do
    cue :fourth
    sleep 2
  end
  16.times do
    cue :third
    sleep 3
  end
  
end
live_loop :percclck do
  
  cue :perc
  sleep 2
end


live_loop :piano do
  # sync :first
  use_synth :piano
  play chord( :e5, :min).pick(3), attack: 1, decay: 1, amp: rand #if dice == 1
  sleep 3
  play chord( :e2, :m7).pick(2), attack: 2, amp: 0.4, decay: 3 if dice == 2
  sleep 1
  play chord( :e4, :m7).pick(3), attack: 2, amp: 0.4, decay: 5 if dice == 5
  sleep 2
end

with_fx :echo, decay: 8 do
  live_loop :pluck do
    sync :third
    stop
    use_synth :pluck
    sleep 1
    sleep 0.25
    play choose(chord( :g3, :major7)), amp: 0.2,  sustain: rand, cutoff: rrand_i(80,110)
    sleep rand if dice == 1
    sleep 0.25
    sleep 3
    play choose(chord( :g4, :major7)), amp: 0.2, release: rand, sustain: rand if dice == 2
    sleep 5 if dice == 5
  end
end

with_fx :echo, decay: 3 do
  live_loop :pluck2 do
    sync :fourth
    
    use_synth :pluck
    sleep 0.25
    play choose(chord( :g3, :major7)), amp: 0.2,  sustain: rand, attack: 0.4, decay: 0.6,cutoff: rrand_i(80,110)
    sleep rand if dice == 1
    sleep 0.25
    play choose(chord( :g4, :major7)), amp: 0.2, release: rand, sustain: rand,attack: 0.2,decay: 0.6, cutoff: rrand_i(80,110) if dice == 2
    sleep 3 if dice == 5
  end
end

live_loop :bass do
  sync "/live_loop/pluck"
  use_synth :mod_sine
  stop
  play choose(chord( :e2, :minor)), amp: 0.09, attack: 4, mod_pulse_width: 0.9, mod_phase: 0.9
  sleep 6
end

live_loop :lead do
  sync "/live_loop/piano"
  stop
  use_synth :dsaw
  play choose(chord( :e4, :m7)), amp: 0.1, attack: 2, release: 3, cutoff: rrand_i(50,90), detune: rrand_i(0,0.5) #if dice == 2
  sleep 3
  sleep 1 if dice == 1
  play choose(chord( :e3, :m7)), amp: 0.05, attack: 1, release: 3, cutoff: rrand_i(80,110), detune: rrand_i(0,0.5) if dice == 4
  sleep 1
end

live_loop :arp do
  sync "/live_loop/piano"
  stop
  sleep 2 if dice == 1
  sleep rand
  use_synth :sine
  play choose(chord( :e4, :m7)), amp: 0.2, attack: 0.2,release: rrand_i( 0.1,0.5), cutoff: rrand_i(70,90), detune: rrand_i(0,0.5) #if dice == 2
  sleep 0.25
  sleep 0.5 if dice == 1
  play choose(chord( :e3, :m7)), amp: 0.1, release: 0.3, cutoff: rrand_i(80,110), detune: rrand_i(0,0.5) if dice == 4
  sleep 0.25
  play choose(chord( :e4, :m7)), amp: 0.1, release: 0.5, cutoff: rrand_i(80,110), detune: rrand_i(0,0.5) #if dice == 4
  sleep 0.25
  play choose(chord( :e3, :m7)), amp: 0.1, release: 0.3, cutoff: rrand_i(80,110), detune: rrand_i(0,0.5)
  sleep 0.25
end

with_fx :echo, decay: 16 do
  live_loop :bells do
    
    use_synth :pretty_bell
    sleep 20
    sleep 1
    play chord( :g4, :M7).pick(1), decay: 0.3, amp: 0.01, cutoff: rrand_i(70,80)
    sleep 0.5
    play chord( :e3, :min).pick(3), decay: rand, amp: 0.07, cutoff: rrand_i(70,80)
    sleep 1
    play chord( :g4, :M7).pick(1), decay: 0.2, amp: 0.01, cutoff: rrand_i(40,60)
  end
end

#----

live_loop :bdrm do
  sync :perc
  use_synth :sine
  stop
  play 28,release: 0.2,  amp: 0.5
  sleep 1
  play 28,release: 0.2, amp: 0.5 if dice == 4
  sleep 0.5
  # play 28,release: 0.2, amp: 0.9 #if dice == 1
  #sleep 0.5
  #play 28,release: 0.2,  amp: 0.9 if dice == 4
  #sleep 0.5
end
live_loop :hhdrm do
  use_synth :bnoise
  stop
  sync :perc
  sleep 0.16
  play 69,decay: 0.02, env_curve: 6, release: rrand_i(0,0.5) , amp: rrand_i(0.1,0.3) if dice == 2 #rrand_i(0,0.8)
  sleep 0.16
  play 69,decay: 0.02, env_curve: 6, release: rrand_i(0,0.5) , amp: rrand_i(0.1,0.4) if dice == 1
  
end
live_loop :sdrm1 do
  stop
  use_synth :chipnoise
  sync :perc
  sleep 0.5
  play 116, env_curve: 4, release: 0.1, freq_band: 6,  amp: 0.05 if dice == 1
end