# yoloswag.rb
require 'csv'
names = Array.new
scores = Array.new
colors = Array.new


def modeMax(mode)
	values = Array.new
  	hash = Hash.new(0)
  	modeMax = Array.new

  mode.each do |i|
  	hash[i] +=1
  end

  hash.each do |i, j|
  	values << j
  end
  values.each do |i|
  	modeMax << hash.key(values.max)
  	hash.delete(hash.key(values.max))
  end
  modeMax.delete_if(&:nil?)
  return modeMax
end

def modeMin(mode)
	values = Array.new
  	hash = Hash.new(0)
  	modeMin = Array.new
  mode.each do |i|
  	hash[i] +=1
  end

  hash.each do |i, j|
  	values << j
  end
  values.each do |i|
  	modeMin << hash.key(values.min)
  	hash.delete(hash.key(values.min))
  end
  modeMin.delete_if(&:nil?)
  return  modeMin
end

def capUnCap(names)
	i=0
	combination= Array.new
	names.length.times do
		combination[i]=""
		j=0
		words = names[i].split(/\W+/)
		words[0] = (words[0].reverse.capitalize).reverse
		words[words.length-1] = (words[words.length-1].reverse.capitalize).reverse
		
		words.length.times do
			combination[i] = combination[i]+words[j]+" "
			j+=1
		end
		i+=1
	end
	return combination
end



totalscore = 0
CSV.foreach("lib/data.csv", converters: :numeric) do |row|
  names << row[0]
  scores << row[1]
  colors << row[2]
end

names.delete_at(0)
scores.delete_at(0)
colors.delete_at(0)

i=0
until i==scores.length
	totalscore = totalscore+scores[i]
	i+=1
end
mean = (totalscore/scores.length)




puts "The Student with the highest score is "+ names[scores.index(scores.max)]
puts "\n"+ "The Student with the lowest score is "+ names[scores.index(scores.min)]
puts "\n"+ "The mean of all student's score is " + mean.to_s 
puts "\n"+ "The most popular color among the students is/are:" 
puts modeMax(colors)
puts "\n"+ "The least popular color among the students is/are:" 
puts modeMin(colors) 
puts "\n"+ "The capitalized last letter of first name and last name, \nlowercased first letter of the first name and last name is:"
puts ""
puts capUnCap(names)