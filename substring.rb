dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(string, dictionary)
  stringdowncase = string.downcase.gsub(/[^a-zA-Z\s.]/,'').strip
  stringnowarray = stringdowncase.split
  allsubstrings = []
  stringnowarray.map do |word|
    allsubstrings.push(dividestring(word))
  end
  results = allsubstrings.flatten.select do |word|
    dictionary.any? {|sub| word == sub}
  end
  finalresults = results.reduce (Hash.new(0)) do |s, n|
    s[n] += 1
    s
  end
  p finalresults
end

def dividestring(string)
  lastarray = []
  z = 0
  for i in 0..string.length - 1
    lastarray.push(string[i])
  end
  until z == string.length - 1
    for i in 1..string.length
      lastarray.push(string[z,i])
    end
    z += 1
  end
  return lastarray.uniq!
end

substrings("Howdy partner, sit down! How's it going?", dictionary)






## agarrar string, separarla en palabras y downcasearla
## cada palabra separarla en substring, ej: holas => h, o, l, a, s, ho, ol, la, as, hol, ola, las, hola, olas, holas
## holas => h ho hol hola holas o ol ola olas l la las a as s
## string.gsub!(/\W+/, '')