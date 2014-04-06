# test 1 
# should be a function

# test 2
# should be passed a single array

# test 3
# should return 2d array with group members inside.



require_relative "u2_w4_c1_groups"

describe 'create_groups' do
	let!(:fence_lizards) { ["Adam Dziuk", "Adam Ryssdal", "Aki Suzuki", "Allison Wong", "Andra Lally", "Anup Pradhan", "CJ Jameson", "Christopher Aubuchon", "Clark Hinchcliff", "Devin A Johnson", "Dominick Oddo", "Dong Kevin Kang", "Eiko Seino", "Eoin McMillan", "Hunter T Chapman", "Jacob Persing", "Jon Pabico", "Parjam Davoody", "Samuel Davis", "Sebastian Belmar", "Shawn Seibert", "William Butler Bushyhead", "Yuzu Saijo", "Christiane Kammerl"] }
	it "is defined" do
		defined?(create_groups).should eq "method"
	end

	it "requires a single argument" do
		method(:create_groups).arity.should eq 1
	end

	it "returns the correct 2D array" do
		create_groups(fence_lizards).should eq [["Sebastian Belmar", "Eiko Seino", "Eoin McMillan", "Aki Suzuki"], ["William Butler Bushyhead", "Jacob Persing", "Jon Pabico", "Shawn Seibert"], ["Christiane Kammerl", "Dominick Oddo", "Anup Pradhan", "Adam Ryssdal"], ["Parjam Davoody", "Samuel Davis", "Hunter T Chapman", "Andra Lally"], ["Yuzu Saijo", "Allison Wong", "CJ Jameson", "Christopher Aubuchon"], ["Clark Hinchcliff", "Dong Kevin Kang", "Adam Dziuk", "Devin A Johnson"]]
	end

end
