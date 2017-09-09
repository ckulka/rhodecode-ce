# RhodeCode Community Edition

[![](https://images.microbadger.com/badges/version/ckulka/rhodecode-ce.svg)](https://github.com/ckulka/rhodecode-ce "Get your own version badge on microbadger.com")

This image is the same as ckulka/rhodecode-rccontrol, with the exception that a
RhodeCode Community Edition is installed and ready-to-use.

`docker run -it -p 5000:5000 ckulka/rhodecode-ce`

For more details, see <https://github.com/ckulka/rhodecode-ce>.

## Supported Tags

I follow the same naming scheme for the images as [RhodeCode](https://docs.rhodecode.com/RhodeCode-Enterprise/release-notes/release-notes.html) themselves

- [latest](https://github.com/ckulka/rhodecode-ce/tree/master) (corresponds to 4.9.0)

## Complete Stack

The following `docker-compose.yaml` file spins up a complete RhodeCode stack

```yaml
version: "3"

services:
  vcsserver:
    image: ckulka/rhodecode-vcsserver

  db:
    image: postgres:alpine
    environment:
      POSTGRES_PASSWORD: cookiemonster

  rhodecode:
    image: ckulka/rhodecode-ce
    environment:
      RC_USER: admin
      RC_PASSWORD: ilovecookies
      RC_EMAIL: adalovelace@example.com
      RC_DB: postgresql://postgres:cookiemonster@db
      RC_CONFIG: |
        [app:main]
        vcs.server = vcsserver:9900
    ports:
      - "5000:5000"
    links:
      - db
      - vcsserver
```
