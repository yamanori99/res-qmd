# move_output_dir.R
# このスクリプトは、outputディレクトリをoutput_archivesディレクトリに移動するためのもの
# 実装したが, プレビューで悪さする可能性があるため, _quarto.yamlでコメントアウトしている
# _quarto.yamlのpost-renderはプレビュー時でも実行されるため, 注意が必要
move_output_directory <- function() {
  # 現在の日時を取得
  now <- Sys.time()
  # フォーマットされた新しいディレクトリ名を作成
  new_dir_name <- format(now, "%Y%m%d_%H%M%S")
  # output_archivesディレクトリのパスを作成
  archives_path <- "output_archives"
  # output_archivesディレクトリが存在しない場合は作成
  if (!dir.exists(archives_path)) {
    dir.create(archives_path, recursive = TRUE, showWarnings = FALSE)
  }
  # 新しいディレクトリのパスを作成
  new_output_path <- file.path(archives_path, new_dir_name)
  # _outputディレクトリを新しいディレクトリに移動
  file.rename("output", new_output_path)
}

move_output_directory()