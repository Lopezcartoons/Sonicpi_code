vocal = folder hear

use_bpm 130

live_loop :clck do
  sleep 1
end


live_loop :cr8_trigger do
  sync  "/live_loop/clck"
  midi_clock_beat
end


with_fx :ixi_techno, phase: 20  do
  live_loop :vcl do
    sample vocal, rate: 0.5, start: rand, finish: 0.5
    sleep 4
  end
end


live_loop :piano do
  with_fx :gverb,  mix: 0.6 do
    use_synth :piano
    play choose(chord(:f1-1, :m7)), release: 2, cutoff: rrand(1,130)
    
    sleep 1
    play choose(chord(:f1, :m7)), release: 2, cutoff: rrand(1,130)
    sleep 3
    play choose(chord(:f1, :m7)), release: 2, cutoff: rrand(1,130)
    sleep 5
  end
end

live_loop :piano2 do
  with_fx :reverb,room: 1 do
    
    with_fx :echo, decay: 2 do
      use_synth :piano
      sleep 0.5
      sleep 1.5 if dice == 3
      play (scale :f3, :minor_pentatonic).shuffle.tick,release: 1.5
    end
  end
end





