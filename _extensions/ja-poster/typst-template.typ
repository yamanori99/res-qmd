#let poster(
  //===============================================
  // タイトルの設定
  title: "Paper Title",
  title_font: "Hiragino Kaku Gothic ProN",
  title_weight: 400,
  title_font_size: "48",
  left_title_column_size: "0",
  right_title_column_size: "0",
  title_column_size: "20",
  title_row_size: "4.1",

  //===============================================
  // ヘッダーの設定
  header_font: "Hiragino Kaku Gothic ProN",
  authors: "Author Names (separated by commas)",
  authors_font_size: "36",
  authors_font_weight: 400,
  departments: "Department Name",
  department_font_size: "36",
  department_font_weight: 400,

  //===============================================
  // ポスターバナー/ロゴ
  banner: "Banner/logos Path",

  //===============================================
  // フッターの設定
  footer_font: "Optima",
  footer_left_font: "Helvetica Neue",
  footer_center_font: "Optima",
  footer_right_font: "Arial",
  footer_left_font_size: "30",
  footer_center_font_size: "42",
  footer_right_font_size: "30",
  footer_left: "",
  footer_center: "",
  footer_right: "",
  footer_color: "FBF4F3",
  footer_url_font_size: "30",
  footer_text_font_size: "40",

  //===============================================
  // デフォルト設定
  paper: "a0",
  flipped: true,  // ポスターを縦向きにする場合はfalse
  num_columns: "2",
  margin_top: "0",
  margin_left: "1",
  margin_right: "1",
  margin_bottom: "2",
  space_after_header: "0",

  //===============================================
  // ボディフォント設定
  english_font: "Helvetica Neue",
  japanese_font: "Hiragino Kaku Gothic ProN",
  scientific_font: "STIX Two Text",
  body_font_size: "28",

  //===============================================
  // キーワード
  keywords: (),

  //===============================================
  // ポスターの内容
  body,
) = {
  // フォントとサイズの設定
  body_font_size = int(body_font_size) * 1pt
  set text(font: (english_font, japanese_font, scientific_font), size: body_font_size)
  title_font_size = int(title_font_size) * 1pt
  authors_font_size = int(authors_font_size) * 1pt
  num_columns = int(num_columns)
  left_title_column_size = float(left_title_column_size) * 1in
  right_title_column_size = float(right_title_column_size) * 1in
  title_column_size = float(title_column_size) * 1in
  title_row_size = float(title_row_size) * 1in
  footer_url_font_size = int(footer_url_font_size) * 1pt
  footer_text_font_size = int(footer_text_font_size) * 1pt
  department_font_size = int(department_font_size) * 1pt
  margin_top = float(margin_top) * 1in
  margin_left = float(margin_left) * 1in
  margin_right = float(margin_right) * 1in
  margin_bottom = float(margin_bottom) * 1in
  space_after_header = float(space_after_header) * 1pt

  let to-string(content) = {
    if content.has("text") {
      content.text
    } else if content.has("children") {
      content.children.map(to-string).join("")
    } else if content.has("body") {
      to-string(content.body)
    } else if content == [ ] {
      " "
    }
  }

  flipped = flipped == "true"

  // ページの設定
  set page(
    paper: paper,
    flipped: flipped,
    margin: 
      (top: margin_top, left: margin_left, right: margin_right, bottom: margin_bottom),
    background: align(center + top, image(banner, width: 100%)),
    footer: [
      #set align(center)
      #block(
        fill: rgb(footer_color),
        width: 100%,
        inset: 20pt,
        radius: 10pt,
        [
          #link(to-string(text(footer_left)))[#text(size: footer_left_font_size * 1pt, font: footer_left_font, footer_left)]
          #h(1fr) 
          #text(size: footer_center_font_size * 1pt, font: footer_center_font, smallcaps(footer_center)) 
          #h(1fr) 
          #link("mailto:"+to-string(text(footer_right)))[#text(size: footer_right_font_size * 1pt, font: footer_right_font, footer_right)]
        ]
      )
    ]
  )

  // 数式とリストの設定
  set math.equation(numbering: "(1)")
  show math.equation: set block(spacing: 0.65em)
  set enum(indent: 10pt, body-indent: 9pt)
  set list(indent: 10pt, body-indent: 9pt)

  // 見出しの設定
  set heading(numbering: "I.A.1.")
  show heading: it => locate(loc => {
    let levels = counter(heading).at(loc)
    let deepest = if levels != () {
      levels.last()
    } else {
      1
    }

    set text(24pt, weight: 400)
    if it.level == 1 [
      #set align(center)
      #set text({ 32pt })
      #show: smallcaps
      #v(50pt, weak: true)
      #if it.numbering != none {
        numbering("I.", deepest)
        h(7pt, weak: true)
      }
      #it.body
      #v(35.75pt, weak: true)
      #line(length: 100%)
    ] else if it.level == 2 [
      #set text(style: "italic")
      #v(32pt, weak: true)
      #if it.numbering != none {
        numbering("i.", deepest)
        h(7pt, weak: true)
      }
      #it.body
      #v(10pt, weak: true)
    ] else [
      #if it.level == 3 {
        numbering("1)", deepest)
        [ ]
      }
      _#(it.body):_
    ]
  })

  // ヘッダーの配置
  align(center + top,
    grid(
      align: center + horizon,
      rows: (title_row_size),
      columns: (left_title_column_size, title_column_size, right_title_column_size),
      column-gutter: 0pt,
      row-gutter: 50pt,
      "",
      par(leading: 0.5em, text(title_font_size, white, font: title_font, title + "\n", weight: title_weight)) + v(title_font_size/2, weak: true) +
      text(authors_font_size, white, font: header_font, weight: authors_font_weight, authors + "\n") + v(title_font_size/3, weak: true) + 
      text(department_font_size, white, font: header_font, weight: department_font_weight, departments),
      "",
    )
  )

  v(space_after_header)

  // カラムモードの開始と段落の設定
  show: columns.with(num_columns, gutter: 64pt)
  set par(justify: true, first-line-indent: 0em)
  show par: set block(spacing: 0.65em)

  // キーワードの表示
  if keywords != () [
      #set text(24pt, weight: 400)
      #show "Keywords": smallcaps
      *Keywords* --- #keywords.join(", ")
  ]

  // ポスターの内容を表示
  body
}