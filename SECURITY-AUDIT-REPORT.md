# 比特币助记词生成工具 - 安全审核报告

**审核日期**: 2025-11-20
**审核工具**: Claude Code (Sonnet 4.5)
**文件名**: Bitcoin-Mnemonic-Offline-Generation-Tool.html

---

## 📋 执行摘要

本工具是一个离线比特币助记词生成器，实现了 BIP39、BIP32、BIP84 等标准。经过全面审核，发现**主要安全问题在于外部资源加载风险**，核心密码学实现基本符合标准，但存在隐私泄露隐患。

### 总体评分
- **密码学安全性**: ⭐⭐⭐⭐☆ (4/5)
- **隐私保护**: ⭐⭐☆☆☆ (2/5)
- **离线能力**: ⭐⭐⭐☆☆ (3/5)
- **代码质量**: ⭐⭐⭐⭐☆ (4/5)

---

## ✅ 安全优点

### 1. 加密安全的随机数生成 ✅
```javascript
// 使用浏览器原生加密安全随机数生成器
function generateEntropy(bytes) {
  const arr = new Uint8Array(bytes);
  cryptoObj.getRandomValues(arr);  // ✅ 使用 crypto.getRandomValues
  return arr;
}
```
- 使用 `crypto.getRandomValues()` 生成熵，这是加密安全的
- 正确验证熵不为全0
- 生成后清零敏感数据 `entropy.fill(0)`

### 2. 标准密码学实现 ✅
- **BIP39**: 完整实现助记词生成和验证
- **BIP32**: HD钱包派生路径实现
- **BIP84**: SegWit (P2WPKH) 地址生成
- **密码学算法**:
  - SHA-256 (带原生API和备用实现)
  - RIPEMD-160 (完整实现)
  - PBKDF2-HMAC-SHA512
  - secp256k1 椭圆曲线运算
  - Bech32 编码

### 3. 内置词表 ✅
- 包含完整的 BIP39 标准英文词表 (2048个单词)
- 可完全离线使用
- 显示 SHA256 校验值：`187db04a869dd9bc7be80d21a86497d692c0db6abd3aa8cb6be5d618ff757fae`

### 4. 代码透明性 ✅
- 所有密码学算法都是明文实现
- 无混淆，可审计
- 包含单元测试

---

## ⚠️ 安全问题与风险

### 🔴 **严重问题**

#### 1. 外部字体加载 - 隐私泄露风险
**问题描述**:
```html
<!-- 原始代码第7行 -->
<style type="text/css">
@font-face {
  font-family:Inter;
  src:url(/cf-fonts/v/inter/5.0.16/latin/wght/normal.woff2);
  /* ...大量外部字体引用... */
}
</style>
```

**风险**:
- ❌ 访问 `/cf-fonts/` 路径会发送网络请求
- ❌ 泄露用户 IP 地址
- ❌ 泄露使用时间戳
- ❌ 可能被用于用户追踪
- ❌ 违背"离线使用"承诺

**影响**: 🔴 **高危** - 即使用户认为在离线使用，浏览器仍可能尝试加载外部资源

#### 2. 外部链接
**问题**:
```html
原始出处：<a href="https://bip39.btchao.com/" target="_blank">...</a>
```

**风险**:
- ❌ 用户点击会暴露访问记录
- ❌ 可能被第三方监控

**影响**: 🟡 **中危** - 需要用户主动点击

### 🟡 **中等问题**

#### 3. 缺少 Content Security Policy (CSP)
**问题**: 没有 CSP 策略限制资源加载

**风险**:
- 浏览器可能加载未预期的外部资源
- 缺少额外的安全防护层

#### 4. fetch() 调用
```javascript
// 尝试加载本地 english.txt
const resp = await fetch(path);
```

**风险**:
- 可能触发网络请求（如果文件不存在）
- 虽然是加载本地文件，但仍有风险

### 🟢 **轻微问题**

#### 5. 调试信息输出
```javascript
console.error("生成比特币地址失败:", errorMsg);
console.log('单元测试已加载！');
```

**风险**:
- 可能在浏览器控制台泄露敏感信息
- 生产环境应最小化输出

#### 6. 缺少完整性检查
- 内置词表没有在运行时验证 SHA256
- 仅显示但不强制验证

---

## 🛠️ 修复方案

### 已实施的修复 ✅

我已创建安全加固版本：`Bitcoin-Mnemonic-Offline-Generation-Tool-SECURE.html`

#### 修复内容：

1. **✅ 移除所有外部字体引用**
   ```html
   <!-- 替换为 -->
   <!-- 外部字体已移除以确保离线安全 -->
   ```

   ```css
   /* 所有 font-family 改为系统字体 */
   font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
   ```

2. **✅ 添加严格的 CSP 策略**
   ```html
   <meta http-equiv="Content-Security-Policy"
         content="default-src 'none';
                  script-src 'unsafe-inline';
                  style-src 'unsafe-inline';
                  img-src data:;">
   ```

3. **✅ 禁用外部链接**
   ```html
   <a href="#"
      onclick="alert('警告：外部链接已禁用以确保安全'); return false;"
      style="color: #999; text-decoration: line-through;">
   ```

4. **✅ 添加安全使用提醒**
   - 在HTML顶部添加详细的安全说明注释
   - 提醒用户完全离线使用
   - 警告不要截图或拍照

