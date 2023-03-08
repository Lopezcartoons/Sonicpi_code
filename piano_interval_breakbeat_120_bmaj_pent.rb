bark = "user/sample"
set_link_bpm! 120

#                                                   .-'''-.
#                                                  '   _    \
#_________   _...._     .--.            _..._    /   /` '.   \
#\        |.'      '-.  |__|          .'     '. .   |     \  '
# \        .'```'.    '..--.         .   .-.   .|   '      |  '
#  \      |       \     \  |    __   |  '   '  |\    \     / /
#   |     |        |    |  | .:--.'. |  |   |  | `.   ` ..' /
#   |      \      /    .|  |/ |   \ ||  |   |  |    '-...-'`
#   |     |\`'-.-'   .' |  |`" __ | ||  |   |  |
#   |     | '-....-'`   |__| .'.''| ||  |   |  |
#  .'     '.                / /   | ||  |   |  |
#'-----------'              \ \._,\ '/  |   |  |
#                            `--'  `"'--'   '--'
#/|                     __.....__                   .       /|              __.....__
#||                 .-''         '.               .'|       ||          .-''         '.
#||        .-,.--. /     .-''"'-.  `.           .'  |       ||         /     .-''"'-.  `.               .|
#||  __    |  .-. /     /________\   \    __   <    |       ||  __    /     /________\   \    __      .' |_
#||/'__ '. | |  | |                  | .:--.'.  |   | ____  ||/'__ '. |                  | .:--.'.  .'     |
#|:/`  '. '| |  | \    .-------------'/ |   \ | |   | \ .'  |:/`  '. '\    .-------------'/ |   \ |'--.  .-'
#||     | || |  '- \    '-.____...---.`" __ | | |   |/  .   ||     | | \    '-.____...---.`" __ | |   |  |
#||\    / '| |      `.             .'  .'.''| | |    /\  \  ||\    / '  `.             .'  .'.''| |   |  |
#|/\'..' / | |        `''-...... -'   / /   | |_|   |  \  \ |/\'..' /     `''-...... -'   / /   | |_  |  '.'
#'  `'-'`  |_|                        \ \._,\ '/'    \  \  \'  `'-'`                      \ \._,\ '/  |   /
# ____________  ____________           `--'  `"'------'  '---'                             `--'  `"   `'-'
#/___________/\/___________/\
#\___________\/\___________\/
#
# ____________  ____________
#/___________/\/___________/\
#\___________\/\___________\/




with_fx :echo, phase: 3, decay: 1.5, mix: 0.2 do
  live_loop :synths do
    use_synth :piano
    sync :bar
    32.times do
      use_synth_defaults amp: rrand(0.2,0.3), attack: rrand_i(0.5,2), sustain: rrand_i(0,1), release: rrand_i(0,0.75), mod_range: 12, mod_phase: 0.75, mod_invert_wave: 1
      play_pattern_timed scale(:b3, :major_pentatonic, num_octaves: 2).shuffle.pick(rrand_i(1,4)), 0.125, release: 0.1
      sleep 0.25 if dice == 0.5
      sleep 0.5 if dice == 1
      sleep 8 if dice == 2
      sleep 4 if dice == 100
    end
  end
end

live_loop :synth1, delay: 4 do
  sync :bar
  
  use_synth :piano
  use_synth_defaults amp: rrand(0.2,0.5), attack: rrand_i(0,3), sustain: rrand_i(0.5,2), release: rrand_i(0,2), mod_range: 12, mod_phase: 0.75, mod_invert_wave: 1
  note = (scale :b2, :super_locrian).look
  
  step1 =  (chord_degree :i, note, :major, 3)
  step2 =  (chord_degree :ii, note, :major, 3)
  step3 =  (chord_degree :iii, note, :major, 3)
  step4 =  (chord_degree :iv, note, :major, 3)
  step5 =  (chord_degree :v, note, :major, 3)
  step6 =  (chord_degree :vi, note, :major, 3)
  step7 =  (chord_degree :vii, note, :major, 3)
  
  
  
  16.times do
    play_chord step1
    sleep 2
    play_chord step5
    sleep 1
    play_chord step6 if dice == 3
    sleep 1
    play_chord step7
    sleep 1
    play_chord step6 if dice == 3
    sleep 1
    play_chord step7
    sleep 1
    play_chord step5
    
    sleep 0.5
    sleep 1 if dice == 0.5
    sleep 0.5 if dice == 1
  end
end



