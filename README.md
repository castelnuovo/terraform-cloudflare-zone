<p align="center">
  <img src="https://assets.castelnuovo.dev/logo.svg" width="100" />
</p>

<h1 align="center">
  castelnuovo/terraform-cloudflare-zone
</h1>

### Usage

```terraform
module "castelnuovo_dev" {
  source  = "castelnuovo/zone/cloudflare"
  version = "~> 0.1.0"

  account_id = "XXXXXXX"
  domain     = "domain.tld"

  apple = {
    verification = "apple-domain=XXXXXXXX"
    dkim_value   = "sig1.dkim.domain.tld.at.icloudmailadmin.com"
    dmarc_email  = "mailto:XXXXXXXX@dmarc-reports.cloudflare.net"
  }
}
```