### 文件对比

| 特性 | 原始版本 | 安全版本 |
|------|---------|---------|
| 外部字体 | ❌ 30+ 个外部引用 | ✅ 已移除，使用系统字体 |
| CSP 策略 | ❌ 无 | ✅ 严格策略 |
| 外部链接 | ❌ 可点击 | ✅ 已禁用 |
| 安全说明 | ⚠️ 简单 | ✅ 详细 |

---

## 📊 密码学实现审核

### 随机数生成 ✅
```javascript
// Bitcoin-Mnemonic-Offline-Generation-Tool.html:2189
function generateEntropy(bytes) {
  const arr = new Uint8Array(bytes);
  cryptoObj.getRandomValues(arr);  // ✅ 正确
  return arr;
}
```
**评估**: ✅ **安全** - 使用加密安全的随机数生成器

### BIP39 实现 ✅
```javascript
// Bitcoin-Mnemonic-Offline-Generation-Tool.html:2142
async function entropyToMnemonic(entropy, wordlist) {
  const ENT = entropy.length * 8;
  const checksumLen = ENT / 32;  // ✅ 正确的校验和长度
  const hash = await sha256Bytes(entropy);
  const checksumBits = bytesToBits(hash.slice(0, 1)).slice(0, checksumLen);
  // ... ✅ 标准实现
}
```
**评估**: ✅ **符合标准** - 正确实现 BIP39 规范

### SHA-256 实现 ✅
- 优先使用浏览器原生 `crypto.subtle.digest`
- 提供备用的纯 JavaScript 实现
- **评估**: ✅ **安全可靠**

### PBKDF2-HMAC-SHA512 ✅
```javascript
// Bitcoin-Mnemonic-Offline-Generation-Tool.html:2240
await pbkdf2HmacSha512(mnemonicBytes, saltBytes, 2048, 64);
```
**评估**: ✅ **正确** - 2048 次迭代符合 BIP39 标准

### secp256k1 椭圆曲线 ✅
- 完整的点加法、倍点运算实现
- 模运算正确
- **评估**: ✅ **实现正确**，但建议对复杂场景增加测试

### Bech32 编码 ✅
- 符合 BIP173 标准
- **评估**: ✅ **正确实现**

---

## 🎯 使用建议

### 对于普通用户

#### ⚠️ **强烈建议使用安全加固版**
使用文件：`Bitcoin-Mnemonic-Offline-Generation-Tool-SECURE.html`

#### 安全使用步骤：

1. **完全断网**
   - 关闭 Wi-Fi
   - 拔掉网线
   - 开启飞行模式

2. **清理环境**
   - 使用全新浏览器会话（隐私模式）
   - 清除所有缓存和 Cookie

3. **生成助记词**
   - 打开安全版本的 HTML 文件
   - 生成 12 或 24 个单词的助记词
   - **手抄**到纸上（不要截图！）

4. **验证**
   - 可以用其他钱包验证生成的地址
   - 建议先用小额测试

5. **清理**
   - 关闭浏览器
   - 清除所有历史记录
   - 重启计算机（可选，更安全）

### 对于开发者

#### 进一步改进建议：

1. **添加词表完整性验证**
   ```javascript
   // 建议添加
   const expectedHash = "187db04a869dd9bc7be80d21a86497d692c0db6abd3aa8cb6be5d618ff757fae";
   const actualHash = await sha256(wordlistText);
   if (actualHash !== expectedHash) {
     throw new Error("词表校验失败！可能被篡改！");
   }
   ```

2. **移除所有 console 输出**
   - 生产环境应禁用所有调试输出
   - 或使用条件编译

3. **添加熵质量检测**
   ```javascript
   // 检测熵的随机性
   function checkEntropyQuality(entropy) {
     // 检测连续相同字节
     // 检测位分布均匀性
   }
   ```

4. **添加更多测试向量**
   - 使用 BIP39 官方测试向量
   - 增加边界情况测试

5. **考虑使用 Subresource Integrity (SRI)**
   - 如果必须加载外部资源，使用 SRI 验证

---

## 📝 总结

### 核心发现
- ✅ **密码学实现基本正确**，符合 BIP39/32/84 标准
- ❌ **存在隐私泄露风险**，主要来自外部字体加载
- ⚠️ **需要改进**离线使用的完整性

### 推荐使用方案
1. **优先使用**：`Bitcoin-Mnemonic-Offline-Generation-Tool-SECURE.html`（安全加固版）
2. **使用场景**：完全离线环境
3. **安全等级**：适合个人使用，不建议管理大额资产

### 风险声明
- 任何软件钱包工具都存在风险
- 建议大额资产使用硬件钱包
- 助记词一旦泄露，资产将无法找回
- 请务必多重备份，妥善保管

---

## 🔗 参考资料

- [BIP39 规范](https://github.com/bitcoin/bips/blob/master/bip-0039.mediawiki)
- [BIP32 规范](https://github.com/bitcoin/bips/blob/master/bip-0032.mediawiki)
- [BIP84 规范](https://github.com/bitcoin/bips/blob/master/bip-0084.mediawiki)
- [BIP173 (Bech32)](https://github.com/bitcoin/bips/blob/master/bip-0173.mediawiki)

---

**报告结束**

*本报告仅供参考，使用任何加密货币工具都需自行承担风险。*
