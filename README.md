# LaTeX で日本語文書作成する私的テンプレート

## 内容物
* LyX 用テンプレート
  + 文書用
  + スライド用(beamer)
  + LyX 2.3.4 で動作させる前提.
  + Ubuntu 18.04, Mac OS で動作確認
* RMarkdwon用
  + beamer_presentation用テンプレート
  + Ubuntu 18.04 で開発中
  + たぶん OSXでも動く

## LyX 用テンプレート
`bxjsarticle`, `beamer` 用のテンプレート.

* ZXjatype に依存  
http://zrbabbler.sp.land.to/zxjatype.html
* コンパイルには `-shell-escape` が必要
* beamerのテーマデフォルトはmetropolis使用  
https://github.com/matze/mtheme

### 使い方
Linux 系なら
```
/usr/share/lyx/templates
```
Mac なら
```
~/Library/Application Support/Lyx-<VERSION>/templates
```
に .lyx を配置する.

### トラブルシューティング
Macでタイプセット時にたまにgraphicx関連でエラーが出る. MacではなぜかグラフィックドライバがXeTeXに設定されてしまい, これが原因でエラーが発生する. 新規作成の都度, 文書のグラフィックドライバが「既定値」になっているか確認が必要らしい?

## RMarkdown用テンプレート
  + `beamer_presentation`用テンプレート

### 要件
* TeXLive (`tinytex` **ではない**)
* RStudio  1.3.959
