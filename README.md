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
  version = "~> 0.1.1"

  account_id = "XXXXXXX"
  domain     = "domain.tld"

  apple = {
    verification = "apple-domain=XXXXXXXX"
    dkim_value   = "sig1.dkim.domain.tld.at.icloudmailadmin.com"
    dmarc_email  = "mailto:XXXXXXXX@dmarc-reports.cloudflare.net"
  }
}
```

## Changelog

Please see [CHANGELOG](CHANGELOG.md) for more information on what has changed recently.

## Contributing

Please see [CONTRIBUTING](CONTRIBUTING.md) for details.

## Security Vulnerabilities

Please review [our security policy](../../security/policy) on how to report security vulnerabilities.

## Credits

- [Luca Castelnuovo](https://github.com/lucacastelnuovo)
- [All Contributors](../../contributors)

## License

The Apache License. Please see [License File](LICENSE.md) for more information.
