RSpec.describe "Rails" do
  it "loads the test environment" do
    expect(Rails.env).to eq("test")
  end
end