live_loop :synth2 do
  sync :baz
  
  use_synth :piano
  use_synth_defaults amp: rrand(0.2,0.5), attack: rrand_i(0,0.5), sustain: rrand_i(0,2), release: rrand_i(0.5,2), mod_range: 12, mod_phase: 0.75, mod_invert_wave: 1
  note = (scale :b2, :super_locrian).look
  
  step1 =  (chord_degree :i, note, :major, 3)
  step2 =  (chord_degree :ii, note, :major, 3)
  step3 =  (chord_degree :iii, note, :major, 3)
  step4 =  (chord_degree :iv, note, :major, 3)
  step5 =  (chord_degree :v, note, :major, 3)
  step6 =  (chord_degree :vi, note, :major, 3)
  step7 =  (chord_degree :vii, note, :major, 3)
  
  
  8.times do
    
    play_chord step1, attack: rrand_i(0,0.8), release: rrand_i(0.5,2)
    sleep 2
    play_chord step3
    sleep 1
    play_chord step7, release: rrand_i(0.5,2) if dice == 3
    sleep 0.5
    play_chord step5, attack: rrand_i(0,0.8)
    sleep 0.5
    play_chord step5 if dice == 3
    sleep 1
    play_chord step3,  attack: rrand_i(0,0.8), release: rrand_i(0.5,2)
    sleep 1
    play_chord step5, attack: rrand_i(0,0.8)
    
    sleep 0.5
    sleep 1 if dice == 0.5
    sleep 0.5 if dice == 1
  end
end





with_fx :echo, phase: 3, decay: 1.5, mix: 0.2 do
  
  live_loop :synths4 do
    sync :foo
    
    use_synth :piano
    32.times do
      use_synth_defaults amp: rrand(0.2,0.3), attack: rrand_i(0.3,0.8), sustain: rrand_i(0.5,1), release: rrand_i(0.2,0.75), mod_range: 12, mod_phase: 0.75, mod_invert_wave: 1
      play_pattern_timed scale(:b3, :major_pentatonic, num_octaves: 2).shuffle.pick(rrand_i(1,4)), 0.25, attack: rrand_i(0,2)
      sleep 0.25 if dice == 0.5
      sleep 0.5 if dice == 1
      sleep 8 if dice == 2
      sleep 4 if dice == 100
    end
  end
end

live_loop :synth5, delay: 4 do
  sync :foo
  
  use_synth :piano
  use_synth_defaults amp: rrand(0.2,0.5), attack: rrand_i(0.4,3), sustain: rrand_i(0.5,2), release: rrand_i(0.5,2), mod_range: 12, mod_phase: 0.75, mod_invert_wave: 1
  note = (scale :b2, :super_locrian).look
  
  step1 =  (chord_degree :i, note, :major, 3)
  step2 =  (chord_degree :ii, note, :major, 3)
  step3 =  (chord_degree :iii, note, :major, 3)
  step4 =  (chord_degree :iv, note, :major, 3)
  step5 =  (chord_degree :v, note, :major, 3)
  step6 =  (chord_degree :vi, note, :major, 3)
  step7 =  (chord_degree :vii, note, :major, 3)
  
  
  4.times do
    
    play_chord step1
    sleep 2
    play_chord step3, attack: rrand_i(0,0.8), release: rrand_i(0.5,2)
    sleep 1
    play_chord step7 if dice == 3
    sleep 1
    play_chord step5, attack: rrand_i(0,0.8), release: rrand_i(0.5,2)
    sleep 1
    play_chord step5 if dice == 3
    sleep 1
    play_chord step3, attack: rrand_i(0,0.8), release: rrand_i(0.5,2)
    sleep 1
    play_chord step5
    
    sleep 0.5
    sleep 1 if dice == 0.5
    sleep 0.5 if dice == 1
  end
end

with_fx :slicer, phase: rrand(0.2,4), wave: 0, probability: 0.95 ,phase_offset: 1,smooth_up: 0.5, seed: 666  do
  with_fx :reverb, mix: rrand_i(0.2,0.6), room: 1 do
    live_loop :idm_bb do
      
      sync :foo
      #sync "/live_loop/synths4"
      #sync "/live_loop/kick"
      n = [1,2,4,8,4].choose
      sample :drum_heavy_kick, amp: 0.5#rrand(0.4,0.8)
      #sample :ambi_drone, rate: [0.25, 0.5, 0.125, 1].choose, amp: 0.1 if one_in(8)
      #sample :ambi_lunar_land, rate: [0.5, 0.125, 1, -1, -0.5].choose, amp: 0.1 if one_in(8)
      #sample bark, attack: rrand(0.2,0.4), release: 0.5,beat_stretch: 20,slice: 8, start: 1 - (1.0 / n),amp: rrand(0.3,0.6),cutoff: rrand(90,110), rate: [1,1,1,-1,1,1,-1].choose
      sample bark, attack: 0, release: 0.01, start: 1 - (1.0 / n),num_slices: 32,beat_stretch: 32,amp: rrand(0.2,0.5),cutoff: rrand(90,110), rate: [1,1,1,1,1,1,-1].choose
      sleep sample_duration(bark) / n
      # sample :drum_heavy_kick, amp: rrand(0,0.4)
      #sleep 32*2 if dice == 300
    end
  end
