def join_letters(code)
  new_code = code.chars.select { |c| c >= '0' && c <= '9' }.join
  new_code[0] + new_code[-1]
end
describe "Problem" do
  it "removes all letters from a string and adds the first and final number" do
    code = 'nqninenmvnpsz874'
    expect(join_letters(code).to_i).to eq(84)
  end
end

def solution(codes)
  new_code = codes.map { |code| code.chars.select { |c| c >= '0' && c <= '9' }.join }
  puts new_code
end

# describe "Solution" do
#   it "returns the sum of all numbers from an array" do
#     codes = [kjdnfg123, sjdknfa456, f7ds8kfjnsd9]
codes = [kjdnfg123, sjdknfa456, f7ds8kfjnsd9]
solution(codes)