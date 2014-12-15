require 'rake'
require 'rake/file_utils_ext'

class SnapProvision::Provider::Update < Clamp::Command

  SnapProvision::CLI.subcommand           'update',      'Update snap provision',     self

  include SnapProvision::CLI::DefaultOptions
  include SnapProvision::Helpers
  include Rake::FileUtilsExt

  option '--revision',
    'REVISION',
    "Update to specified revision",
    :default => 'release'

  def execute
    cd(File.dirname(__FILE__), :verbose => !!verbose?) do
      sh("sudo git fetch --all",  :verbose => !!verbose?)
      sh("sudo git merge --ff-only #{revision}", :verbose => !!verbose?)
      sh("cd \"$(git rev-parse --show-toplevel)\" && sudo ./install.sh")
    end
  end

end