end


live_loop :synth7, delay: 4 do
  sync :roo
  
  use_synth :piano
  use_synth_defaults amp: rrand(0.5,1), attack: rrand_i(1,4), sustain: rrand_i(5,9), release: rrand_i(0.5,8), mod_range: 12, mod_phase: 0.75, mod_invert_wave: 1
  note = (scale :b2, :super_locrian).look
  
  step1 =  (chord_degree :i, note, :major, 3)
  step2 =  (chord_degree :ii, note, :major, 3)
  step3 =  (chord_degree :iii, note, :major, 3)
  step4 =  (chord_degree :iv, note, :major, 3)
  step5 =  (chord_degree :v, note, :major, 3)
  step6 =  (chord_degree :vi, note, :major, 3)
  step7 =  (chord_degree :vii, note, :major, 3)
  
  
  4.times do
    
    play_chord step1
    sleep 4
    play_chord step3
    sleep 2
    play_chord step7 if dice == 3
    sleep 4
    play_chord step5
    sleep 2
    play_chord step5 if dice == 3
    sleep 4
    play_chord step3
    sleep 2
    play_chord step5
    
    sleep 0.5
    sleep 1 if dice == 0.5
    sleep 0.5 if dice == 1
  end
end



with_fx :echo, phase: 4, decay: 2, mix: 0.4 do
  live_loop :synths9 do
    sync :woo
    
    use_synth :piano
    32.times do
      use_synth_defaults amp: rrand(0.2,0.3), attack: rrand_i(0,2), sustain: rrand_i(0.8,2), release: rrand_i(0.25,0.75), mod_range: 12, mod_phase: 0.75, mod_invert_wave: 1
      play_pattern_timed scale(:b3, :major_pentatonic, num_octaves: 3).shuffle.pick(rrand_i(1,5)), 0.25
      sleep 0.25 if dice == 0.5
      sleep 0.5 if dice == 1
      sleep 8 if dice == 2
      sleep 4 if dice == 100
    end
  end
end





live_loop :kick, delay: 8 do
  stop
  #sync "/live_loop/synth1"
  #sync "/live_loop/idm_bb"
  vol = rrand_i(0.1,0.4)
  sample :bd_haus , amp: vol
  sleep 0.5
  #sample :bd_haus, amp: vol if dice == 5
  sleep 0.5
  sample :bd_haus, amp: vol
  sleep 0.5 #if dice == 0.2
  sample :bd_haus , amp: vol if dice == 4
  sleep 0.5
  sample :bd_haus, amp: vol
  sleep 0.5 #if dice == 0.5
  sample :bd_haus, amp: vol if dice == 10
  sleep 0.5
  sample :bd_haus, amp: vol if dice == 1
  sleep 0.25
  sample :bd_haus, amp: vol if dice == 8
  sleep 0.25 #if dice == 1
  sample :bd_haus, amp: vol if dice == 6
  sleep 0.5
  
  
end

#with_fx :gverb, pre_damp: 1, mix: 0.3, spread: 1, damp: rrand_i(0.3,0.8) do
# live_loop :chrds, delay: 4 do
#  use_synth  :piano
# use_synth_defaults amp: rrand(0,0.5), attack: rrand_i(0.2,2), sustain: rrand_i(0.5,2), release: rrand_i(0,0.75), mod_range: 12, mod_phase: 0.75, mod_invert_wave: 1

#play chord(:B2, :major).shuffle.pick(3)
# sleep 1
#sleep 0.5 if dice = 1
# sleep 3 if dice = 16
#end
#end_
live_loop :check do
  stop
  cue "/cue/foo"
  sleep 6
  
end

live_loop :picks do
  # cue "/cue/baz"
  #stop
  cue "/cue/woo"
  sleep 4
  cue :roo
  cue "/cue/bar"
  sleep 16
  3.times do
    cue [:baz, :baz, :bar, :baz, :bar, :baz].shuffle.choose
    sleep 16
  end
  1.times do
    cue [:baz, :baz, :bar, :baz, :bar, :baz].shuffle.choose
    cue :woo
    
    sleep 16
    
  end
  32.times do
    cue [:baz, :foo, :bar, :foo, :bar, :foo].choose
    sleep 8
    
  end
  cue :woo
  
  32.times do
    cue [:foo, :foo, :bar, :foo, :bar, :foo].choose
    
    sleep 4
  end
  cue :roo
  sleep 4
  
end