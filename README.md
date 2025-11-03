# 比特币助记词生成器 | Bitcoin Mnemonic Generator

**中文** | **English**

完全离线的 BIP39 助记词生成工具，支持比特币地址生成（P2WPKH/SegWit 格式）。 | Fully offline BIP39 mnemonic generator with Bitcoin address generation (P2WPKH/SegWit format).

---

## ✨ 主要特性 | Key Features

- ✅ **完全离线运行** - 无需网络连接，保护隐私安全 | **Fully Offline** - No network connection required, protecting privacy
- ✅ **内置 BIP39 词表** - 无需外部文件，开箱即用 | **Built-in BIP39 Wordlist** - No external files needed, ready to use
- ✅ **标准兼容** - 遵循 BIP39、BIP32、BIP84 标准 | **Standard Compliant** - Follows BIP39, BIP32, BIP84 standards
- ✅ **比特币地址生成** - 自动生成 P2WPKH（SegWit/Bech32）格式收款地址 | **Bitcoin Address Generation** - Automatically generates P2WPKH (SegWit/Bech32) receiving addresses
- ✅ **加密安全随机数** - 使用浏览器原生 Web Crypto API | **Cryptographically Secure Random** - Uses browser native Web Crypto API
- ✅ **私钥安全保护** - 实施主动清零机制，敏感数据立即清除 | **Private Key Protection** - Active zeroing mechanism, sensitive data cleared immediately
- ✅ **日/夜主题切换** - 支持白天和夜晚两种显示模式 | **Day/Night Theme** - Supports both light and dark display modes
- ✅ **响应式设计** - 完美适配手机、平板和电脑 | **Responsive Design** - Perfectly adapts to phones, tablets, and computers
- ✅ **开源可审计** - 代码完全开源，可自行审查 | **Open Source** - Fully auditable source code

---

## 🚀 快速开始 | Quick Start

### 方法一：直接使用（推荐）| Method 1: Direct Use (Recommended)

1. 下载 `hubble-mnemonic-generator2.0.html` 文件 | Download `hubble-mnemonic-generator2.0.html`
2. 直接在浏览器中打开（双击文件即可）| Open directly in browser (double-click the file)
3. 内置词表会自动加载，无需任何配置 | Built-in wordlist loads automatically, no configuration needed
4. 点击"生成助记词"即可开始使用 | Click "Generate Mnemonic" to start

**注意**：由于内置了完整的 BIP39 词表，即使使用 `file://` 协议打开，也能正常工作。 | **Note**: With built-in BIP39 wordlist, it works even when opened via `file://` protocol.

### 方法二：使用 Web 服务器运行 | Method 2: Run with Web Server

如果您希望使用外部 `english.txt` 文件（覆盖内置词表）： | If you want to use an external `english.txt` file (overrides built-in wordlist):

1. 将 `hubble-mnemonic-generator2.0.html` 和 `english.txt` 放在同一目录 | Place `hubble-mnemonic-generator2.0.html` and `english.txt` in the same directory
2. 在该目录打开终端/命令行，运行：| Open terminal/command line in that directory and run:

```bash
# Python 3
python -m http.server 8000

# 或 Python 2 | or Python 2
python -m SimpleHTTPServer 8000

# 或 Node.js | or Node.js
npx http-server -p 8000
```

3. 在浏览器中访问 `http://localhost:8000/hubble-mnemonic-generator2.0.html` | Open `http://localhost:8000/hubble-mnemonic-generator2.0.html` in browser

---

## 📖 使用说明 | Usage Guide

### 生成助记词 | Generate Mnemonic

1. **选择助记词长度** | **Choose Mnemonic Length**:
   - 点击"12个单词"或"24个单词"按钮 | Click "12 words" or "24 words" button
   - 12个单词：128位熵，适用于大多数用户 | 12 words: 128-bit entropy, suitable for most users
   - 24个单词：256位熵，更高的安全性 | 24 words: 256-bit entropy, higher security

2. **生成助记词** | **Generate Mnemonic**:
   - 点击"生成助记词"按钮 | Click "Generate Mnemonic" button
   - 系统会使用加密安全随机数生成助记词 | System generates mnemonic using cryptographically secure random
   - 助记词会以醒目的橙色背景卡片形式显示 | Mnemonic displayed as orange background cards

