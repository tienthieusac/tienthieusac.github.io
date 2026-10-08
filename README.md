# Tiên Thiếu Sắc

Tiên Thiếu Sắc no longer hosts its stories, out of respect for copyright and
Vietnam's laws and policies. This repository now serves a single page that points
readers to [fb.com/tienthieusac99](https://fb.com/tienthieusac99); every other path
redirects to it.

The page is plain HTML in [`site/`](site/), published without a build step to:

| Host | URL | Deployed by |
| --- | --- | --- |
| GitHub Pages | https://tienthieusac.github.io/ | [`pages.yml`](.github/workflows/pages.yml) |
| Firebase Hosting | https://tienthieusac.web.app/ | [`firebase.yml`](.github/workflows/firebase.yml) |
| Netlify | https://tienthieusac.netlify.app/ | [`netlify.toml`](netlify.toml) |
| Vercel | https://tienthieusac.vercel.app/ | [`vercel.json`](vercel.json) (Vercel Git integration) |
| Cloudflare Pages | https://tienthieusac.pages.dev/ | Cloudflare Git integration (output directory `site`) |
| GitLab Pages | https://tienthieusac.gitlab.io/ | [`.gitlab-ci.yml`](.gitlab-ci.yml) on the [mirrored copy](.github/workflows/mirror.yml) |

Every host serves [`site/404.html`](site/404.html) for unknown paths, and that page
sends the browser to the homepage.

## License

This work is licensed under a
[Creative Commons Attribution 4.0 International License](http://creativecommons.org/licenses/by/4.0/).
