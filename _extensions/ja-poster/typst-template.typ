#let poster(
  //===============================================
  // タイトルの設定
  title: "Paper Title",
  title_font: "Hiragino Sans",
  title_weight: "170",
  title_font_size: "70",
  left_title_column_size: "0",
  right_title_column_size: "0",
  title_column_size: "30",
  title_row_size: "5.1",

  //===============================================
  // ヘッダーの設定
  header_font: "Hiragino Sans",
  authors: "",
  authors_font_size: "50",
  authors_font_weight: "150",  // Ultra Light
  departments: "",
  department_font_size: "50",
  department_font_weight: "150",  // Ultra Light

  //===============================================
  // ポスターバナー/ロゴ
  banner: none,

  //===============================================
  // フッターの設定
  footer_center_font: "Optima",
  footer_left_font: "Hiragino Kaku Gothic ProN",
  footer_right_font: "Helvetica Neue",
  footer_left_font_size: "38",
  footer_center_font_size: "38",
  footer_right_font_size: "30",
  footer_left: "HBES-J 2024 Hiroshima",  // 左側に表示する内容
  footer_center: "2024-12-08, P32",      // 中央に表示する内容
  footer_right: "me@yamanori.net",       // 右側に表示する内容（メールアドレス）
  footer_color: "FBF4F3",
  footer_url_font_size: "30",            // URLサイズを適切な大きさに
  footer_text_font_size: "34",           // テキストサイズを適切な大きさに

  //===============================================
  // デフォルト設定
  paper: "a0",
  flipped: false,  // ポスターを縦向きにする場合はfalse
  num_columns: "0",  // デフォルトの列数
  margin_top: "0",  // 上部マージンを0に設定
  margin_left: "1",
  margin_right: "1",
  margin_bottom: "1.0",

  //===============================================
  // ボディフォント設定
  english_font: "Helvetica Neue",
  japanese_font: "Hiragino Kaku Gothic ProN",
  scientific_font: "STIX Two Text",
  body_font_size: "32",

  //===============================================
  // キーワード
  keywords: (),

  //===============================================
  // ポスーの内容
  body,

  //===============================================
  // タイトル位置調整
  title_spacing_top: "-0.4",  // より上に詰める
  title_spacing_bottom: "-0.8",  // タイトルとヘッダーの間隔を詰める
  header_spacing_top: "-0.5",   // ヘッダー上部の間隔を詰める
  header_spacing_bottom: "-0.5", // ヘッダー下部の間隔を詰める

  //===============================================
  // 見出しフォントサイズ設定を追加
  heading1_font_size: "52",
  heading2_font_size: "44",
  heading3_font_size: "37",

  // 見出しウェイト設定を追
  heading1_weight: "300",
  heading2_weight: "400",
  heading3_weight: "300",

  //===============================================
  // 行間設定を追加
  body_leading: "0.5",        // 本文の行間
  heading1_leading: "0",    // 見出し1の行間
  heading2_leading: "0",    // 出し2の行間
  heading3_leading: "1.4",    // 見出し3の行間

  //===============================================
  // 見出し
  // 見出し1（I, II, III, IV）
  heading1_spacing_before: 0.5,   // 見出し1の上部スペースを小さく
  heading1_spacing_after: 0.05,   // 見出し1の下部スペースを小さく
  
  // 見出し2（i, ii）
  heading2_spacing_before: 0.4,   // 見出し2の上部スペースを小さく
  heading2_spacing_after: 0.4,    // 見出し2の下スペースを小さく
  
  // 見出し3（数字付きリスト）
  heading3_spacing_before: 0.2,   // 見出し3の上部スペースを小さく
  heading3_spacing_after: 0.3,    // 見出し3の下部スペースを小さく
  
  heading1_color_default: "#e3f2fd",  // デフォルトは薄い青色（背景と目的向け）

  heading1_colors: (
    "1": "#e3f2fd",  // 背景と目的 - 薄い青色
    "2": "#fff3cd",  // 方法 - warning色（黄色系）
    "3": "#f8d7da",  // 分析と結果 - important色（赤系）
    "4": "#d4edda",  // まとめ - tip色（緑系）
  ),

  heading2_color_default: "#f1f8fe",  // デフォルトはさらに薄い青色

  // 見出し2用の色設定を修正
  heading2_colors: (
    "1": "#f1f8fe",  // より薄い青色
    "2": "#fff8e6",  // より薄いwarning色
    "3": "#fcf0f1",  // より薄いimportant色
    "4": "#eaf6ec",  // より薄いtip色
  ),

  // 見出し3用の色設定
  heading3_color_default: "#f8fbfe",  // さらに薄い青色

  // 見出し3用の色設定
  heading3_colors: (
    "1": "#f8fbfe",  // さらに薄い青色
    "2": "#fffbf2",  // さらに薄いwarning色
    "3": "#fdf6f6",  // さらに薄いimportant色
    "4": "#f4faf5",  // さらに薄いtip色
  ),

  //===============================================
  // レイアウトコラムのスペーシング設定
  layout_spacing_before: 0.2,  // イアウトコラム前の余白を小さく
  layout_spacing_after: 0.2,   // レイアウトコラム後の余白を小さく


  // 本文のスペーシング設定統合
  body_spacing_before: 0.3,     // 本文前のスペースを小さく
  body_spacing_after: 0.0,      // 本文後のスペースを無くす

  // 大見出し下線後のスペース設定を追加
  heading1_line_spacing_after: 0.05,  // より小さい値に

  // キャプション表示フラ追加
  show_captions: true,  // デフォルトで表示

  //===============================================
  // 見出しナンバリング設定を追加
  heading1_numbering: true,   // 見出し1のナンバリン（true/false）
  heading2_numbering: true,   // 見出し2のナンバリング（true/false）
  heading3_numbering: true,   // 見出し3のナンバリング（true/false）

  // マージン設定を追加（パラメータ部分）
  // バレットリストのマーカーも依存しているので注。
  margins: (
    h1: (
      heading: (left: 0%, right: 0%),         // 見出し1自体のマージン
      heading_text: (left: -2%, right: -2%),  // 見出し1の文字部分のマージン
      body: (left: 2%, right: 2%)             // 見出し1配下の本文のマージン
    ),
    h2: (
      heading: (left: 2%, right: 2%),         // 見出し2自体のマージン
      heading_text: (left: -4%, right: -4%),  // 見出し2の文字部分のマージン
      body: (left: 4%, right: 4%)             // 見出し2配下の本文のマージン
    ),
    h3: (
      heading: (left: 4%, right: 4%),         // 見出し3自体のマージン
      heading_text: (left: -4%, right: -4%),  // 見出し3の文字部分のマージン
      body: (left: 4%, right: 4%)             // 見出し3配の本文のマージン
    ),
    body: (left: 2%, right: 2%)               // どの見出しにも属さない本文用マージン
  ),

  // 見出しの余白設定をより詳細に（垂直方向のマージンのみ）
  heading_margin: (
    h1: (top: 1.0em, bottom: 0.9em),
    h2: (top: 0.8em, bottom: 0.4em),
    h3: (top: 0.6em, bottom: 0.3em)
  ),

  //===============================================
  // リストのスタイル設定を追加
  list_item_spacing: "0.3",     // リストアイテム間のスペースを小さく
  list_block_spacing: "0.2",    // リストブロックの上下スペースを小さく
  list_leading: "0.4",          // リストアイテム内の行間を小さく
  bullet_size: "1",            // バレットのサイズ（em単位）
  bullet_gutter: "-0.5",          // バレットとテキストの間隔（em単位）

  //===============================================
  // バナー位置調整のデフォルト値
  banner_offset: "-3.0",  // バナーの上方向へのオフセット（cm）

) = {
  // フォントサイズ設
  body_font_size = int(body_font_size) * 1pt
  set text(font: (english_font, japanese_font, scientific_font), size: body_font_size)
  let columns = int(num_columns)
  title_font_size = int(title_font_size) * 1pt
  title_weight = int(title_weight)
  authors_font_size = int(authors_font_size) * 1pt
  authors_font_weight = int(authors_font_weight)
  department_font_weight = int(department_font_weight)
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

  // フォントサイズの設定
  heading1_font_size = int(heading1_font_size) * 1pt
  heading2_font_size = int(heading2_font_size) * 1pt
  heading3_font_size = int(heading3_font_size) * 1pt

  // 間設定の変換より明理を追加）
  body_leading = if type(body_leading) == "string" {
    float(body_leading)
  } else {
    float(str(body_leading))
  }
  heading1_leading = if type(heading1_leading) == "string" {
    float(heading1_leading)
  } else {
    float(str(heading1_leading))
  }
  heading2_leading = if type(heading2_leading) == "string" {
    float(heading2_leading)
  } else {
    float(str(heading2_leading))
  }
  heading3_leading = if type(heading3_leading) == "string" {
    float(heading3_leading)
  } else {
    float(str(heading3_leading))
  }

  // ウェイト設定を数値に変換
  heading1_weight = int(heading1_weight)
  heading2_weight = int(heading2_weight)
  heading3_weight = int(heading3_weight)

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

  // ォントサイズの単位変換をより安全に行う
  let to-pt(size) = {
    if type(size) == "integer" { size * 1pt }
    else if type(size) == "float" { size * 1pt }
    else { int(size) * 1pt }
  }

  // ペッターの内容を処理
  let footer_content = (
    left: if footer_left != none { footer_left } else { "" },
    center: if footer_center != none { footer_center } else { "" },
    right: if footer_right != none { footer_right } else { "" }
  )

  // ページ設定
  set page(
    paper: paper,
    flipped: flipped,
    margin: (
      top: margin_top, 
      left: margin_left, 
      right: margin_right, 
      bottom: margin_bottom
    ),
    background: align(center + top, block(
      move(dy: float(banner_offset) * 1cm, // バナーオフセットを使用
        image(banner, width: 100%)
      )
    )),
    footer: locate(loc => {
      block(
        fill: rgb(footer_color),
        width: 100%,
        inset: (x: 20pt, y: 15pt),
        radius: 10pt,
        grid(
          columns: (1fr, 1fr, 1fr),
          column-gutter: 10pt,
          align: (center + horizon, center + horizon, center + horizon),
          {
            set text(fill: rgb("#000000"))
            if footer_content.left != "" {
              link(to-string(text(footer_content.left)))[
                #text(size: to-pt(footer_left_font_size), 
                     font: footer_left_font, 
                     footer_content.left)
              ]
            }
          },
          text(size: to-pt(footer_center_font_size), 
               font: footer_center_font, 
               smallcaps(footer_content.center)),
          {
            set text(fill: rgb("#000000"))
            if footer_content.right != "" {
              link("mailto:" + to-string(text(footer_content.right)))[
                #text(size: to-pt(footer_right_font_size), 
                     font: footer_right_font, 
                     footer_content.right)
              ]
            }
          }
        )
      )
    })
  )

  // パラメータの単位変換
  list_item_spacing = float(list_item_spacing) * 1em
  list_block_spacing = float(list_block_spacing) * 1em
  list_leading = float(list_leading) * 1em
  bullet_size = float(bullet_size) * 1em
  bullet_gutter = float(bullet_gutter) * 1em

  // リストのスタイル設定を更新
  show list: it => {
    set block(above: list_block_spacing, 
              below: list_block_spacing)
    set par(leading: list_leading)
    
    locate(loc => {
      let current_heading_level = counter(heading).at(loc).len()
      
      // マージン設定の取得（見出しレベルに応じて）
      let margin = if current_heading_level == 1 {
        margins.h1.body
      } else if current_heading_level == 2 {
        margins.h2.body
      } else if current_heading_level == 3 {
        margins.h3.body
      } else {
        margins.body
      }
      
      let effective_width = 100% - margin.left - margin.right
      
      block(
        width: effective_width,
        move(dx: margin.left,
          {
            for item in it.children {
              block(
                spacing: list_item_spacing,
                {
                  set text(dir: ltr)
                  grid(
                    columns: (1.5em, 1fr),
                    gutter: bullet_gutter,
                    {
                      align(right, text(size: bullet_size)[•])
                    },
                    item.body
                  )
                }
              )
            }
          }
        )
      )
    })
  }

  // 番号付きリストも同様に修正
  show enum: it => {
    set block(above: list_block_spacing, 
              below: list_block_spacing)
    set par(leading: list_leading)
    
    locate(loc => {
      let current_heading_level = counter(heading).at(loc).len()
      
      let margin = if current_heading_level == 1 {
        margins.h1.body
      } else if current_heading_level == 2 {
        margins.h2.body
      } else if current_heading_level == 3 {
        margins.h3.body
      } else {
        margins.body
      }
      
      let effective_width = 100% - margin.left - margin.right
      
      block(
        width: effective_width,
        move(dx: margin.left,
          {
            for (i, item) in it.children.enumerate() {
              block(
                spacing: list_item_spacing,
                {
                  set text(dir: ltr)
                  grid(
                    columns: (2em, 1fr),
                    gutter: bullet_gutter,
                    {
                      align(right, text(size: bullet_size)[(#(i + 1)). ])
                    },
                    item.body
                  )
                }
              )
            }
          }
        )
      )
    })
  }

  // 段落設定を統合（本文のマージン処理を修正）
  show par: it => {
    locate(loc => {
      let current_heading_level = counter(heading).at(loc).len()
      
      // マージン設定の取得（見出し内の本文かどうかを慮）
      let margin = if current_heading_level == 1 {
        margins.h1.body
      } else if current_heading_level == 2 {
        margins.h2.body
      } else if current_heading_level == 3 {
        margins.h3.body
      } else {
        margins.body
      }
      
      let effective_width = 100% - margin.left - margin.right
      
      // 端揃を解除し、すべて左揃えに
      set par(justify: false, first-line-indent: 0em)
      
      // 前後のスペースを別々のブロックで制御
      v(float(body_spacing_before) * 1em)
      block(
        width: effective_width,
        move(
          dx: margin.left,
          align(left, it)
        )
      )
      v(float(body_spacing_after) * 1em)
    })
  }

  // ヘッダー（タイトル部）配置
  v(float(title_spacing_top) * 1in)
  align(center + top,
    grid(
      align: center + horizon,
      rows: (title_row_size),
      columns: (left_title_column_size, title_column_size, right_title_column_size),
      column-gutter: 0pt,
      row-gutter: 50pt,
      "",
      {
        v(float(header_spacing_top) * 1in)
        par(leading: 0.5em, text(title_font_size, white, font: title_font, title + "\n", weight: title_weight))
        v(float(title_spacing_bottom) * 1in)
        text(authors_font_size, white, font: header_font, weight: authors_font_weight, authors + "\n")
        v(float(header_spacing_top) * 1in)
        text(department_font_size, white, font: header_font, weight: department_font_weight, departments)
        v(float(header_spacing_bottom) * 1in)
      },
      "",
    )
  )

  // 本文の間のスース
  v(-2cm, weak: true)
  line(length: 0pt)  // 置定するたのえないライン

  // カウンターとナンバリングの設定
  counter(heading).update(())
  set heading(numbering: "I.i.1.")

  show heading: it => locate(loc => {
    let levels = counter(heading).at(loc)
    
    let should_number = {
      if it.numbering == none {
        false
      } else {
        if it.level == 1 { heading1_numbering }
        else if it.level == 2 { heading2_numbering }
        else if it.level == 3 { heading3_numbering }
        else { false }
      }
    }
    
    if it.level == 1 {
      // 見出し1の前後のスペース
      v(float(heading1_spacing_before) * 1em, weak: true)
      block(
        width: 100% - margins.h1.heading.left - margins.h1.heading.right,
        fill: rgb(heading1_colors.at(str(counter(heading).at(loc).first()), default: heading1_color_default)),
        inset: (x: 10pt, y: 8pt),
        move(dx: margins.h1.heading.left,
          block(
            width: 100% - margins.h1.heading_text.left - margins.h1.heading_text.right,
            move(
              dx: margins.h1.heading_text.left,
              {
                set align(center)
                set text(heading1_font_size, weight: heading1_weight)
                set par(leading: heading1_leading * 1em)
                if should_number {
                  numbering("I.", counter(heading).at(loc).first())
                  h(7pt, weak: true)
                }
                it.body
              }
            )
          )
        )
      )
      v(float(heading1_spacing_after) * 1em, weak: true)
      line(length: 100%, stroke: 0.5pt)
      v(heading1_line_spacing_after * 1em, weak: true)
    } else if it.level == 2 {
      // 見出し2の前後のスペース
      v(float(heading2_spacing_before) * 1em, weak: true)
      block(
        width: 100% - margins.h2.heading.left - margins.h2.heading.right,
        fill: rgb(heading2_color_default),
        inset: (x: 8pt, y: 6pt),
        move(dx: margins.h2.heading.left,
          block(
            width: 100% - margins.h2.heading_text.left - margins.h2.heading_text.right,
            move(
              dx: margins.h2.heading_text.left,
              {
                set text(heading2_font_size, weight: heading2_weight)
                set par(leading: heading2_leading * 1em)
                if should_number {
                  numbering("i.", counter(heading).at(loc).at(1, default: 1))
                  h(7pt, weak: true)
                }
                it.body
              }
            )
          )
        )
      )
      v(float(heading2_spacing_after) * 1em, weak: true)
    } else {
      // 見出し3の前後のスペース
      v(float(heading3_spacing_before) * 1em, weak: true)
      block(
        width: 100% - margins.h3.heading.left - margins.h3.heading.right,
        move(dx: margins.h3.heading.left,
          block(
            width: 100% - margins.h3.heading_text.left - margins.h3.heading_text.right,
            move(
              dx: margins.h3.heading_text.left,
              {
                set text(heading3_font_size, weight: heading3_weight)
                set par(leading: heading3_leading * 1em)
                if should_number and it.level == 3 {
                  numbering("1.", counter(heading).at(loc).last())
                  h(7pt, weak: true)
                }
                it.body
              }
            )
          )
        )
      )
      v(float(heading3_spacing_after) * 1em, weak: true)
    }
  })

  // カラムモードの始と段落の設定
  if columns > 0 {
    // コラムの横幅を調整するためのマージンを設定
    let column_margin = 2.5cm  // 左右それぞれに2.5cmのージン
    block(
      width: 100% - (2 * column_margin),
      inset: (left: column_margin, right: column_margin),
      {
        set columns(count: columns, gutter: 64pt)
        body
      }
    )
  } else {
    body
  }

  // ーワードの非表示
  // if keywords != () [
  //     #set text(26pt, weight: 400)
  //     #show "Keywords": smallcaps
  //     *Keywords* --- #keywords.join(", ")
  // 



  // レスンシブ設定を変数として定義
  let responsive = (
    breakpoints: (
      small: 600pt,
      medium: 900pt,
      large: 1200pt
    ),
    scaling: (
      small: 0.8,
      medium: 1.0,
      large: 1.2
    )
  )

  // ページ幅に応じケーリン関数
  let scale-by-width = (loc) => {
    let width = loc.width
    if width <= responsive.breakpoints.small {
      responsive.scaling.small
    } else if width <= responsive.breakpoints.medium {
      responsive.scaling.medium
    } else {
      responsive.scaling.large
    }
  }


}