3. **查看比特币地址** | **View Bitcoin Address**:
   - 生成助记词后，页面会自动显示对应的比特币收款地址 | After generating mnemonic, Bitcoin receiving address is automatically displayed
   - 地址格式为 P2WPKH（SegWit/Bech32），以 `bc1` 开头 | Address format is P2WPKH (SegWit/Bech32), starting with `bc1`
   - 点击地址旁的"复制"按钮可以复制地址 | Click "Copy" button next to address to copy it

4. **保存助记词** | **Save Mnemonic**:
   - ⚠️ **重要**：请立即用纸笔抄写助记词并妥善保管 | ⚠️ **Important**: Immediately write down mnemonic on paper and keep it safe
   - 助记词一旦丢失，将无法找回资产 | Once lost, assets cannot be recovered
   - 建议备份多份并存放在不同地点 | Recommend multiple backups in different locations

### 界面功能 | Interface Features

- **主题切换**：点击右上角的太阳/月亮图标切换日/夜模式 | **Theme Toggle**: Click sun/moon icon in top right to switch day/night mode
- **清除内容**：点击"清除"按钮清空当前显示的助记词和地址 | **Clear**: Click "Clear" button to clear displayed mnemonic and address

---

## 🔐 安全特性 | Security Features

### 隐私保护 | Privacy Protection

- ✅ **完全离线**：所有操作在本地完成，不会连接任何服务器 | **Fully Offline**: All operations done locally, no server connections
- ✅ **无数据存储**：助记词和私钥不会保存到本地存储（localStorage）| **No Data Storage**: Mnemonic and private keys not saved to localStorage
- ✅ **无网络传输**：不会向外部服务器发送任何数据 | **No Network Transmission**: No data sent to external servers
- ✅ **主动清零**：敏感数据（私钥、种子）在使用后立即清零 | **Active Zeroing**: Sensitive data (private keys, seeds) cleared immediately after use
- ✅ **无跟踪脚本**：已移除所有外部跟踪和分析脚本 | **No Tracking Scripts**: All external tracking and analytics scripts removed

### 安全措施 | Security Measures

1. **加密安全随机数生成** | **Cryptographically Secure Random Generation**
   - 使用 `crypto.getRandomValues()` API | Uses `crypto.getRandomValues()` API
   - 符合 BIP39 标准要求 | Complies with BIP39 standard requirements
   - 不依赖不安全的 `Math.random()` | Does not rely on insecure `Math.random()`

2. **私钥保护机制** | **Private Key Protection**
   - 所有私钥变量都是函数局部变量 | All private key variables are function-local
   - 私钥在使用后立即清零（`.fill(0)`）| Private keys cleared immediately after use (`.fill(0)`)
   - 即使函数出错，也会清零敏感数据 | Sensitive data cleared even if function errors

3. **错误处理优化** | **Error Handling Optimization**
   - 不输出详细错误信息，避免潜在的信息泄露 | No detailed error output, prevents potential information leakage
   - 错误消息是通用的，不包含敏感数据 | Error messages are generic, contain no sensitive data

### 安全建议 | Security Recommendations

⚠️ **请务必遵循以下安全建议** | ⚠️ **Please follow these security recommendations**:

1. **离线使用** | **Offline Use**:
   - 在完全离线的环境中使用本工具 | Use this tool in a fully offline environment
   - 生成助记词前，建议断开网络连接 | Disconnect network before generating mnemonic

2. **环境安全** | **Environment Security**:
   - 使用前关闭浏览器开发者工具 | Close browser developer tools before use
   - 禁用可疑的浏览器扩展 | Disable suspicious browser extensions
   - 建议在隐私模式（无痕模式）中使用 | Recommend using privacy/incognito mode

3. **及时清理** | **Timely Cleanup**:
   - 使用完毕后点击"清除"按钮 | Click "Clear" button after use
   - 关闭浏览器标签页 | Close browser tab
   - 如果可能，清除浏览器缓存 | Clear browser cache if possible

4. **不要截图** | **No Screenshots**:
   - 不要在联网设备上截图包含助记词或地址的页面 | Do not screenshot pages containing mnemonics or addresses on connected devices
   - 不要将助记词存储在任何联网设备上 | Do not store mnemonics on any connected devices

5. **验证词表** | **Verify Wordlist**:
   - 如果使用外部 `english.txt` 文件，请验证其 SHA256 校验值 | If using external `english.txt`, verify its SHA256 checksum
   - 标准 BIP39 词表应包含恰好 2048 个单词 | Standard BIP39 wordlist should contain exactly 2048 words

---

