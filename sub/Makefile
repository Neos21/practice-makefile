# コンパイラを指定する・`$(CC)` で参照する・コマンド部分で `g++` を直接書いても問題はない
CC := g++

# `$ make` (引数未指定) で実行されるのは最初に登場するターゲットになる
# `clean` というファイルが存在すると `$ make clean` が実行できなくなるので `.PHONY` を記述しておく
# `$(RM)` はデフォルトで `$ rm -f` コマンドが実行される
.PHONY: clean
clean:
	$(RM) ./practice.txt
