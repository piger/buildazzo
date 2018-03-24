class NodeExporter < FPM::Cookery::Recipe
  homepage 'https://github.com/prometheus/node_exporter'
  source 'https://github.com/prometheus/node_exporter/releases/download/v0.15.2/node_exporter-0.15.2.linux-amd64.tar.gz'
  sha256 '1ce667467e442d1f7fbfa7de29a8ffc3a7a0c84d24d7c695cc88b29e0752df37'

  name 'node-exporter'
  version '0.15.2'
  revision '2'

  description 'Exporter for machine metrics.'
  maintainer 'Daniel Kertesz <daniel@spatof.org>'
  config_files '/etc/default/node-exporter'

  pre_install 'pre-install'
  pre_uninstall 'pre-uninstall'
  post_install 'post-install'
  post_uninstall 'post-uninstall'

  def build
  end

  def install
    bin.install 'node_exporter', 'node-exporter'
    root('lib/systemd/system').install workdir('node-exporter.service')
    etc('default').install workdir('node-exporter.default'), 'node-exporter'
  end
end