## 📋 技术说明 | Technical Details

### 标准支持 | Standard Support

- **BIP39**：助记词生成标准 | **BIP39**: Mnemonic generation standard
  - 使用 PBKDF2-SHA512，2048 次迭代 | Uses PBKDF2-SHA512, 2048 iterations
  - 支持 12 词（128位熵）和 24 词（256位熵）| Supports 12 words (128-bit entropy) and 24 words (256-bit entropy)

- **BIP32**：分层确定性钱包 | **BIP32**: Hierarchical Deterministic Wallet
  - 实现主密钥和子密钥派生 | Implements master and child key derivation
  - 支持硬化派生和非硬化派生 | Supports hardened and non-hardened derivation

- **BIP84**：Native SegWit 层次结构 | **BIP84**: Native SegWit Hierarchical Structure
  - 使用标准派生路径 `m/84'/0'/0'/0/0` | Uses standard derivation path `m/84'/0'/0'/0/0`
  - 专门用于 Native SegWit (P2WPKH) 地址 | Specifically for Native SegWit (P2WPKH) addresses
  - 兼容主流比特币钱包 | Compatible with mainstream Bitcoin wallets

- **BIP173**：Bech32 编码 | **BIP173**: Bech32 Encoding
  - 实现完整的 Bech32 编码算法 | Implements complete Bech32 encoding algorithm
  - 生成 P2WPKH（SegWit）地址 | Generates P2WPKH (SegWit) addresses

### 加密算法 | Cryptographic Algorithms

- **SHA-256**：用于熵校验和计算 | Used for entropy checksum calculation
- **SHA-512**：用于 PBKDF2 密钥派生 | Used for PBKDF2 key derivation
- **HMAC-SHA512**：用于 BIP32 密钥派生 | Used for BIP32 key derivation
- **RIPEMD160**：用于公钥哈希计算 | Used for public key hash calculation
- **secp256k1**：椭圆曲线加密 | Elliptic curve cryptography
  - 完整实现椭圆曲线点运算 | Complete implementation of elliptic curve point operations
  - 支持未压缩和压缩公钥格式 | Supports uncompressed and compressed public key formats

### 地址格式 | Address Format

生成的比特币地址格式为 **P2WPKH（Pay-to-Witness-Public-Key-Hash）**： | Generated Bitcoin addresses use **P2WPKH (Pay-to-Witness-Public-Key-Hash)** format:

- **格式**：SegWit/Bech32 | **Format**: SegWit/Bech32
- **前缀**：`bc1`（主网）| **Prefix**: `bc1` (mainnet)
- **优点**：| **Advantages**:
  - 交易手续费更低 | Lower transaction fees
  - 更安全的隔离见证（SegWit）| More secure Segregated Witness (SegWit)
  - 兼容主流钱包（Electrum、Ledger、Trezor 等）| Compatible with mainstream wallets (Electrum, Ledger, Trezor, etc.)

### 浏览器兼容性 | Browser Compatibility

- ✅ Chrome/Edge（推荐）| Chrome/Edge (Recommended)
- ✅ Firefox
- ✅ Safari
- ✅ Opera
- ✅ 移动端浏览器 | Mobile browsers

**要求**：支持 Web Crypto API 的现代浏览器 | **Requirement**: Modern browser with Web Crypto API support

---

## 🛠️ 故障排除 | Troubleshooting

### 问题：页面提示"默认词表加载失败" | Issue: "Default wordlist loading failed"

**原因** | **Cause**:
- 旧版本需要外部 `english.txt` 文件 | Old version required external `english.txt` file
- 使用 `file://` 协议时，浏览器 CORS 限制 | Browser CORS restrictions when using `file://` protocol

**解决方案** | **Solution**:
- ✅ **新版本已内置词表，无需外部文件** | ✅ **New version has built-in wordlist, no external file needed**
- 如果仍需要外部文件，请使用 Web 服务器运行（见方法二）| If external file still needed, use web server (see Method 2)
- 或手动上传 `english.txt` 文件 | Or manually upload `english.txt` file

### 问题：生成的地址无法使用 | Issue: Generated address cannot be used

**检查** | **Check**:
- 确认地址格式为 `bc1` 开头（P2WPKH）| Confirm address format starts with `bc1` (P2WPKH)
- 确认使用的钱包支持 SegWit 地址 | Confirm wallet supports SegWit addresses
- 尝试使用 Electrum、BlueWallet 等支持 SegWit 的钱包 | Try wallets supporting SegWit like Electrum, BlueWallet

