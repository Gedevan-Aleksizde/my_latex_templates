# なにこれ

* R Markdown で 日本語Beamerスライドを作るためにフォーマットを梱包したパッケージです
* 名称は (Xe)LaTeX の `zxjatype` パッケージから取っていますが, 同パッケージ開発者の八登崇之氏は一切関知していません

# 使い方

インストールする

```
remotes::install_github('Gedevan-Aleksizde/my_latex_templates', subdir = 'rmdzxja')
```

# サンプル
`examples/` 以下にサンプルが存在


* `beamer_linux.Rmd` (linuxというよりubuntu)
* `beamer_macos.Rmd`
* `beamer_windows.Rmd`

各OSでよく使われるフォントを指定している以外は上記は全て同じです. 適当なディレクトリに上記いずれかと `examples.bib` をコピーしてknitしてみてください.

**NOTE**: 用例の一環として, knit時に同一フォルダに `tab.tex` というファイルが生成されます. 上書きに注意してください.

# 謝辞

* 以下に触発されて作りました
* https://atusy.github.io/tokyor85-original-rmd-format
* https://github.com/atusy/tokyor85down
