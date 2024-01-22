radio1 = "C:/Users/"
city1 = "C:/Users/"
city2 = "C:/Users/"
with_fx :reverb do
  
  live_loop :atmos do
    sample city1 , rate: rand, sustain: 5, start: rand, release: 4, attack: rand,amp: rrand(0.1,2.5), cutoff: rrand(30,80)#lpf: rrand(40,70)
    sleep 4
  end
  
  live_loop :rdio, delay: 32*2 do
    sync "/cue/secnd"
    
    sp_rate = [1, 0.5, -1, -0.5, 0.75,-0.75,0.25, 0.25,-0.5].choose
    sample radio1 , rate: sp_rate , sustain: 5, start: rand, release: 4, attack: rand,amp: rrand(0.1,1), lpf: rrand(20,120) #cutoff: rrand(30,100)
    sleep 2
    sample radio1 , rate: sp_rate, sustain: rand, start: rand, release: 1, attack: rand,amp: rrand(0.1,2), hpf: rrand(20,119) #cutoff: rrand(30,100)
    
    sleep 2
  end
end




live_loop :pad do
  sync "/cue/first"
  use_synth :dark_ambience
  play choose(chord(:e2, :m7)), release: rrand_i(3, 8), cutoff: rrand(1,130), attack: rand, amp: 4
  sleep 2
end


notes = (ring :E4, :Fs4, :B1, :Cs5, :D1, :Fs4, :E4, :Cs3, :B4, :Fs4, :D5, :Cs5)


live_loop :slow, delay: 6 do
  sync  "/cue/secnd"
  
  use_synth  :kalimba
  
  play notes.tick, release: rrand(0.1, 0.5), amp: rrand(0,4)# if dice == 2
  #sleep 0.3*2
  sleep 0.5
  sleep 1 if dice == 3
end

live_loop :faster, delay: 12 do
  sync "/cue/secnd"
  #use_random_seed 50
  
  use_synth  :kalimba#:piano
  
  play notes.tick, release: rrand(5, 1), amp: rrand(0,3)
  sleep 0.3
  #sleep 0.295*2
  sleep 1 if dice == 3
end

live_loop :dsaw,delay: 32*4 do
  sync "/cue/thrd"
  
  use_synth :dsaw
  stop
  play choose(chord(:e1, :m7)), release: rrand_i(0, 5), cutoff: rrand(1,80), attack: 3, amp: rrand(0,2)
  sleep 4
end

live_loop :kick, delay: 32*2 do
  sync  "/cue/thrd"
  
  #  use_synth  :sine
  use_synth :subpulse
  #stop
  sample :bd_boom, amp: rrand(0.5,0.8), decay: rrand(0.1,0.5), res: rrand(60,100)
  sample :bd_haus, decay: 0.2, amp: 0.5
  sleep 1
  #sleep 1 if dice == 3
end

live_loop :sub, delay: 32*2 do
  sync "/cue/thrd"
  
  #stop
  #  use_synth  :sine
  use_synth :subpulse
  
  sleep 0.5
  play 28,  sub_amp: 2, release: rrand(0,1), amp: rrand(0.1,2), attack: 0.2
  #sample :bass_trance_c, amp: 2, res: rrand(60,100), attack: 0.3, release: rrand(0,0.4), rate: 0.5, decay: 0.2
  sleep 0.5
  
end

live_loop :tops,delay: 32*4  do
  sync "/cue/frth"
  
  #stop
  sample :arovane_beat_e,attack: rand,cutoff: rrand(70,90), amp: rrand(0,0.5) if dice == 5
  
  sleep 1
  sample :sn_dub, cutoff: rrand(80,110), decay: 0.3, amp: rrand(0,0.2)
  sleep 1
end


live_loop :hats, delay: 32 do
  sync "/cue/secnd"
  
  #stop
  sleep 0.25
  #sample :hat_psych, release: rand, cutoff: rrand(80,100), pan: rrand(-1,1), amp: rrand(0.1,3) if dice == 5
  
  sleep 0.25
  sample :hat_psych, release: 2, cutoff: rrand(80,100), pan: rrand(-1,1), amp: rrand(0.1,0.2) #if dice == 2
  
end


live_loop :clock do
  cue "/cue/first" #if dice == 4
  cue "/cue/secnd" #if dice == 2
  cue "/cue/thrd"
  cue "/cue/frth" #if dice == 3
  sleep 0.5
end





stop

live_loop :pad do
  use_synth :dark_ambience
  play choose(chord(:e2, :m7)), release: rrand_i(3, 5), cutoff: rrand(1,130), attack: rand, amp: 4
  sleep 2
end

live_loop :arp2, delay: 32*4 do
  # stop
  use_synth :chiplead #:tech_saws
  play_pattern_timed chord(:E5, :m7,).pick(3), 0.5, sustain: 0.2, amp: rrand_i(0.1, 0.8), note_slide: 2
  sleep 4
  play_pattern_timed chord(:E3, :m7,).pick(2), 1, sustain: 0.3,amp: rrand_i(0.5, 0.9)  if dice == 3
  
  sleep 2 if dice == 2
end
"C:/Users/desig/Downloads/citizen_dj_audio_clip_1705533991270.wav"
live_loop :arp do
  # stop
  use_synth :tech_saws
  play_pattern_timed chord(:E2, :m7,).pick(3), 0.5,  sustain: 0.5, amp: rrand_i(0.1, 0.8)
  sleep 1
  play_pattern_timed chord(:E2, :m7,).pick(2), 1, sustain: 0.3, amp: 2  if dice == 3
  
  sleep 1 if dice == 2
