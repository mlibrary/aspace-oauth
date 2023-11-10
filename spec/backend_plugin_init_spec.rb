require "date"

require "json"  # Makes to_json work as expected
require "active_support/all"  # Introduces breaking behavior

require_relative "../backend/plugin_init.rb"

RSpec.describe do
  context "with plugin initialized in backend" do
    it "serializes class references in hashes to string names" do
      test_hash = {test_date: Date}
      expect(test_hash.to_json).to eq('{"test_date":"Date"}')
    end

    # Simulating what Rails 5 does
    Encoding.default_internal = 'UTF-8'

    # Force re-load after re-setting
    load("./backend/plugin_init.rb")

    it "resets the default internal encoding from UTF-8 to nil" do
      expect(Encoding.default_internal).to eq(nil)
    end
  end
end
