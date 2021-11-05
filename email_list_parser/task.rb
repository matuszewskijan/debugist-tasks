require "csv"

class EmailListParser
  attr_accessor :file

  def initialize(filepath)
    @content = File.open(filepath).read
  end

  def process
    generate_csv(parse_employees)
  end

  def parse_employees
    @content.split("\r\n").map do |email|
      first_name, last_name = email.match(/(.*)-(.*)@/i)&.captures

      [first_name, last_name, email]
    end
  end

  def generate_csv(employees)
    CSV.open("results.csv", "w") do |csv|
      csv << ["first_name", "last_name", "email"]
      csv << employees.each { |line| csv << line }
    end
  end
end
