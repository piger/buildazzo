class Alertmanager < FPM::Cookery::Recipe
  homepage 'https://prometheus.io/'
  source 'https://github.com/prometheus/alertmanager/releases/download/v0.15.3/alertmanager-0.15.3.linux-amd64.tar.gz'
  sha256 'b43fd8aba978f19375e37fb7924bcdc7dd45659b1b0f87a2815860001f100f46'

  name 'alertmanager'
  version '0.15.3'
  revision '1'

  description 'Prometheus Alertmanager'
  maintainer 'Daniel Kertesz <daniel@spatof.org>'
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
