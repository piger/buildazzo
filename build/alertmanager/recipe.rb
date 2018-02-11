class Alertmanager < FPM::Cookery::Recipe
  homepage 'https://prometheus.io/'
  source 'https://github.com/prometheus/alertmanager/releases/download/v0.13.0/alertmanager-0.13.0.linux-amd64.tar.gz'
  sha256 'fe79ef985c02f67e82684b8ac6a62a1c93a3c297d8b969a639af23548154772a'

  name 'alertmanager'
  version '0.13.0'
  revision '1'

  description 'Prometheus Alertmanager'
  config_files '/etc/alertmanager/alertmanager.yml'

  pre_install 'pre-install'
  pre_uninstall 'pre-uninstall'
  post_install 'post-install'
  post_uninstall 'post-uninstall'

  def build
  end

  def install
    bin.install %w[alertmanager amtool]
    etc('alertmanager').install 'simple.yml', 'alertmanager.yml'
    root('lib/systemd/system').install workdir('alertmanager.service')
    etc('default').install workdir('alertmanager.default'), 'alertmanager'
  end
end
