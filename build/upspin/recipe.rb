class Upspin < FPM::Cookery::Recipe
  homepage 'https://upspin.io/'
  source 'https://upspin.io/dl/upspin.linux_amd64.tar.gz'
  sha256 '6822cfff3c3f5da14c27775f4db06374df320a02d8dbc6b00d881a8aca37b0ea'

  name 'upspin'
  version '0.1.1'
  revision '1'

  description 'Upsping reference implementation'

  def build
  end

  def install
    bin.install %w[cacheserver upspin upspin-audit upspinfs upspin-ui]
  end
end
