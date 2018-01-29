class Prometheus < FPM::Cookery::Recipe
  homepage 'https://prometheus.io/'
  source 'https://github.com/prometheus/prometheus/releases/download/v2.1.0/prometheus-2.1.0.linux-amd64.tar.gz'
  sha256 'f181f619c9a8e0750c1ac940eb00a0881cc50386d896f06f159e9a5b68db60a0'

  name 'prometheus'
  version '2.1.0'
  revision '1'

  description 'The Prometheus monitoring system and time series database.'
  config_files '/etc/prometheus/prometheus.yml'
  
  pre_install 'pre-install'
  pre_uninstall 'pre-uninstall'
  post_install 'post-install'
  post_uninstall 'post-uninstall'

  def build
  end

  def install
    bin.install %w[prometheus promtool]
    etc('prometheus').install 'prometheus.yml'
    share('prometheus').install Dir['console_libraries']
    share('prometheus').install Dir['consoles']
    root('lib/systemd/system').install workdir('prometheus.service')
    etc('default').install workdir('prometheus.default'), 'prometheus'
  end
end
