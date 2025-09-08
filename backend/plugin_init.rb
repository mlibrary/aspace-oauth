# Patch ActiveSupport to_json implementation so it uses the json gem version of the method
# that is expected by the Sinatra backend. This patch counteracts the effect of ActiveSupport
# which was introduced by multiple gems needed by this plugin.

# If you do not have this patch, at least one endpoint in the backend (/reports) will have changed output
# that will break a template in the frontend.
# To reproduce the issue, when logged in with a user with repository access,
# visit http://localhost:8080/jobs/new?job_type=report_job

# Resources
# - https://stackoverflow.com/questions/683989/how-do-you-deal-with-the-conflict-between-activesupportjson-and-the-json-gem
# - https://github.com/rails/rails/blob/v5.2.8/activesupport/lib/active_support/core_ext/object/json.rb

module ActiveSupport
  module ToJsonWithActiveSupportEncoder
    def to_json(options = nil)
      super(options)
    end
  end
end

# Correct default internal encoding to ensure PDF generation works as expected.
# This is necessary because Rails (which is needed by the plugin) changes the default internal
# encoding to UTF-8, which causes an UndefinedConversionError when writing PDFs.
# Setting it to nil restores the setting to the state it was in before the plugin is loaded.

# Resources
# - https://github.com/rails/rails/blob/8030cff808657faa44828de001cd3b80364597de/railties/lib/rails.rb#L20-L24
# - https://ruby-doc.org/2.7.8/Encoding.html#method-c-default_internal

Encoding.default_internal = nil