### 问题：助记词无法导入钱包 | Issue: Mnemonic cannot be imported to wallet

**检查** | **Check**:
- 确认助记词是完整的 12 或 24 个单词 | Confirm mnemonic is complete 12 or 24 words
- 确认单词拼写正确 | Confirm words are spelled correctly
- 确认使用标准 BIP39 词表 | Confirm using standard BIP39 wordlist
- 某些钱包可能不支持 24 词助记词 | Some wallets may not support 24-word mnemonics

---

## 📝 更新日志 | Changelog

### 最新版本特性 | Latest Version Features

- ✅ **内置 BIP39 词表**：无需外部文件即可使用 | **Built-in BIP39 Wordlist**: No external file needed
- ✅ **P2WPKH 地址生成**：自动生成 SegWit/Bech32 格式地址 | **P2WPKH Address Generation**: Automatically generates SegWit/Bech32 addresses
- ✅ **私钥安全保护**：实施主动清零机制 | **Private Key Protection**: Active zeroing mechanism implemented
- ✅ **错误处理优化**：避免信息泄露 | **Error Handling Optimization**: Prevents information leakage
- ✅ **日/夜主题切换**：支持主题切换和系统偏好 | **Day/Night Theme**: Supports theme toggle and system preferences
- ✅ **响应式设计**：完美适配各种设备 | **Responsive Design**: Perfect adaptation to various devices

---

## 📄 原始出处 | Original Source

本工具的原始版本来自：**https://bip39.btchao.com/** | Original version from: **https://bip39.btchao.com/**

本项目基于原版进行了大量改进和优化，包括： | This project includes extensive improvements and optimizations:

- 内置 BIP39 标准英文词表 | Built-in BIP39 standard English wordlist
- 优化界面和字体显示 | Optimized interface and font display
- 改进加载逻辑和错误处理 | Improved loading logic and error handling
- 实现完整的比特币地址生成 | Complete Bitcoin address generation implementation
- 增强安全保护机制 | Enhanced security protection mechanisms
- 添加日/夜主题切换 | Added day/night theme toggle
- 优化响应式布局 | Optimized responsive layout

---

## ⚖️ 免责声明 | Disclaimer

- 本工具仅供学习和研究使用 | This tool is for educational and research purposes only
- 使用者需自行承担使用本工具的风险 | Users are responsible for risks when using this tool
- 开发者不对任何资产损失承担责任 | Developers are not liable for any asset losses
- 请妥善保管助记词，丢失将无法找回 | Keep mnemonic safe, loss cannot be recovered

---

## 📚 相关资源 | Resources

- [BIP39 标准文档](https://github.com/bitcoin/bips/blob/master/bip-0039.mediawiki) | [BIP39 Standard](https://github.com/bitcoin/bips/blob/master/bip-0039.mediawiki)
- [BIP32 标准文档](https://github.com/bitcoin/bips/blob/master/bip-0032.mediawiki) | [BIP32 Standard](https://github.com/bitcoin/bips/blob/master/bip-0032.mediawiki)
- [BIP84 标准文档](https://github.com/bitcoin/bips/blob/master/bip-0084.mediawiki) | [BIP84 Standard](https://github.com/bitcoin/bips/blob/master/bip-0084.mediawiki)
- [BIP173 (Bech32) 标准文档](https://github.com/bitcoin/bips/blob/master/bip-0173.mediawiki) | [BIP173 (Bech32) Standard](https://github.com/bitcoin/bips/blob/master/bip-0173.mediawiki)

---

## 🔍 安全审计 | Security Audit

详细的安全审计报告请查看： | Detailed security audit reports:

- `SECURITY_AUDIT.md` - 通用安全审计 | General Security Audit
- `PRIVATE_KEY_SECURITY_AUDIT.md` - 私钥泄露专项审计 | Private Key Leakage Audit

---

## 📧 反馈 | Feedback

如有问题或建议，请通过 GitHub Issues 反馈。 | For issues or suggestions, please submit via GitHub Issues.

---

**⚠️ 重要提醒** | **⚠️ Important Reminder**

本工具完全离线运行，但请确保在安全的环境中使用。助记词一旦泄露或丢失，可能导致资产损失。请妥善保管您的助记词！ | This tool runs completely offline, but please ensure you use it in a secure environment. If your mnemonic is leaked or lost, it may result in asset loss. Please keep your mnemonic safe!
