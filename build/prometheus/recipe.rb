class Prometheus < FPM::Cookery::Recipe
  homepage 'https://prometheus.io/'
  source 'https://github.com/prometheus/prometheus/releases/download/v2.5.0/prometheus-2.5.0.linux-amd64.tar.gz'
  sha256 '6f1203c3ec540346bb346641eb43a74fde2992cda23b6c9e0f876f95a646cda1'

  name 'prometheus'
  version '2.5.0'
  revision '1'

  description 'The Prometheus monitoring system and time series database.'
  maintainer 'Daniel Kertesz <daniel@spatof.org>'
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
