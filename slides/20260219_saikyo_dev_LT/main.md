---
marp: true
theme: gaia
_class: lead
style: |
  section {
    font-family: "Noto Sans CJK JP",  "Noto Sans JP";
  }
---

<!--
headingDivider: 1
-->

# CLIエディターに挑戦したい
## 再現性の高い開発環境を目指して

ryu
2026/2/19
埼京.dev #2 [埼京.dev]


# 自己紹介: ryu

<!--
header: "埼京.dev #2 [埼京.dev]"
footer: "2026/2/19 ryu(@ryu_trifolium)"
paginate: true
-->

- バックグラウンド:
  - 非 IT 系企業の社内 SE
  - エンジニア歴 2 年
  - Nix が好き
- GitHub: ryuryu333
- Zenn: trifolium

![bg vertical right:44% 75%](../utl/images/profile_icon.jpeg)
![bg 50%](../utl/images/x.png)


# 2026 年の野望
## CLI エディターを使ってみたい！！！

<!--
_class: lead
-->

# 背景

- WSL と Mac を併用している → 環境共有を楽に行いたい
- Nix で異なるマシン間のツールのバージョンを統一している

|  | システム環境 | ユーザー環境 | 開発環境 |
| :---: | :---: | :---: | :---: | 
| 管理場所 | dotfiles | dotfiles | project ごと |
| 管理対象 | システム設定 | ツールと設定ファイル | ツール |
| ツール | nix-darwin | home-manager | devShells |

<small>※ システム環境の管理は Mac のみ</small>


# 課題

- エディターは VSCode を使っている
  - Nix でインストールの管理はできている
  - 設定や拡張機能の管理できていない

#### WSL と Mac で同じエディター環境を再現できるのが理想


# VSCode と Nix

| | Mac | WSL |
| :---: | :---: | :---: |
| 導入 | 本体のみ | VSCode Server + ホスト側の本体 |
| 設定・拡張 | Nix で宣言管理<br>できる | Windows 側は Nix 管理できない |

#### WSL 内のみで構築する場合...

- Linux 用 IME、日本語フォントを準備する必要がある
- 構築が大変そう...


# CLI エディター

1. WSL の中でツール構築・管理が完結する
→ Nix で全てを管理しやすそう

2. AI エージェント普及により、CLI ツール中心になってきている
→ 指示とレビューだけなら VSCode である必要性はないかも

3. マウスレスが魅力的
→ 学習コストを払う価値がありそう


# 試したいエディター

- Helix
  - コマンド操作が（自分の）直感に近くて分かりやすそう
  - 拡張機能が不足しているらしい？のが懸念
- Vim or Neovim
  - 周囲に Vimmer が多いので質問しやすそう
  - 自分好みに拡張を組み合わせるのが楽しそう


# ご清聴ありがとうございました
<!--
_class: lead
-->
