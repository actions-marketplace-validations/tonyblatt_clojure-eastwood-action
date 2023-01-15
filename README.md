# clojure-lein-eastwood-action
A simple GitHub action which runs [lein eastwood](https://github.com/jonase/eastwood) and posts the results using [reviewdog](https://github.com/reviewdog/reviewdog).

## Inputs

### `github_token`

Optional.
`${{ github.token }}` is used by default.

### `level`

Optional.
Report level for reviewdog- must be one of `[info, warning, error]`.
It's same as `-level` flag of reviewdog.

### `reporter`

Reporter of reviewdog command.
Must be one of `[github-pr-check, github-pr-review, github-check]`.
Default is github-pr-check.
github-pr-review can use Markdown and add a link to rule page in reviewdog reports.

### `filter_mode`

Optional.
Filtering mode for the reviewdog command.
Must be one of `[added, diff_context, file, nofilter]`.
Default is added.

### `fail_on_error`

Optional.
Sets and exceptional exit code for reviewdog when errors are found.
Must be one of `[true, false]`.
Default is `false`.

### `reviewdog_flags`

Optional.
Additional reviewdog flags.

### `eastwood_flags`

Optional.
Additional Flags for eastwood.
Default: `''`

## Example usage

### [.github/workflows/reviewdog.yml](.github/workflows/reviewdog.yml)

To receive automatic Pull Request comments with eastwood results which fails on error:

```yml
name: Eastwood
on: [pull_request]
jobs:
  clj-eastwood:
    name: runner / clj-eastwood
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3.0.2
      - name: clj-eastwood
        uses: tonyblatt/clojure-eastwood-action@v1
        with:
          github_token: ${{ secrets.github_token }}
          reporter: github-pr-review
          fail_on_error: true
```

#### Special Thanks

Special Thanks to [Nick Nichols](https://nnichols.github.io/) whose [code](https://github.com/nnichols/clojure-lint-action) was heavily leveraged to create this linter.

## Licensing

Copyright © 2023 [Tony Blatt](https://github.com/tonyblatt)

Distributed under the [MIT License](https://github.com/tonyblatt/clojure-eastwood-action/blob/main/LICENSE)
