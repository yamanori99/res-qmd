# init_python_env.R

# 仮想環境の作成
system("python3 -m venv .project_venv")

# 仮想環境のアクティベートとpipのアップグレード
system("source .project_venv/bin/activate && pip install --upgrade pip")

# 必要なパッケージのインストール
system(
  "source .project_venv/bin/activate && \
  pip install -r _project-materials/python/requirements.txt"
)

# Jupyterカーネルの作成, .qmdではjupyter: .project_venv_kernelと指定する
system(paste(
  "source .project_venv/bin/activate &&",
  "python -m ipykernel install --user --name=.project_venv_kernel",
  "--display-name='Python (.project_venv)'"
))

cat("Python environment setup complete.\n")