end

live_loop :clck do
  #cue ("/live_loop/drum").pick
  #cue [:foo, :bar, :baz, :woo].choose
  cue "/cue/far"
  sleep 8
  cue "/cue/bar"
  sleep 8
  cue "/cue/woo"
  sleep 8
  cue "/cue/woo"
  sleep 2
  cue "/cue/baz"
  sleep 2
  cue "/cue/baz"
  sleep 2
  cue "/cue/baz"
  sleep 2
  cue "/cue/baz"
  sleep 2
  cue "/cue/baz"
  sleep 4
  cue "/cue/woo"
  sleep 2
  cue "/cue/baz"
  sleep 2
  cue "/cue/baz"
  sleep 2
  cue "/cue/baz"
  sleep 2
  cue "/cue/baz"
  sleep 2
  cue "/cue/baz"
  sleep 4
  
end

live_loop :drum, delay: 32 do
  #stop
  sync :foo
  8.times do
    
    # sample :drum_bass_hard
    sample :bd_boom, amp: 1.5
    
    sleep  0.25
    sleep 0.25
    sample  :hat_noiz, sustain: 0.1, amp: rand if dice == 2
    
    sleep 0.5
  end
end

live_loop :drum4,delay: 32*2 do
  #stop
  sync :woo
  8.times do
    
    sample :drum_bass_hard
    sample :bd_boom, amp: 1.5
    
    sleep  0.25
    sleep 0.25
    sample  :hat_noiz, sustain: 0.1, amp: rand
    
    sleep 0.5
  end
end
live_loop :drum2, delay: 32*4 do
  sync :bar
  
  sample :drum_bass_hard
  sample :bd_boom, amp: 1.5
  
  sleep  0.25
  sample  :hat_noiz, sustain: 0.1, amp: rand if dice == 1
  sleep 0.25
  sample  :hat_noiz, sustain: 0.1, amp: rand
  
  sleep 0.5
end

live_loop :drum3, delay: 32*4 do
  sync :baz
  
  sample :drum_bass_hard
  sample :bd_boom, amp: 1.5
  
  
  sleep  0.25
  sample  :hat_noiz, sustain: 0.1, amp: rand if dice == 1
  sleep 0.25
  sample  :hat_noiz, sustain: 0.1, amp: rand
  
  sleep 0.5
  #sync :baz
  
  sample :drum_bass_hard
  sample :bd_boom, amp: 1.5
  sample  :sn_zome
  
  sleep  0.25
  sample  :hat_noiz, sustain: 0.1, amp: rand if dice == 1
  sleep 0.25
  sample  :hat_noiz, sustain: 0.1, amp: rand
  
  sleep 0.5
  
end

load_samples(sample_names :glitch)
sleep 2

with_fx :reverb, mix: 0.8 do
  with_fx :slicer do
    live_loop :foo do
      # try changing the sp_ vars..
      sp_name = choose sample_names :glitch
      # sp_name = choose sample_names :drum
      sp_time = [1, 2].choose
      #sp_time = 0.5
      sp_rate = 2
      #sp_rate = 4
      
      s = sample sp_name, cutoff: rrand(40, 130), rate: sp_rate * choose([0.5, 1, -0.5, -1]), pan: rrand(-1, 1), pan_slide: sp_time, amp: rand
      control s, pan: rrand(-1, 1)
      sleep sp_time
    end
  end
end
with_fx :reverb do
  live_loop :cty do
    sample city2 , rate: rand, sustain: 5, start: rand, release: 4, attack: rand,amp: rrand(0.1,2.5), lpf: rrand(20,120) #cutoff: rrand(30,100)
    sleep 4
  end
end


use_random_seed 10
#notes =  (ring :b4, :b2, :e1, :e2, :b3, :e3)
notes = (ring :E4, :Fs4, :B1, :Cs5, :D1, :Fs4, :E4, :Cs3, :B4, :Fs4, :D5, :Cs5)

live_loop :tron do
  #stop
  with_synth :dsaw do
    with_fx(:slicer, phase: [0.25,0.125].choose) do
      with_fx(:reverb, room: 0.5, mix: 0.3) do
        
        n1 = (chord notes.choose, :minor).choose
        n2 = (chord notes.choose, :minor).choose
        
        p = play n1, amp: 2, release: 8, note_slide: 4, cutoff: 30, cutoff_slide: 4, detune: rrand(0, 0.2), amp: 0.5
        control p, note: n2, cutoff: rrand(80, 120)
      end
    end
  end
  
  sleep 32
end

#notes = (ring :E4, :Fs4, :B4, :Cs5, :D5, :Fs4, :E4, :Cs5, :B4, :Fs4, :D5, :Cs5)

live_loop :slow do
  use_synth  :kalimba
  
  play notes.tick, release: rrand(0.1, 0.5), amp: rrand(0,4)# if dice == 2
  #sleep 0.3*2
  sleep 0.5*2
end

live_loop :faster do
  use_synth  :kalimba#:piano
  
  play notes.tick, release: rrand(5, 1), amp: rrand(0,3)
  sleep 0.3*2
  #sleep 0.295*2
end


