require "./task.rb"
require "csv"

describe EmailListParser do
  let(:parser) { described_class.new("./support/email-list.txt") }

  before do
    File.delete("results.csv") if File.exist?("results.csv")
  end

  describe "#parse_employees" do
    it "return proper amount of employees" do
      expect(parser.parse_employees.size).to eq 10
    end
  end

  describe "#process" do
    it "generate expected results.csv file" do
      parser.process
      generated_csv = CSV.read("results.csv")
      expected_csv = CSV.read("support/results.csv")
      expect(generated_csv).to eq expected_csv
    end
  end
end
