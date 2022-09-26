# 引数を指定しない場合に実行されるタスク
.PHONY: help
help:
	@# コマンドを出力しないようにするには、コマンドの手前に `@` を指定する (この行はシェルスクリプトのコメントとして扱われている)
	@echo 'Help.'

# `make` はターゲット名と同じ名前のファイルが存在すると、そのターゲットを実行しない仕組みになっている (更新日時をチェックしている)
# 以下の `install` タスクの場合、`install` というファイルが存在すると `$ make install` コマンドが動作しなくなる
# コレにより再ビルドする際に余計なタスクが動作しないように作られている
install:
	@# 以下は `@` を付けていないので、コマンド自体が標準出力に表示される
	echo 'Install'

# ファイルを生成しないタスクの場合は、以下のように `.PHONY: 【ターゲット名】` という行を書いておく
# こうすると `build` というファイルが存在しても、そのタスクが実行されるようになる
# コレを Phony Target と呼ぶ
.PHONY: build
build:
	@echo 'Build'

# 依存関係を記すための例
.PHONY: before-test
before-test:
	@echo 'Before Test'

# ターゲット名の後ろにターゲット名を書くことで依存関係を示せる
# 以下の `test` タスクは `before-test` タスクを先に実行してから実行される
.PHONY: test
test: before-test
	@echo 'Test'

# 別ディレクトリの `makefile` を実行するには `cd` すれば良い
# 行を別けて書くとカレントディレクトリは元に戻る
.PHONY: call-sub
call-sub:
	@echo "Let's Call Sub!"
	@cd ./sub/ && make && pwd  # 移動した先のディレクトリパスが表示される
	@pwd  # 呼び出し元のディレクトリパスが表示される
