class BlackboxExporter < FPM::Cookery::Recipe
  homepage 'https://prometheus.io/'
  source 'https://github.com/prometheus/blackbox_exporter/releases/download/v0.12.0/blackbox_exporter-0.12.0.linux-amd64.tar.gz'
  sha256 'c5d8ba7d91101524fa7c3f5e17256d467d44d5e1d243e251fd795e0ab4a83605'

  name 'blackbox-exporter'
  version '0.12.0'
  revision '1'

  pre_uninstall 'pre-uninstall'
  post_install 'post-install'

  description 'Blackbox probe exporter for Prometheus.'
  maintainer 'Daniel Kertesz <daniel@spatof.org>'
  config_files '/etc/blackbox-exporter/blackbox-exporter.yml'

  def build
  end

  def install
    bin.install 'blackbox_exporter', 'blackbox-exporter'
    etc('blackbox-exporter').install 'blackbox.yml', 'blackbox-exporter.yml'
    root('lib/systemd/system').install workdir('blackbox-exporter.service')
    etc('default').install workdir('blackbox-exporter.default'), 'blackbox-exporter'    
  end
end
