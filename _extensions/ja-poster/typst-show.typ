#show: doc => poster(
  //===============================================

  // ポスターバナー/ロゴ。
  $if(poster-banner)$ banner: "$poster-banner$", $endif$

  //===============================================
  // タイトル設定
  $if(title)$ title: [$title$], $endif$
  $if(subtitle)$ subtitle: [$subtitle$], $endif$

  //===============================================
  // 著者・所属設定
  $if(poster-authors)$ authors: [$poster-authors$], $endif$
  $if(departments)$ departments: [$departments$], $endif$

  //===============================================
  // ヘッダーの設定
  $if(header-font)$ header_font: "$header-font$", $endif$
  $if(paper)$ paper: "$paper$", $endif$
  $if(flipped)$ flipped: "$flipped$", $endif$

  //===============================================
  // フッターの設定
  // footer-left: 大会名など
  $if(footer-left)$ footer_left: [$footer-left$], $endif$

  // footer-center: 日付など
  $if(footer-center)$ footer_center: [$footer-center$], $endif$

  // footer-right: 著者のメールアドレスなど
  $if(footer-right)$ footer_right: [$footer-right$], $endif$

  //===============================================
  // 余白の設定
  $if(margin-top)$ margin_top: $margin-top$, $endif$
  $if(margin-left)$ margin_left: $margin-left$, $endif$
  $if(margin-right)$ margin_right: $margin-right$, $endif$
  $if(margin-bottom)$ margin_bottom: $margin-bottom$, $endif$

  //===============================================
  // ボディフォント設定
  $if(japanese-font)$ japanese_font: "$japanese-font$", $endif$
  $if(english-font)$ english_font: "$english-font$", $endif$
  $if(science-font)$ science_font: "$science-font$", $endif$
  $if(body-font-size)$ body_font_size: $body-font-size$, $endif$

  //===============================================
  // 引用文献の設定
  $if(bibliography-line-break)$ bibliography_line_break: $bibliography-line-break$, $endif$
  $if(bibliography-spacing-before)$ bibliography_spacing_before: $bibliography-spacing-before$, $endif$
  $if(bibliography-spacing-after)$ bibliography_spacing_after: $bibliography-spacing-after$, $endif$

  doc,
)
