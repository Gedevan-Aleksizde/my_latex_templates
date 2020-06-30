#' XeLaTeX + beamer + zxjatype 
#'
#' @inheritParams rmarkdown::beamer_presentation
#' @title R Markdown 上で XeLaTeX を使い日本語 beamer スライドを作成するフォーマット
#' @description  rmarkdownで \LaTeX を使う場合, 日本語を適切に表示するためにいろいろ必要だった調整を済ませたフォーマット
#' 基本的なオプションだけに限定することで簡単にポンチ絵スライドになってしまうことを回避する画期的な機能もあります
#' 
#' @param theme chracter. beamer テーマ. デフォルトは "metropolis"
#' @param fig_width numeric. 画像保存時の幅. 単位インチ. デフォルトはbeamerのデフォルト幅と同じ 5.03937
#' @param fig_height numeric. 画像保存時の高さ. 単位インチ. デフォルトはbeamerのデフォルト高と同じ 3.77953
#' @param fig_caption logical. 画像キャプションの有無. デフォルト: TRUE
#' @param theme_options character. テーマオプション. デフォルトはフレームタイトルの下にプログレスバーをつけて, ブロックの背景色を描画するというもの
#' @param fonttheme character. フォントテーマ. デフォルトでは数式にローマン体を使う. デフォルト: "professional"
#' @param colortheme character. 色テーマ. デフォルト: "default"
#' @param innertheme character.  `colortheme` に同じ
#' @param outertheme character. `outertheme` に同じ
#' @param fontsize character. beamer の規定フォントサイズ. デフォルト: "11pt"
#' @param mainfont character. セリフフォント名. デフォルト: "Roboto Slab"
#' @param sansfont character. `font_serif` に同じ. デフォルト: "Roboto"
#' @param monofont character. `font_serif` に同じ. デフォルト: "Ricty Diminished"
#' @param jamainfont character. 日本語用セリフフォント(明朝体). 詳しくは `ZxJatype` のドキュメント参照. デフォルト: "Noto Serif CJK JP"
#' @param jasansfont character. `jamainfont` に同じ. デフォルト: Noto Sans CJK JP
#' @param jamonofont character. `jamainfont` に同じ.
#' @param mainfont_options character. セリフフォントのオプション. デフォルト: NULL
#' @param sansfont_options character. `mainfont_options` に同じ.
#' @param monofont_options character. `mainfont_options` に同じ.
#' @param jamainfont_options character. 他のオプションと同じ.
#' @param jasansfont_options character. 他のオプションと同じ.
#' @param jamonofont_options character. 他のオプションと同じ.
#' @param fig_width numeric. 画像保存時の幅. 単位インチ. デフォルトはbeamerのデフォルト幅と同じ. デフォルト: 5.03937
#' @param fig_height numeric. `fig_width` 参照. デフォルト: 3.77953
#' @param out.width character. 画像を貼り付ける際のサイズ. チャンクごとに指定することも可能. デフォルト: "100%"
#' @param out.heigt character. `out.height` 参照. デフォルト: "100%"
#' @param linkcolor character. 相互参照リンクの色. デフォルト: blue
#' @param citecolor character. 参考文献リストへのリンクの色. デフォルト: blue
#' @param urlcolor character. URLリンクの色. デフォルト: magenta
#' @param fig_crop logical. pdfcrop を使ってpdf画像の余白を削るかどうか. デフォルト: TRUE
#' @param fig_caption logical. 画像にキャプションを付けるか否か. デフォルト: TRUE
#' @param highlight character. シンタックスハイライトのデザイン. `default`, `tango`, `pygments`, `kate`, `monochrome`, `espresso`, `zenburn`, `haddock`, `breezedark`, `textmate` から指定する.
#' @param citation_package character.  本文中の引用トークンに関するパッケージ. デフォルト: natbib
#' @param citation_options character. `citation_package` のオプション. デフォルトの natbib+numberでは "[1]" のような引用トークンが生成される. デフォルト: numbers.
#' @param figurename character. 図X の「図」の部分のテキスト. デフォルト: "図"
#' @param tablename character. 表Y の「表」の部分のテキスト. デフォルト: "表"
#' @param incremental logical. 箇条書きが順番に現れるやつ. 文字が回転するアニメーション機能はない. デフォルト: FALSE『...遠慮のないマッポ関係者が失笑した。ナムサン！プレゼンテーションにおける典型的なセンスレス文字操作だ。』--- B. ボンド& F. モーゼズ
#' @param keep_tex logical. 出力時に .tex ファイルを残すかどうか. デバッグのため TRUEを推奨する. デフォルト: TRUE
#' @param keep_md logical. 出力時に .md ファイルを残すかどうか. デフォルト: FALSE
#' @return rmarkdown_output_format

