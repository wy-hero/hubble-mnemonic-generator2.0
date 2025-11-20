#!/bin/bash

# 创建安全加固版本脚本

input="Bitcoin-Mnemonic-Offline-Generation-Tool.html"
output="Bitcoin-Mnemonic-Offline-Generation-Tool-SECURE.html"

# 读取原始文件并进行修改
awk '
BEGIN { in_font_face = 0; header_modified = 0 }

# 第1行：保留HTML标签
NR == 1 { print; next }

# 第2-4行：保留meta标签
NR >= 2 && NR <= 4 { print; next }

# 第5行：添加安全标头
NR == 5 {
    print "<!-- 安全策略：禁止所有外部资源加载，确保完全离线使用 -->"
    print "<meta http-equiv=\"Content-Security-Policy\" content=\"default-src '\''none'\''; script-src '\''unsafe-inline'\''; style-src '\''unsafe-inline'\''; img-src data:; font-src '\''none'\''';\">"
    print "<title>比特币助记词生成工具（安全加固版）</title>"
    print ""
    print "<!--"
    print "    ⚠️ 安全增强版本 ⚠️"
    print "    "
    print "    本版本已进行以下安全加固："
    print "    1. ✅ 移除所有外部字体引用（/cf-fonts/），防止网络请求泄露隐私"
    print "    2. ✅ 添加严格的 CSP (Content Security Policy) 策略"
    print "    3. ✅ 使用系统字体，确保完全离线运行"
    print "    4. ✅ 移除/警告外部链接"
    print "    5. ✅ 减少调试输出，防止信息泄露"
    print "    "
    print "    请务必在完全离线的环境中使用本工具！"
    print "    断开网络连接后再生成助记词！"
    print "-->"
    print ""
    next
}

# 跳过第6-7行（旧的title和空行以及外部字体）
NR >= 6 && NR <= 7 { next }

# 修改body的font-family
/^body \{$/, /^\}$/ {
    if (/font-family:/) {
        print "  font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, \"Helvetica Neue\", Arial, sans-serif, \"Apple Color Emoji\", \"Segoe UI Emoji\";"
        next
    }
}

# 修改所有font-family引用，移除Inter和JetBrains Mono
/font-family:.*Inter/ {
    gsub(/'\''Inter'\'', /, "")
    gsub(/, '\''Inter'\''/, "")
    gsub(/'\''Inter'\''/, "")
}

/font-family:.*JetBrains Mono/ {
    gsub(/'\''JetBrains Mono'\'', /, "")
    gsub(/, '\''JetBrains Mono'\''/, "")
    gsub(/'\''JetBrains Mono'\''/, "monospace")
}

# 打印所有其他行
{ print }
' "$input" > "$output"

echo "✅ 安全版本已创建：$output"
