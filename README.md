# Hubble Mnemonic Generator 2.0

## Overview

Hubble Mnemonic Generator 2.0 is a fully static, offline-ready HTML application for creating BIP39 mnemonics and deriving the first P2WPKH (BIP84) receiving address. All cryptographic primitives (PBKDF2, HMAC-SHA512, SHA-256, RIPEMD-160, secp256k1 operations, Bech32 encoding) are bundled inside the page, so no external scripts or network access are required at runtime.

> Original project reference: https://bip39.btchao.com/

### Key Features

- Generates 12-word or 24-word English BIP39 mnemonics using `crypto.getRandomValues`.
- Derives the first BIP84 account/address (`m/84'/0'/0'/0/0`) completely on the client without contacting any network resource.
- Bundles the official 2048-word English wordlist; optionally accepts a local `english.txt` file for verification or replacement.
- Clears entropy, seeds, and private keys from memory immediately after use.
- Provides regression self-checks against reference vectors to guard against implementation drift.

## Getting Started

1. **Clone or download** this repository and keep it on an air-gapped or trusted machine.
2. **Serve the HTML** through a local HTTPS-capable server when possible. Some browsers restrict WebCrypto APIs (`crypto.subtle`) when loading `file://` URLs. Recommended options:
   - `npx serve` (Node.js), `python -m http.server --bind 127.0.0.1 8443` (with TLS), or any static server with HTTPS support.
   - If HTTPS is not feasible, test your target browser: Chromium-based browsers usually allow WebCrypto via `file://`, while Firefox may not.
3. Open `hubble-mnemonic-generator2.0.html` from the local server. Confirm that the address bar indicates the local origin you expect.
4. Choose **12 words** or **24 words**, click **Generate**, and wait for the mnemonic and primary Bech32 address to appear.
5. If desired, import a custom English wordlist via the file input (required to contain exactly 2048 newline-separated words). The UI will display the SHA-256 fingerprint for auditing.

## Operational Security Checklist

- **Stay offline:** Disconnect the machine from any networks before generating mnemonics. Avoid reconnecting until the mnemonic and derived addresses are securely stored and wiped from the device.
- **Use clean hardware:** Prefer a dedicated, malware-free machine or a trusted Live OS environment.
- **Verify entropy source:** The page relies on `crypto.getRandomValues`. If the browser lacks secure randomness support, generation will fail; do not attempt fallback RNGs.
- **Verify outputs:** Even though the page performs built-in sanity checks, always cross-check both mnemonic and derived address with at least one additional trusted offline wallet or hardware wallet before depositing funds.
- **Secure backups:** Record the mnemonic on durable media (preferably offline/physical). Do not store in cloud services, screenshots, or synced notes.
- **Clear session traces:** After use, close the page, clear clipboard history if you copied addresses, and power-cycle the machine if feasible.

## Address Verification Workflow

1. Generate the mnemonic and note the displayed Bech32 address.
2. Import the mnemonic into a **separate** air-gapped wallet implementation (e.g., Sparrow, Electrum with BIP84, or hardware wallet recovery mode) without network access.
3. Derive the same account path (`m/84'/0'/0'/0/0`) and confirm the resulting address matches the one produced by this tool.
4. Only after a successful match should you consider sending test funds, followed by the intended amount.

## Troubleshooting

| Symptom | Likely Cause | Recommended Action |
| --- | --- | --- |
| “Address generation failed” | WebCrypto unavailable or blocked | Serve via HTTPS or switch to a browser that allows `crypto.subtle` in your environment. |
| “english.txt line count is not 2048” | Custom wordlist is malformed | Validate the file format; use newline-separated lowercase words (one per line). |
| Clipboard copy fails | Clipboard API restricted | Use the automatic fallback or manually copy the text. |

## Disclaimer

This project is provided **“as is”** without any warranty. The maintainers and contributors shall not be liable for any loss of funds, data corruption, or damages arising from the use or inability to use this tool. By using this software, you accept full responsibility for verifying all outputs, securing your mnemonic, and ensuring the operational integrity of your environment.

