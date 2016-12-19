#performance Monitor

def measure(n = 1, &prc)
  curr_time = Time.now
  n.times do
    prc.call
  end
  (Time.now - curr_time)/n
end
