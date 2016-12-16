

# Search query for postings in a group by optional keywords
class Food_RanksRepresenter
  def self.call(results)
    output = '['
    results.each {|a|
      output = output + {food_id: a.food_id, name: a.name, tag_amount: a.tag_amount, rank: a.rank}.to_s + ','}
    output.chop!
    output = output + ']'
  end
end