---

# Hubble 助记词生成器 2.0

## 简介

Hubble 助记词生成器 2.0 是一个纯静态、可完全离线运行的 HTML 应用，用于生成 BIP39 英文助记词并推导首个 P2WPKH（BIP84）收款地址。所有密码学算法（PBKDF2、HMAC-SHA512、SHA-256、RIPEMD-160、secp256k1 运算、Bech32 编码）均内置于页面，运行时无需依赖任何外部脚本或网络资源。

> 原始项目参考： https://bip39.btchao.com/

### 核心特性

- 使用浏览器的 `crypto.getRandomValues` 生成 12 词或 24 词 BIP39 英文助记词。
- 完全在本地推导首个 BIP84 收款地址（路径 `m/84'/0'/0'/0/0`），不会访问网络。
- 内嵌官方 2048 词英文词表，支持手动导入本地 `english.txt` 进行校验或替换。
- 在使用后立即对熵、种子、私钥执行 `.fill(0)` 清零。
- 内建回归向量自检，防止实现偏差。

## 快速上手

1. **克隆或下载** 本仓库，将其保存于隔离或可信的设备。
2. **通过本地服务器访问**：某些浏览器在 `file://` 场景下禁用 `crypto.subtle`，建议使用支持 HTTPS 的本地静态服务器：
   - 例如 `npx serve`、`python -m http.server --bind 127.0.0.1 8443`（需配置 TLS）等。
   - 若无法启用 HTTPS，可先在目标浏览器测试功能：Chromium 内核一般允许在 `file://` 下使用 WebCrypto，Firefox 则可能不可用。
3. 打开 `hubble-mnemonic-generator2.0.html`，确认地址栏指向预期的本地来源。
4. 选择 **12 词** 或 **24 词**，点击 **生成**，等待助记词与首个 Bech32 地址显示。
5. 如需使用自定义词表，可通过文件选择器导入仅包含 2048 个换行分隔单词的 `english.txt`。界面会显示 SHA-256 指纹以便审计。

## 操作安全清单

- **保持离线：** 生成助记词前彻底断网，直至助记词与地址安全存储并清除后再考虑联网。
- **可信硬件：** 建议使用干净的专用设备或可信的 Live OS 环境。
- **确认随机源：** 若浏览器不支持安全随机数接口，程序会直接报错，请勿尝试非安全 RNG。
- **核对结果：** 虽然页面包含自检逻辑，仍需使用额外可信离线钱包或硬件钱包对助记词和地址进行复核，确认一致后方可收款。
- **安全备份：** 将助记词记录在可靠的离线介质上，不要使用云端、截图或同步笔记。
- **清理痕迹：** 使用完毕后关闭页面、清除剪贴板记录（如有复制操作），必要时断电重启。

## 地址验证流程

1. 生成助记词并记录页面显示的 Bech32 地址。
2. 在 **另一套** 离线钱包（如 Sparrow、支持 BIP84 的 Electrum、硬件钱包恢复模式等）中导入同一助记词，务必保持离线。
3. 按 `m/84'/0'/0'/0/0` 路径推导地址，并确认结果与本工具输出完全一致。
4. 仅在核对无误后，先测试小额，再转入正式资金。

## 常见问题

| 现象 | 可能原因 | 解决建议 |
| --- | --- | --- |
| “地址生成失败” | WebCrypto 不可用或被拦截 | 通过本地 HTTPS 访问，或换用支持该接口的浏览器。 |
| “english.txt 行数不是 2048” | 自定义词表格式错误 | 确认文件为 2048 个小写单词，每行一个。 |
| 无法复制地址 | 剪贴板 API 受限 | 使用内置降级方案，或手动选择复制。 |

## 免责声明

本项目按 **“现状”** 提供，维护者与贡献者不对因使用或无法使用该工具造成的任何资金损失、数据损坏或其他损害承担责任。使用本软件即表示您完全同意自行验证所有输出、妥善保管助记词，并确保操作环境的安全可靠。

