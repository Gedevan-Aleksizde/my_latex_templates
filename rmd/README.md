# なにこれ
* RMarkdown で日本語 Beamer スライドを作成するテンプレートです
* 基本的には伊東宏樹先生のスライドで紹介している話と同じことをしています

https://www.slideshare.net/hirokito/r-markdownbeamer-88777082

* 主な違いは以下です
1. LuaLaTeX ではなく XeLaTeX を使っている
2. 図表の表示, 絵文字の表示, 参考文献リストの表示など, 用例を充実

# 要件
* 最新のRおよびRStudio
* `rmarkdown`, `knitr` などの関連パッケージc
* TeXLive 2018 (MacTeX)
	+ `tinytex` でないことに注意してください
* Ubuntu 18.04 および OS X Mojave で動作確認

# 使い方
1. `.Rmd` ファイルを開く
2. `.Rmd` と同じディレクトリに `.latexmkrc`を置く
2. 自分のスライドを作る
3. knitする

# 謝辞
* 以下に触発されて作りました
* https://atusy.github.io/tokyor85-original-rmd-format
* https://github.com/atusy/tokyor85down