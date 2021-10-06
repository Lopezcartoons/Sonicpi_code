use_bpm 114
#remix = "sprbth0.04.wav path"
sprbth = "/Loopop_Superbooth_2021_Sample_Pack/**"




thanks for watching!!!!
in_thread do
  loop do
    #cue [:first,:second,:third].choose
    #cue [:first,:second,:third,:fourth,:fifth,:sixth].choose
    sleep 1
    sleep 8 if dice = 8
  end
end
#sample remix

live_loop :Buchla do
  sync :first
  sample sprbth, "mic", rrand_i(1,16)
  sleep 0.5
  sample sprbth, "mic", rrand_i(1,16), hpf_attack: 32
  sleep 0.5
  sample sprbth, "mic", rrand_i(1,16)
  sleep 0.5
  
end


live_loop :dorf do
  sync :second
  sample sprbth, "lp", rrand_i(1,15), attack: 0.5, cutoff: 50
  sleep 4
  sleep 16 if dice = 16
end

live_loop :gfther do
  sync :third
  sample sprbth, "godfather", rrand_i(1,20), finish: 0.2
  sleep 1
  sleep 16 if dice = 16
end

live_loop :doep do
  sync :fourth
  sample sprbth, "a126", rrand_i(1,16), attack: 2
  sleep 5
  sleep 16 if dice = 16
end