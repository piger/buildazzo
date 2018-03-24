class PostfixExporter < FPM::Cookery::Recipe
  homepage 'https://github.com/kumina/postfix_exporter'
  source 'https://github.com/kumina/postfix_exporter/archive/master.zip'

  name 'postfix-exporter'
  version '0.1.0'
  revision '1'

  description 'A Prometheus exporter for Postfix'
  maintainer 'Daniel Kertesz <daniel@spatof.org>'
  config_files '/etc/default/postfix-exporter'

  def build
    sh './build_static.sh'
  end

  def install
    bin.install 'postfix_exporter'
    etc('default').install workdir('postfix-exporter.default'), 'postfix-exporter'
    root('lib/systemd/system').install workdir('postfix-exporter.service')
  end
end
