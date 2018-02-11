class BlackboxExporter < FPM::Cookery::Recipe
  homepage 'https://prometheus.io/'
  source 'https://github.com/prometheus/blackbox_exporter/releases/download/v0.11.0/blackbox_exporter-0.11.0.linux-amd64.tar.gz'
  sha256 '6731efeb27d667ff5da362cc1afbb0a983d016697d906bb4b9c5503699efcbb7'

  name 'blackbox-exporter'
  version '0.11.0'
  revision '1'

  pre_uninstall 'pre-uninstall'
  post_install 'post-install'

  description 'Blackbox probe exporter for Prometheus.'
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
