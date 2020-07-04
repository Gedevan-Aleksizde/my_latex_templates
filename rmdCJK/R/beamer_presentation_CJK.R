#' XeLaTeX + beamer + XeCJK 
#'
#' @inheritParams rmarkdown::beamer_presentation
#' @title R Markdown 上で XeLaTeX を使い日本語 beamer スライドを作成するフォーマット
#' @description  rmarkdownで \LaTeX を使う場合, 日本語を適切に表示するためにいろいろ必要だった調整を済ませたフォーマット
#' 基本的なオプションだけに限定することで簡単にポンチ絵スライドになってしまうことを回避する画期的な機能もあります
#' 
#' @param keep_tex logical. 出力時に .tex ファイルを残すかどうか. 経験的にknit時エラーのほとんどは生成された.texファイルに問題があるためデバッグ用に **TRUEを推奨する**. デフォルト: TRUE
#' @param keep_md logical. 出力時に .md ファイルを残すかどうか. デフォルト: FALSE
#' @param theme chracter. beamer テーマ. デフォルトは "default"
#' @param toc logical. 目次をスライド冒頭に出力するかどうか. デフォルト: TRUE
#' @param fig_width numeric. 画像保存時の幅. 単位インチ. デフォルトはbeamerのデフォルト幅と同じ 5.03937
#' @param fig_height numeric. 画像保存時の高さ. 単位インチ. デフォルトはbeamerのデフォルト高と同じ 3.77953
#' @param fig_caption logical. 画像キャプションの有無. デフォルト: TRUE
#' @param df_print character. チャンク出力のデータフレーム表示方法. 詳細は `rmarkdown::beamer_presentation` 参照. デフォルト: default
#' @param theme_options character. テーマオプション. デフォルトはフレームタイトルの下にプログレスバーをつけて, ブロックの背景色を描画するというもの
#' @param fonttheme character. フォントテーマ. デフォルトでは数式にローマン体を使う. デフォルト: "professional"
#' @param colortheme character. 色テーマ. デフォルト: "default"
#' @param innertheme character.  `colortheme` に同じ
#' @param outertheme character. `outertheme` に同じ
#' @param fontsize character. beamer の規定フォントサイズ. デフォルト: "11pt"
#' @param fig_width numeric. 画像保存時の幅. 単位インチ. デフォルトはbeamerのデフォルト幅と同じ. デフォルト: 5.03937
#' @param fig_height numeric. `fig_width` 参照. デフォルト: 3.77953
#' @param out.width character. 画像を貼り付ける際のサイズ. チャンクごとに指定することも可能. デフォルト: "100%"
#' @param out.heigt character. `out.height` 参照. デフォルト: "100%"
#' @param fig_crop logical. pdfcrop を使ってpdf画像の余白を削るかどうか. デフォルト: TRUE
#' @param fig_caption logical. 画像にキャプションを付けるか否か. デフォルト: TRUE
#' @param highlight character. シンタックスハイライトのデザイン. `rmarkdown::beamer_presentation` 参照. デフォルト: default
#' @param citation_package character.  本文中の引用トークンに関するパッケージ. デフォルト: natbib
#' @param citation_options character. `citation_package` のオプション. デフォルトの natbib+numbersでは "[1]" のような引用トークンが生成される. デフォルト: numbers.
#' @param figurename character. 図X の「図」の部分のテキスト. デフォルト: "図"
#' @param tablename character. 表Y の「表」の部分のテキスト. デフォルト: "表"
#' @param slide_level integer. フレームタイトルに対応する markdown の節レベル. デフォルト: 2. つまり `#` はセクションタイトルで, `##` がフレームタイトルになる
#' @param number_sections logical. セクション番号を付けるかどうか. デフォルト: FALSE
#' @param incremental logical. 箇条書きが順番に現れるやつ. 文字が回転するアニメーション機能はない. デフォルト: FALSE『...遠慮のないマッポ関係者が失笑した。ナムサン！プレゼンテーションにおける典型的なセンスレス文字操作だ。』--- B. ボンド& F. モーゼズ
#' @param self_contained logical. (TRUE) LaTeX のプリアンブルも生成する, (FALSE)本文のみ生成する. デフォルト: TRUE
#' @param includes named list. プリアンブルに追加する記述. 詳細は `rmarkdown::includes` 参照. デフォルト: NULL
#' @param template character. ユーザー定義のpandocテンプレートを使いたい場合はパスを指定する. デフォルト: default
#' @param latex_engine character. LaTeXエンジンの指定. デフォルト以外の値にすることは**非推奨**. デフォルト: xelatex
#' @param dev character. グラフィックデバイス. 日本語を使う限りデフォルト値から変更する意義はほぼない. デフォルト: cairo_pdf
#' @param pandoc_args. named list. pandoc に渡す引数. yamlヘッダのトップレベルに概ね対応する. 詳細は `rmarkdown::pdf_document`, `rmarkdown::rmd_metadata` や pandoc の公式ドキュメント参照. デフォルト: NULL
#' @param md_extensions. named_list. pandoc 変換の際にmdに付けるオプション. 詳細は `rmarkdown::rmarkdown_format` 参照. デフォルト: NULL
#' @param opts_chunk named list. Rmdファイルのチャンク内で `knitr::opts_chunk$set(...)` で記入するものと同じ. 画像サイズなどチャンク出力の設定がbeamer向けになるようデフォルト値を変更している 主なデフォルト: list(message = FALSE, echo = FALSE, comment = NA, fig.align = "center")
#' @return rmarkdown_output_format

