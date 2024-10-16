// Typstのカスタムフォーマットは通常、'typst-template.typ'（typstテンプレートのソースコード）と
// 'typst-show.typ'（テンプレートの関数を呼び出すファイル）で構成されます。
// 
// これは'typst-show.typ'ファイルの例です（Quartoに付属するデフォルトテンプレートに基づいています）。
// 'typst-template.typ'ファイルで定義された'poster'という名前のtypst関数を呼び出します。
// 
// カスタムtypstテンプレートを作成またはパッケージ化する場合、このファイルと
// 'typst-template.typ'を完全に置き換えることをお勧めします。
// typstテンプレートの作成に関するドキュメントはこちらで見つけることができます：
//   - https://typst.app/docs/tutorial/making-a-template/
//   - https://github.com/typst/templates

#show: doc => poster(
  // これはポートレイトで2カラムのポスターのデフォルト
  // 18インチ x 24インチのポスターでテスト済
  //===============================================
  // ポスターのカラム数。
  $if(num-columns)$ num_columns: $num-columns$, $endif$

  // ポスターバナー/ロゴ。
  $if(poster-banner)$ banner: "$poster-banner$", $endif$

  //===============================================

  // 余白の設定
  // 上の余白（インチ単位）。
  $if(margin-top)$ margin_top: $margin-top$, $endif$

  // 左の余白（インチ単位）。
  $if(margin-left)$ margin_left: $margin-left$, $endif$

  // 右の余白（インチ単位）。
  $if(margin-right)$ margin_right: $margin-right$, $endif$

  // 下の余白（インチ単位）。
  $if(margin-bottom)$ margin_bottom: $margin-bottom$, $endif$

  // ヘッダー情報の後のスペース（ポイント単位）。
  $if(space-after-header)$ space_after_header: $space-after-header$, $endif$

  //===============================================
  // タイトルの設定
  $if(title)$ title: [$title$], $endif$
  $if(title-font)$ title_font: "$title-font$", $endif$
  $if(title-font-size)$ title_font_size: $title-font-size$, $endif$
  $if(title-weight)$ title_weight: $title-weight$, $endif$

  // タイトルの左側のスペースとして使用されるカラムサイズ（インチ単位）。
  $if(left-title-column-size)$ left_title_column_size: $left-title-column-size$, $endif$

  // タイトルの右側のスペースとして使用されるカラムサイズ（インチ単位）。
  $if(right-title-column-size)$ right_title_column_size: $right-title-column-size$, $endif$

  // タイトルと著者のカラムサイズ（インチ単位）。
  $if(title-column-size)$ title_column_size: $title-column-size$, $endif$

  // タイトルと著者の行サイズ（インチ単位）。
  $if(title-row-size)$ title_row_size: $title-row-size$, $endif$

  //===============================================
  // ヘッダーの設定
  $if(header-font)$ header_font: "$header-font$", $endif$
  $if(poster-authors)$ authors: [$poster-authors$], $endif$
  $if(departments)$ departments: [$departments$], $endif$
  $if(paper)$ paper: "$paper$", $endif$
  $if(flipped)$ flipped: "$flipped$", $endif$

  // 著者のフォントサイズ（ポイント単位）。
  $if(authors-font-size)$ authors_font_size: $authors-font-size$, $endif$
  $if(authors-font-weight)$ authors_font_weight: $authors-font-weight$, $endif$

  // 部署のフォントサイズ（ポイント単位）。
  $if(department-font-size)$ department_font_size: $department-font-size$, $endif$
  $if(department-font-weight)$ department_font_weight: $department-font-weight$, $endif$

  //===============================================
  // フッターの設定
  $if(footer-font)$ footer_font: "$footer-font$", $endif$
  $if(footer-left-font)$ footer_left_font: "$footer-left-font$", $endif$
  $if(footer-center-font)$ footer_center_font: "$footer-center-font$", $endif$
  $if(footer-right-font)$ footer_right_font: "$footer-right-font$", $endif$

  // フッターフォントサイズ。
  $if(footer-left-font-size)$ footer_left_font_size: $footer-left-font-size$, $endif$
  $if(footer-center-font-size)$ footer_center_font_size: $footer-center-font-size$, $endif$
  $if(footer-right-font-size)$ footer_right_font_size: $footer-right-font-size$, $endif$

  // footer-left: 大会名など。
  $if(footer-left)$ footer_left: [$footer-left$], $endif$

  // footer-center: 日付など。
  $if(footer-center)$ footer_center: [$footer-center$], $endif$

  // footer-right: 著者のメールアドレスなど。
  $if(footer-right)$ footer_right: [$footer-right$], $endif$

  // フッターの色。
  $if(footer-color)$ footer_color: "$footer-color$", $endif$

  //===============================================

  // 強調したいキーワードや索引用語。
  $if(keywords)$ keywords: ($for(keywords)$"$it$"$sep$, $endfor$), $endif$

  //===============================================

  // ボディフォント設定
  $if(japanese-font)$ japanese_font: "$japanese-font$", $endif$
  $if(english-font)$ english_font: "$english-font$", $endif$
  $if(science-font)$ science_font: "$science-font$", $endif$

  // 本文のフォントサイズ
  $if(body-font-size)$ body_font_size: $body-font-size$, $endif$

  doc,
)