#' @export
beamer_presentation_zxja <- function(
  theme = "metropolis",
  theme_options = "progressbar=frametitle,block=fill",
  fonttheme = "professionalfonts",
  colortheme = "default",
  innertheme = "default",
  outertheme = "default",
  fontsize = "12pt",
  mainfont = "", mainfontoptions = NULL,
  sansfont = "", sansfontoptions = NULL,
  monofont = "", monofontoptions = NULL,
  jamainfont = "", jamainfontoptions = NULL,
  jasansfont = "", jasansfontoptions = NULL,
  jamonofont = "", jamonofontoptions = NULL,
  fig_width = 5.03937,
  fig_height = 3.77953,
  out.width = "100%",
  out.height = "100%",
  fig_crop = TRUE,
  fig_caption = TRUE,
  linkcolor = "blue",
  citecolor = "blue",
  urlcolor = "magenta",
  highlight = "default",
  citation_package = "natbib",
  citation_options = "numbers",
  figurename = "図",
  tablename = "表",
  incremental = FALSE,
  keep_tex = TRUE,
  keep_md = FALSE,
  self_contained = TRUE
){
  settings_fonts <- list(
    main = list(font = mainfont, option = mainfontoptions),
    sans = list(font = sansfont, option = sansfontoptions),
    mono = list(font = monofont, option = monofontoptions),
    jamain = list(font = jamainfont, option = jamainfontoptions),
    jasans = list(font = jasansfont, option = jasansfontoptions),
    jamono = list(font = jamonofont, option = jamonofontoptions)
  )
  settings_subthemes <- list(
    fonttheme = list(theme = fonttheme),
    colortheme = list(theme = colortheme),
    innertheme = list(theme = innertheme),
    outertheme = list(theme = outertheme)
  )
  if(is.null(theme) || theme == "" || is.na(theme)){
    theme <- "default"
  }
  if(is.null(theme_options) || is.na(theme_options) || theme_options == ""){
    header_theme <- paste0("{",  theme, "}")
  } else {
    header_theme <- paste0("[", theme_options, "]{",  theme, "}")
  }
  header_theme <- paste0("\\usetheme", header_theme)
  # add sub themes
  
  # add options
  for(i in names(settings_fonts)){
    if(is.null(settings_fonts[[i]]$option) || is.na(settings_fonts[[i]]$option) || settings_fonts[[i]]$option == ""){
      settings_fonts[[i]]$set <- paste0("\\set", i, "font{", settings_fonts[[i]]$font, "}")
    } else {
      settings_fonts[[i]]$set <- paste0("\\set", i, "font[", settings_fonts[[i]]$option, "]{", settings_fonts[[i]]$font ,"}")
    }
  }
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
    "\\usepackage{zxjatype}",
    as.character(lapply(settings_fonts, function(x) x$set)),
    "\\usepackage {hyperref}",
    paste0("\\hypersetup {colorlinks=true,linkcolor=", linkcolor, ",citecolor=", citecolor, ",urlcolor=", urlcolor, "}"),
    paste0("\\renewcommand{\\figurename}{", figurename, "}"),
    paste0("\\renewcommand{\\tablename}{", tablename, "}"),
    "\\usepackage{bxtexlogo}",
    "\\colorlet{shadecolor}{gray!20}",
    paste0("\\usepackage[", citation_options, "]{", citation_package, "}"),
    "\\ifdefined\\bibsection\\renewcommand{\\bibsection}{}\\fi",
    "\\ifdefined\\bibfont\\renewcommand*{\\bibfont}{\\footnotesize}\\fi",
    "\\usepackage{fmtcount}",
    "\\ifdefined\\theFancyVerbLine\\renewcommand{\\theFancyVerbLine}{\\small \\padzeroes[2]{\\decimal{FancyVerbLine}}}\\fi",
    "\\IfFileExists{bxcoloremoji.sty}{\\usepackage{bxcoloremoji}}{}"
  )
  header_file <- tempfile(fileext = ".tex")
  write(header, header_file)
  args <- list(
    theme = NULL,
    toc = F,
    slide_level = 2,
    number_sections = F,
    incremental = incremental,
    fig_width = fig_width,
    fig_height = fig_height,
    fig_crop = fig_crop,
    fig_caption = fig_caption,
    dev = "cairo_pdf",
    highlight = highlight,
    template = "default",
    keep_tex = keep_tex,
    keep_md = keep_md,
    latex_engine = "xelatex",
    self_contained = self_contained,
    citation_package = citation_package,
    includes = list(in_header = header_file)
  )
  base <- do.call(rmarkdown::beamer_presentation, args)
  out <- rmarkdown::output_format(
    knitr = rmarkdown::knitr_options(
      opts_chunk = list(
        include = T,
        echo = F,
        message = F,
        warning = F,
        comment = NA,
        tidy.opts=list(width.cutoff=40),
        tidy=F,
        fig.align = "center",
        fig.show='hold',
        out.width = out.width,
        dev.args = list(pointsize = as.integer(sub("[^0-9]+", "", fontsize)))
        ),
      ),
    pandoc = NULL,
    base_format = base)
  if(!file.exists("./.latexmkrc")){
    file.copy(file.path(system.file("extdata", package = "rmdzxja"), "latexmk/.latexmkrc"), to = "./")
  }
  return(out)
}
