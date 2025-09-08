# frozen_string_literal: true

ASpaceGems.setup if defined? ASpaceGems
source "https://rubygems.org"

# Seem to need Rails to be specified or there"s an uninitialzed constant error
gem "rails", "~> 6.1"
gem "omniauth", "~> 2.1"
gem "omniauth-rails_csrf_protection", "~> 1.0"
gem "omniauth_openid_connect", "~> 0.6.1"

# commenting out, backend is pinned to 2.8.1
# gem "addressable", "~> 2.8"

# Pinning this resolves undefined method `[]' for #<OpenSSL::ASN1::Sequence:0x4bb0df3c>
# trying to comment out or bump to 1.17.0
gem "json-jwt", "= 1.15.0"

group :test, optional: true do
  # ArchivesSpace has json installed in the backend:
  # https://github.com/archivesspace/archivesspace/blob/90195216bdf614e1335f869144fc485ae9e8c002/backend/Gemfile#L11
  gem "json"

  gem "rspec"
  gem "rspec-core"
end
