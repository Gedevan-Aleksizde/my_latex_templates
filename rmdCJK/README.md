# なにこれ

* R Markdown で 日本語Beamerスライドを作るためにフォーマットを梱包したパッケージです
* ~~名称は (Xe)LaTeX の `zxjatype` パッケージから取っていますが, 同パッケージ開発者の八登崇之氏は一切関知していません~~
* 一旦 `zxjatype` ではなく `XeCJK` で和文フォントを埋め込むようにしました
  + スライドでは`zxjatype`を使えないことによる大きな影響はないですが, そのうち`zxjatype`で表示するようにしたいです

# 使い方

1. 最新のTeXLive(2020)をインストールする(tinytexでは不十分です)
  + Mac OS なら MacTeX, Ubuntu なら[公式](https://www.tug.org/texlive/acquire-netinstall.html)から落としてください
    - Ubuntu は `apt` を使わずインストールしたほうが良いです
  + [TeX wiki](https://texwiki.texjp.org/?TeX%20Live)などを参考にしてください
2. このパッケージをインストールする

```
remotes::install_github('Gedevan-Aleksizde/my_latex_templates', subdir = 'rmdzCJK')
```

3. `output::rmdCJK::beamer_presentation_CJK` でフォーマット指定
  + フォントを手動で指定する必要があります


# サンプル
`examples/` 以下にサンプルが存在


* `beamer_linux.Rmd` (linuxというよりubuntu)
* `beamer_macos.Rmd`
* `beamer_windows.Rmd`

各OSでよく使われるフォントを指定している以外は上記は全て同じです. 適当なディレクトリに上記いずれをコピーしてknitしてみてください.
コピーする際には

```
file.copy(file.path(system.file("examples", package = "rmdCKL"), "beamer_*.Rmd"), "HOGEHOGE")
```

でコピーすると楽です.

**NOTE**: 用例の一環として, knit時に同じフォルダに `tab.tex`, `examples.bib`, `.latexmkrc` というファイルが生成されます. 上書きに注意してください.

**NOTE**: `monofont`/`jamonofont`はソースコードの掲載に使われます. [M+](http://mix-mplus-ipa.osdn.jp/)や[Ricty](https://rictyfonts.github.io/)などのインストールを推奨します

# 謝辞

* 以下に触発されて作りました
* https://atusy.github.io/tokyor85-original-rmd-format
* https://github.com/atusy/tokyor85down