#' @export
beamer_presentation_CJK <- function(
  keep_tex = TRUE,
  keep_md = FALSE,
  toc = TRUE,
  theme = "default",
  theme_options = "progressbar=frametitle,block=fill",
  fonttheme = "professionalfonts",
  colortheme = "default",
  innertheme = "default",
  outertheme = "default",
  fontsize = "11pt",
  fig_width = 5.03937,
  fig_height = 3.77953,
  out.width = "100%",
  out.height = "100%",
  fig_crop = TRUE,
  fig_caption = TRUE,
  highlight = "default",
  citation_package = "natbib",
  citation_options = "numbers",
  figurename = "図",
  tablename = "表",
  number_sections = FALSE,
  slide_level = 2,
  incremental = FALSE,
  self_contained = TRUE,
  includes = NULL,
  latex_engine = "xelatex",
  dev = "cairo_pdf",
  template = "default",
  md_extensions = NULL,
  pandoc_args = NULL,
  opts_chunk = NULL
){
  # ----- check arguments class & value -----
  if(latex_engine != "xelatex"){
    warnings('latex_engine is not specified as "xelatex"')
  }
  
  # ----- reshape arguments -----
  fontsize <- as.integer(sub("[^0-9]+", "", rmarkdown::metadata$fontsize))
  print(fontsize)
  
  settings_subthemes <- list(
    fonttheme = list(theme = fonttheme),
    colortheme = list(theme = colortheme),
    innertheme = list(theme = innertheme),
    outertheme = list(theme = outertheme)
  )
  if(is.null(theme) || theme == "" || missing(theme)){
    theme <- "default"
  }
  if(is.null(theme_options) || missing(theme_options) || theme_options == ""){
    header_theme <- paste0("{",  theme, "}")
  } else {
    header_theme <- paste0("[", theme_options, "]{",  theme, "}")
  }
  header_theme <- paste0("\\usetheme", header_theme)
  # add sub themes
  for(thm in names(settings_subthemes)){
    if(is.null(settings_subthemes[[thm]]) || is.na(settings_subthemes[[thm]]) || settings_subthemes[[thm]] == ""){
      settings_subthemes[[thm]]$use <- paste0("\\use", thm, "{default}")
    } else {
      settings_subthemes[[thm]]$use <- paste0("\\use", thm, "{", settings_subthemes[[thm]]$theme, "}")
    }
  }

  header <- c(
    header_theme,
    "\\makeatletter",
    "\\setlength{\\metropolis@progressinheadfoot@linewidth}{2pt}",
    as.character(lapply(settings_subthemes, function(x) x$use)),
    "\\patchcmd{\\beamer@sectionintoc}{\\vskip1.5em}{\\vskip0.5em}{}{}",
    "\\makeatother",
    paste0("\\renewcommand{\\figurename}{", figurename, "}"),
    paste0("\\renewcommand{\\tablename}{", tablename, "}"),
    "\\usepackage{bxtexlogo}",
    "\\colorlet{shadecolor}{gray!20}",
    paste0("\\usepackage[", citation_options, "]{", citation_package, "}"),
    "\\ifdefined\\bibsection\\renewcommand{\\bibsection}{}\\fi",
    "\\ifdefined\\bibfont\\renewcommand*{\\bibfont}{\\footnotesize}\\fi",
    "\\usepackage{fmtcount}",
    "\\ifdefined\\theFancyVerbLine\\renewcommand{\\theFancyVerbLine}{\\small \\padzeroes[2]{\\decimal{FancyVerbLine}}}\\fi",
    "\\IfFileExists{bxcoloremoji.sty}{\\usepackage{bxcoloremoji}}{}",
    "\\usepackage{fontspec}"
  )
  header <- c(header, includes)
  header_file <- tempfile(fileext = ".tex")
  write(header, header_file)
  
  # ----- generate output format -----
  beamer_args <- list(
    toc = toc,
    slide_level = slide_level,
    number_sections = number_sections,
    incremental = incremental,
    fig_width = fig_width,
    fig_height = fig_height,
    fig_crop = fig_crop,
    fig_caption = fig_caption,
    dev = dev,
    theme = theme,
    colortheme = "default",
    fonttheme = "default",
    highlight = highlight,
    template = template,
    keep_tex = keep_tex,
    keep_md = keep_md,
    latex_engine = latex_engine,
    citation_package = citation_package,
    self_contained = self_contained,
    includes = list(in_header = header_file),
    md_extensions = NULL,
    pandoc_args = NULL
  )
  base <- do.call(rmarkdown::beamer_presentation, beamer_args)
  out <- rmarkdown::output_format(
    knitr = rmarkdown::knitr_options(
      opts_chunk = list(
        include = TRUE,
        eval = TRUE,
        echo = FALSE,
        message = FALSE,
        warning = TRUE,
        error = TRUE,
        comment = NA,
        tidy.opts = list(width.cutoff = 40),
        tidy = F,
        fig.align = "center",
        fig.show = 'hold',
        out.width = out.width,
        out.height = out.height,
        dev = dev,
        dev.args = list(pointsize = 12)
        ),
      ),
    pandoc = rmarkdown::pandoc_options(
      to = "beamer",
      from = rmarkdown::from_rmarkdown(fig_caption, md_extensions),
      args = pandoc_args,
      keep_tex = keep_tex,
      latex_engine = latex_engine
      ),
    pre_processor = NULL,
    intermediates_generator = NULL,
    clean_supporting = !keep_tex,
    keep_md = keep_md,
    base_format = base
    )
  if(!file.exists("./.latexmkrc")){
    file.copy(file.path(system.file("extdata", package = "rmdCJK"), "latexmk/.latexmkrc"), to = "./")
  }
  print(rmarkdown::metadata$fontsize)
  return(out)
}
