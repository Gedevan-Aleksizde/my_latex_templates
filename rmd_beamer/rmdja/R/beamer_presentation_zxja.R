#' XeLaTeX + beamer + zxjatype 
#'
#' @inheritParams rmarkdown::beamer_presentation
#' 
#' @param incremental logical. 箇条書きが順番に現れるやつ. 『ナムサン！プレゼンテーションにおける典型的なセンスレス文字操作だ。』--- B. ボンド& F. モーゼズ
#' @param theme chracter. beamer テーマ. デフォルトは "metropolis"
#' @param fig_width numeric. 画像保存時の幅. 単位インチ. デフォルトはbeamerのデフォルト幅と同じ 5.03937
#' @param fig_height numeric. 画像保存時の高さ. 単位インチ. デフォルトはbeamerのデフォルト高と同じ 3.77953
#' @param fig_caption logical. 画像キャプションの有無. デフォルト: TRUE
#' @param theme_options character. テーマオプション. デフォルトはフレームタイトルの下にプログレスバーをつけて, ブロックの背景色を描画するというもの
#' @param fonttheme character. フォントテーマ. デフォルトでは数式にローマン体を使う. デフォルト: "professional"
#' @param colortheme character. 色テーマ. デフォルト: "default"
#' @param innertheme character.  _colortheme_ に同じ
#' @param outertheme character. _outertheme_ に同じ
#' @param keep_tex logical. 出力時に .tex ファイルを残すかどうか. デバッグのため TRUEを推奨する. デフォルト: TRUE
#' @param keep_md logical. 出力時に .md ファイルを残すかどうか. デフォルト: FALSE
#' @param fontsize character. beamer の規定フォントサイズ. デフォルト: "11pt"
#' @param mainfont character. セリフフォント名. デフォルト: "Roboto Slab"
#' @param sansfont character. _font\_serif_ に同じ. デフォルト: "Roboto"
#' @param monofont character. _font\_serif_ に同じ. デフォルト: "Ricty Diminished"
#' @param mainfont_ja character. 日本語用セリフフォント(明朝体). 詳しくは `ZxJatype` のドキュメント参照. デフォルト: Noto Serif CJK JP
#' @param sansfont_ja character. _font\_serif\_ja_ に同じ. デフォルト: Noto Sans CJK JP
#' @param mainfont_options character. セリフフォントのオプション. デフォルト: NULL
#' @param sansfont_options character. _font\_sans\_options_ に同じ.
#' @param monofont_options character. _font\_sans\_options_ に同じ.
#' @param figurename character. 図X の「図」の部分のテキスト. デフォルト: "図"
#' @param tablename character. 表Y の「表」の部分のテキスト. デフォルト: "表"
#' @return rmarkdown_output_format

#' @export
beamer_presentation_zxja <- function(
  incremental = FALSE,
  theme = "metropolis",
  fig_width = 5.03937,
  fig_height = 3.77953,
  fig_crop = TRUE,
  fig_caption = TRUE,
  theme_options = "progressbar=frametitle,block=fill",
  fonttheme = "professionalfonts",
  colortheme = "default",
  innertheme = "default",
  outertheme = "default",
  keep_tex = TRUE,
  keep_md = FALSE,
  fontsize = "11pt",
  mainfont = "Roboto Slab", mainfont_options = NULL,
  sansfont = "Roboto", sansfont_options = NULL,
  monofont = "Ricty Diminished", monofont_options = NULL,
  mainfont_ja = "Noto Serif CJK JP", mainfont_ja_options = NULL,
  sansfont_ja = "Noto Sans CJK JP", sansfont_ja_options = NULL,
  monofont_ja = "Ricty Diminished", monofont_ja_options = NULL,
  self_contained = TRUE,
  figurename = "図",
  tablename = "表",
  linkcolor = "blue",
  citecolor = "blue",
  urlcolor = "magenta",
  citation_package = "natbib",
  citation_options = "numbers"
){
  settings_fonts <- list(
    main = list(font = mainfont, option = mainfont_options),
    sans = list(font = sansfont, option = sansfont_options),
    mono = list(font = monofont, option = monofont_options),
    jamain = list(font = mainfont_ja, option = mainfont_ja_options),
    jasans = list(font = sansfont_ja, option = sansfont_ja_options),
    jamono = list(font = monofont_ja, option = monofont_ja_options)
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
  for(i in names(settings_subthemes)){
    if(is.null(settings_subthemes[[i]]) || is.na(settings_subthemes[[i]]) || settings_subthemes[[i]] == ""){
      settings_subthemes[[i]]$use <- paste0("\\use", i, "{default}")
    } else {
      settings_subthemes[[i]]$use <- paste0("\\use", i, "{", settings_subthemes[[i]]$theme, "}")
    }
  }
  # add options
  for(i in names(settings_fonts)){
    if(is.null(settings_fonts[[i]]$option) || is.na(settings_fonts[[i]]$option) || settings_fonts[[i]]$option == ""){
      settings_fonts[[i]]$set <- paste0("\\set", i, "font{", settings_fonts[[i]]$font, "}")
    } else {
      settings_fonts[[i]]$set <- paste0("\\set", i, "font[", settings_fonts[[i]]$option, "]{", settings_fonts[[i]]$font ,"}")
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
    "\\hypersetup {colorlinks=true,linkcolor=", linkcolor, ",citecolor=", citecolor, ",urlcolor=", urlcolor, "magenta}",
    paste0("\\renewcommand{\\figurename}{", figurename, "}"),
    paste0("\\renewcommand{\\tablename}{", tablename, "}"),
    "\\usepackage{bxtexlogo}",
    "\\colorlet{shadecolor}{gray!20}",
    "\\usepackage[", citation_options, "]{", citation_package, "}",
    "\\ifdefined\\bibsection\\renewcommand{\\bibsection}{}\\fi",
    "\\ifdefined\\bibfont\\renewcommand*{\\bibfont}{\\footnotesize}\\fi",
    "\\usepackage{fmtcount}",
    "\\ifdefined\\theFancyVerbLine\\renewcommand{\\theFancyVerbLine}{\\small \\padzeroes[2]{\\decimal{FancyVerbLine}}}\\fi",
    "\\IfFileExists{bxcoloremoji.sty}{\\usepackage{bxcoloremoji}}{}"
  )
  header_file <- tempfile(fileext = ".tex")
  write(header, header_file)
  args <- list(
    toc = F,
    slide_level = 2,
    number_sections = F,
    incremental = incremental,
    fig_width = fig_width,
    fig_height = fig_height,
    fig_crop = fig_crop,
    fig_caption = fig_caption,
    dev = "cairo_pdf",
    highlight = "default",
    template = "default",
    keep_tex = keep_tex,
    keep_md = keep_md,
    latex_engine = "xelatex",
    citation_package = "natbib",
    self_contained = self_contained,
    includes = list(in_header = header_file)
  )
  return(do.call(rmarkdown::beamer_presentation, args))
}
