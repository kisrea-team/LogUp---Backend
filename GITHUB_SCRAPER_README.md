# GitHub Releases Scraper 使用说明

## 配置环境变量

在 `.env` 文件中添加以下配置：

```
# 数据库配置
DB_HOST=192.3.164.131
DB_PORT=3306
DB_USER=root
DB_PASSWORD=mysql_Ki48fA
DB_NAME=logup

# 腾讯翻译API配置
TENCENT_SECRET_ID=AKID1ub5VlofJm254qSu8A1iCUdbMvGneKo7
TENCENT_SECRET_KEY=A8wXxAAwY6YoriPsSt8GG4f3EGObieWK
TENCENT_REGION=ap-beijing

# GitHub API Token (可选，用于提高速率限制)
# GITHUB_TOKEN=your_github_personal_access_token
```

## 获取GitHub Token

1. 登录GitHub
2. 进入 Settings > Developer settings > Personal access tokens
3. 点击 "Generate new token"
4. 选择 `public_repo` 权限
5. 生成token并添加到.env文件

## 运行爬虫

```bash
cd backend-repo
python github_scraper.py
```

## 功能说明

1. 自动从GitHub获取指定仓库的releases
2. 将release内容翻译成中文
3. 保存到数据库中
4. 支持增量更新（只会添加新的releases）

## 当前配置的仓库

- https://github.com/vercel/next.js
- https://github.com/facebook/react

## 注意事项

- GitHub API有速率限制（未认证：60次/小时，已认证：5000次/小时）
- 如果遇到403错误，请等待速率限制重置或使用GitHub token
- 翻译API已经配置并测试通过