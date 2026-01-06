---
description: Record work session log to nb-log repository
argument-hint: [optional note]
---

# nb-log Rules

あなた（AIエージェントClaude Code）は、このプロジェクトで実行した内容を、**ユーザーからの明示的な指示があった時に**、`~/Develop/repo/github/nnamm/nb/log`に報告する必要があります。

## 記録方法

- 入力：`/nb-log` → `~/Develop/repo/github/nnamm/nb/log/YYYYMMDDHHMMSS_xxxxx.md`
- YYYYMMDDHHMMSSは、ログを記録した日時（年4桁、月2桁、日2桁、時2桁、分2桁、秒2桁）
- xxxxxは、タスクのタイトルを短縮したもの（スペースはアンダースコアに置換）

## 記録フォーマット

```txt
# <task title>

- **Prompt**: <受け取った指示>
- **Issue**: <課題の内容>

## What I did: <やったことの要約>

...

## How I did it: <どうやって解決したか>

...

## What were challenging: <難しかったこと>

...

## Future work (optional)

- <今後の改善案など>
```
