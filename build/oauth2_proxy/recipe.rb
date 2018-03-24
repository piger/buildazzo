class Oauth2Proxy < FPM::Cookery::Recipe
  homepage 'https://github.com/bitly/oauth2_proxy'
  source 'https://github.com/bitly/oauth2_proxy/releases/download/v2.2/oauth2_proxy-2.2.0.linux-amd64.go1.8.1.tar.gz'
  sha256 '1c16698ed0c85aa47aeb80e608f723835d9d1a8b98bd9ae36a514826b3acce56'

  name 'oauth2-proxy'
  version '2.2.0'
  revision '2'

  description 'A reverse proxy that provides authentication with Google, Github or other provider.'
  maintainer 'Daniel Kertesz <daniel@spatof.org>'
  config_files '/etc/oauth2-proxy.cfg'

  pre_install 'pre-install'
  post_install 'post-install'
  pre_uninstall 'pre-uninstall'
  post_uninstall 'post-uninstall'

  def build
  end

  def install
    bin.install 'oauth2_proxy'
    etc.install workdir('oauth2-proxy.cfg')
    root('lib/systemd/system').install workdir('oauth2-proxy.service')
  end
end
