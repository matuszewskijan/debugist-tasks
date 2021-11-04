require "./task.rb"

describe "Two plus Two" do
  it "equals to 4" do
    expect(calc(2, 2)).to eq 4
  end

  it "not equals to 4" do
    expect(calc(3, 2)).not_to eq 4
  end
end
