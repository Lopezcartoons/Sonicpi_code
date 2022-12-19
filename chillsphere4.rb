mainvox = "C:/Users/samplefolder"

#
####_____                 .__                             .___
###/     \   __ __  ______|__|  ____     ____   ____    __| _/ ____
##/  \ /  \ |  |  \/  ___/|  |_/ ___\  _/ ___\ /  _ \  / __ |_/ __ \
#/    Y    \|  |  /\___ \ |  |\  \___  \  \___(  <_> )/ /_/ |\  ___/
#\____|__  /|____//____  >|__| \___  >  \___  >\____/ \____ | \___  >
#########\/            \/          \/       \/             \/     \/

##______   ______
#/_____/  /_____/
#/_____/  /_____/

#  _________                .__          __________ .__
# /   _____/  ____    ____  |__|  ____   \______   \|__|
# \_____  \  /  _ \  /    \ |  |_/ ___\   |     ___/|  |
#/        \(  <_> )|   |  \|  |\  \___   |    |    |  |
#/_______  / \____/ |___|  /|__| \___  >  |____|    |__|
#       \/              \/          \/







live_loop :vox do
  with_fx  :ixi_techno, phase: 40 do
    # sample mainvox, "Db",1, rate: - 1, decay: 0.1, release: rand, attack: 0.5, beat_stretch: 16, start: rand, hpf: 100, amp: 0.2
    sleep 12
    # sample mainvox, "ebm", 1, rate: - 1, decay: 0.1, release: 0.2, attack: 1, beat_stretch: 24, start: rand, hpf: 75, amp: 0.5 if dice = 50
    
    sleep 4 if dice = 8
  end
end

live_loop :bass do
  use_synth :rodeo
  #play choose(chord(:db2, :minor)), release: 2, cutoff: rrand(40, 50), amp: rand, attack: 0.4
  sleep 2
  sleep 4 if dice = 8
end

live_loop :plck do
  with_fx :echo, mix: 0.5, phase: 2,decay: 2 do
    
    use_synth :pluck
    
    # play choose(chord(:eb4, :minor)), attack: 0.4, amp: rand
    play choose(chord(:eb3,  'm+5')), attack_level: 0.3, attack: 1, amp: rand if dice = 5
    sleep 0.25
    # play choose(chord(:eb5, :minor)), release: 1, amp: rrand_i(0.2, 0.8)
    
    sleep 1 if dice =4
    #  play choose(chord(:eb6, :minor)), release: 1, attack: 1.5, amp: rand if dice = 200
    
  end
end
live_loop :pno do
  with_fx :gverb, damp: 0.3, mix: 0.4 ,pre_amp: 1 do
    use_synth :piano
    #play choose(chord(:eb6, :m7)), attack: 0.2, sustain: rand, amp: 0.5
    sleep 0.3
    sleep 1 if dice 2
    sleep 0.5 if dice = 4
    # play choose(chord(:eb4, :m7)) , attack: 0.3, decay: rand, sustain: rand, amp: 0.3
    sleep 0.25
    sleep 0.5 if dice = 4
    play chord(:eb5, :m7).pick(3), attack: 0.9 ,release: 0.4, amp: 0.4 if dice = 5
  end
end


live_loop :flt do
  
  use_synth :mod_sine
  
  play choose(chord(:eb3, :minor)), attack: 5 ,  cutoff: 80, amp: 0.2
  # play choose(chord(:eb3,  'm+5')), attack: 2, amp: 0.5 if dice = 5
  sleep 8
  play choose(chord(:eb2, :minor)), attack: 4 , release: 3, cutoff: 80, amp: 0.1
  
  sleep 12 if dice =4
  # play choose(chord(:eb3, :minor)), release: 2, attack: 1.5, amp: 0.3 if dice = 200
  
end