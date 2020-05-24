# LyX + XeLaTeX で日本語文書作成する私的テンプレート
LyX 2.3.4 で動作させる前提.

Ubuntu 18.04, Mac OS で動作確認

`bxjsarticle`, `beamer` 用のテンプレート.

* ZXjatype に依存
http://zrbabbler.sp.land.to/zxjatype.html
* コンパイルには `-shell-escape` が必要

# 使い方
Linux 系なら
```
/usr/share/lyx/templates
```
Mac なら
```
~/Library/Application Support/Lyx-<VERSION>/templates
```
に .lyx を配置する.

# トラブルシューティング
Macでタイプセット時にたまにgraphicx関連でエラーが出る. MacではなぜかグラフィックドライバがXeTeXに設定されてしまい, これが原因でエラーが発生する. 新規作成の都度, 文書のグラフィックドライバが「既定値」になっているか確認が必要らしい?
