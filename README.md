# pvinis dotfiles, handled by chezmoi

- get password from "password" type
```
export HOMEBREW_GITHUB_API_TOKEN={{ (onepassword "jct5fvvcmjdutdb4vmpep3s3zq").details.password }}
```

- get password from "login type"
```
export HOMEBREW_GITHUB_API_TOKEN={{ range (onepassword "jct5fvvcmjdutdb4vmpep3s3zq").details.fields -}}
  {{ if eq .name "password" }}
    {{ .value }}
  {{ end }}
{{- end }}
```

## TODO
- add instructions on how to init a new machine
