library(flextable)
library(webshot2)
library(magrittr)
library(officer)

#' ゲーム理論の利得行列を作成・分析・可視化する関数群
#' @param payoffs リストの形式での利得行列 (例: list(c(4,4), c(4,5), ...))
#' @param strategy_names_a プレイヤーAの戦略名のベクトル
#' @param strategy_names_b プレイヤーBの戦略名のベクトル（省略時はプレイヤーAと同じ）
#' @param epsilon 浮動小数点比較用の許容誤差
create_game_data <- function(payoffs, strategy_names_a, strategy_names_b = NULL, epsilon = 1e-10) {
  if (is.null(strategy_names_b)) {
    strategy_names_b <- strategy_names_a
  }
  
  num_strategies_a <- length(strategy_names_a)
  num_strategies_b <- length(strategy_names_b)
  
  if (length(payoffs) != num_strategies_a * num_strategies_b) {
    stop("利得行列のサイズと戦略数が一致しません")
  }
  
  return(list(
    payoffs = payoffs,
    num_strategies_a = num_strategies_a,
    num_strategies_b = num_strategies_b,
    strategy_names_a = strategy_names_a,
    strategy_names_b = strategy_names_b,
    epsilon = epsilon
  ))
}

#' ナッシュ均衡を計算する関数
calculate_nash_equilibrium <- function(game_data) {
  if (!is.list(game_data) || is.null(game_data$payoffs)) {
    stop("Invalid game data format")
  }
  nash_equilibria <- list()
  
  is_nash_equilibrium <- function(strategy_a, strategy_b) {
    current_idx <- (strategy_a - 1) * game_data$num_strategies_b + strategy_b
    current_payoff <- game_data$payoffs[[current_idx]]
    
    # プレイヤーAの最適反応チェック
    for (i in 1:game_data$num_strategies_a) {
      if (i != strategy_a) {
        other_idx <- (i - 1) * game_data$num_strategies_b + strategy_b
        other_payoff <- game_data$payoffs[[other_idx]]
        if (other_payoff[1] > current_payoff[1] + game_data$epsilon) {
          return(FALSE)
        }
      }
    }
    
    # プレイヤーBの最適反応チェック
    for (j in 1:game_data$num_strategies_b) {
      if (j != strategy_b) {
        other_idx <- (strategy_a - 1) * game_data$num_strategies_b + j
        other_payoff <- game_data$payoffs[[other_idx]]
        if (other_payoff[2] > current_payoff[2] + game_data$epsilon) {
          return(FALSE)
        }
      }
    }
    
    return(TRUE)
  }
  
  for (i in 1:game_data$num_strategies_a) {
    for (j in 1:game_data$num_strategies_b) {
      if (is_nash_equilibrium(i, j)) {
        idx <- (i - 1) * game_data$num_strategies_b + j
        nash_equilibria[[length(nash_equilibria) + 1]] <- list(
          strategies = c(game_data$strategy_names_a[i], game_data$strategy_names_b[j]),
          payoffs = game_data$payoffs[[idx]]
        )
      }
    }
  }
  
  return(nash_equilibria)
}

#' 表示用データフレームを作成する関数
create_display_dataframe <- function(game_data) {
  display_data <- data.frame(
    Strategy = game_data$strategy_names_a,
    matrix(NA, nrow = game_data$num_strategies_a, ncol = game_data$num_strategies_b)
  )
  names(display_data)[2:(game_data$num_strategies_b + 1)] <- game_data$strategy_names_b
  
  for (i in 1:game_data$num_strategies_a) {
    for (j in 1:game_data$num_strategies_b) {
      idx <- (i - 1) * game_data$num_strategies_b + j
      payoff <- game_data$payoffs[[idx]]
      display_data[i, j + 1] <- paste(payoff[1], payoff[2], sep = ", ")
    }
  }
  
  return(display_data)
}

