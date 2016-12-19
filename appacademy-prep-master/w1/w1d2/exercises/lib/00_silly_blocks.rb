def reverser(&block)
	reverse = Proc.new {|i| i.reverse}
  words = yield.split(" ").map(&reverse).join(" ")
end

def adder(num=1, &prc)
  prc.call + num
end

def repeater(times=1, &prc)
  times.times do
    prc.call
  end
end
