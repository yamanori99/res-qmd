library(flextable)
library(webshot2)
library(magrittr)
library(officer)

#' 論文用のシンプルなテーブルを作成する関数
#' @param data データフレーム
#' @param output_dir 出力ディレクトリ
#' @param save_images 画像として保存するかどうか
create_table_analysis <- function(data, output_dir = NULL, save_images = FALSE) {
  # テーブルの作成
  ft <- create_academic_table(data)
  
  # 画像として保存する場合
  if (save_images && !is.null(output_dir)) {
    # 出力ファイルパスの設定
    output_path <- file.path(output_dir, "table.png")
    
    # テーブルを画像として保存
    save_academic_table(ft, output_path)
  }
  
  return(ft)
}

#' テーブルの基本スタイルを設定する関数
create_academic_table <- function(data) {
  ft <- flextable(data) %>%
    # 基本フォント設定
    font(fontname = "Times New Roman", part = "all") %>%
    fontsize(size = 10, part = "all") %>%
    padding(padding = 6, part = "all") %>%
    # ヘッダーと最初の列を中央揃えに設定
    align(align = "center", part = "all") %>%
    # 数値データは右揃えに設定（最初の列以外）
    align_text_col(align = "center") %>%
    autofit()
  return(ft)
}

#' 数値列を右揃えにする補助関数
align_text_col <- function(ft, align = "center") {
  # 数値型の列を特定（最初の列を除く）
  numeric_cols <- sapply(ft$body$dataset[-1], is.numeric)  # 最初の列を除外
  if (any(numeric_cols)) {
    # 数値型の列名を取得
    numeric_col_names <- names(numeric_cols)[numeric_cols]
    # 数値列を右揃えに設定
    ft <- align(ft, j = numeric_col_names, align = align, part = "body")
  }
  return(ft)
}

#' テーブルを画像として保存する関数
#' @param ft flextableオブジェクト
#' @param output_path 出力パス
save_academic_table <- function(ft, output_path) {
  dir_path <- dirname(output_path)
  if (!dir.exists(dir_path)) {
    dir.create(dir_path, recursive = TRUE, showWarnings = FALSE)
  }
  
  save_as_image(
    ft,
    path = output_path,
    webshot = "webshot2",
    zoom = 3,
    res = 2000
  )
}

#' qmdで使用するためのテーブル作成関数
#' @param data データフレーム
#' @param caption テーブルのキャプション
create_qmd_table <- function(data, caption = NULL) {
  ft <- create_academic_table(data)
  
  if (!is.null(caption)) {
    ft <- set_caption(ft, caption = caption)
  }
  
  return(ft)
}