#' flextableを作成・カスタマイズする関数
create_game_table <- function(display_data, nash_equilibria, style_options = list(), highlight_nash = TRUE) {
  # デフォルトのスタイル設定
  default_style <- list(
    font_size = 10.5,
    font_family = "Times New Roman",
    padding = 8,
    bg_color = "white",
    highlight_color = "lightgray",
    border_color = "black",
    header_border_width = 2,
    first_col_border_width = 2
  )
  
  # ユーザー指定のスタイルでデフォルト値を上書き
  style <- modifyList(default_style, style_options)
  
  ft <- flextable(display_data) %>%
    align(align = "center", part = "all") %>%
    set_header_labels(Strategy = "") %>%
    fontsize(size = style$font_size, part = "all") %>%
    padding(padding = style$padding, part = "all") %>%
    bg(bg = style$bg_color, part = "all") %>%
    font(font = style$font_family, part = "all") %>%
    bold(j = 1, part = "body") %>%
    bold(part = "header", bold = TRUE) %>%
    border_outer(border = fp_border(color = style$border_color)) %>%
    border_inner(border = fp_border(color = style$border_color)) %>%
    hline(part = "header", border = fp_border(width = style$header_border_width, color = style$border_color)) %>%
    vline(j = 1, border = fp_border(width = style$first_col_border_width, color = style$border_color))
  
  if (highlight_nash) {
    for (eq in nash_equilibria) {
      row_idx <- which(display_data$Strategy == eq$strategies[1])
      col_idx <- which(names(display_data) == eq$strategies[2])
      
      ft <- ft %>%
        bg(i = row_idx, j = col_idx, bg = style$highlight_color) %>%
        bold(i = row_idx, j = col_idx)
    }
  }
  
  return(ft)
}

#' ゲーム理論の表を画像として保存する関数
save_game_table <- function(ft, output_path, zoom = 3, resolution = 2000) {
  dir_path <- dirname(output_path)
  if (!dir.exists(dir_path)) {
    dir.create(dir_path, recursive = TRUE)
  }
  
  tryCatch({
    save_as_image(
      ft,
      path = output_path,
      webshot = dir_path,
      zoom = zoom,
      res = resolution
    )
  }, error = function(e) {
    message("Error saving image: ", e$message)
  })
}

#' ゲーム理論の表を生成する主要関数
create_game_analysis <- function(payoffs, strategies_a, strategies_b = NULL, output_dir = "_webshot2", save_images = TRUE) {
  # 入力値の検証
  if (!is.list(payoffs) || !all(sapply(payoffs, length) == 2)) {
    stop("payoffsは2要素のベクトルのリストである必要があります")
  }
  if (!is.character(strategies_a)) {
    stop("strategies_aは文字列のベクトルである必要があります")
  }
  
  # ゲームデータの作成
  game_data <- create_game_data(payoffs, strategies_a, strategies_b)
  
  # ナッシュ均衡の計算
  nash_equilibria <- calculate_nash_equilibrium(game_data)
  
  # 表示用データの作成
  display_data <- create_display_dataframe(game_data)
  
  # カスタムスタイルの定義
  custom_style <- list(
    font_size = 10.5,
    highlight_color = "#E8E8E8",
    border_color = "#000000"
  )
  
  # テーブルの作成
  ft_with_nash <- create_game_table(display_data, nash_equilibria, custom_style, highlight_nash = TRUE)
  ft_without_nash <- create_game_table(display_data, nash_equilibria, custom_style, highlight_nash = FALSE)
  
  # 画像として保存（オプション）
  if (save_images) {
    if (!dir.exists(output_dir)) {
      dir.create(output_dir, recursive = TRUE)
    }
    save_game_table(ft_with_nash, file.path(output_dir, "game_matrix_with_nash.png"))
    save_game_table(ft_without_nash, file.path(output_dir, "game_matrix_without_nash.png"))
  }
  
  # 結果を返す
  return(list(
    with_nash = ft_with_nash,
    without_nash = ft_without_nash,
    nash_equilibria = nash_equilibria
  ))
}

# メイン処理
main <- function() {
  # 非対称ゲームのサンプルデータ
  sample_payoffs <- list(
    c(3, 2), c(1, 1),  # Row 1: (Cooperate vs Aggressive), (Cooperate vs Passive)
    c(0, 3), c(2, 0)   # Row 2: (Defect vs Aggressive), (Defect vs Passive)
  )
  strategies_a <- c("Cooperate", "Defect")
  strategies_b <- c("Aggressive", "Passive")
  
  # 出力ディレクトリの設定
  output_dir <- "research_meetings/2024-12-12/figures"
  
  # 分析の実行
  results <- create_game_analysis(
    payoffs = sample_payoffs,
    strategies_a = strategies_a,
    strategies_b = strategies_b,
    output_dir = output_dir,
    save_images = TRUE
  )
  
  # 結果の表示
  print("Nash Equilibria:")
  print(results$nash_equilibria)
  
  return(results)
}

# スクリプトの実行
# results <- main()
