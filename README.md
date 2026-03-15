# JXC进销存管理系统

## 项目简介

基于Spring Boot 3.5.11 + MySQL 8 + Vue 3 + TypeScript的进销存管理系统，支持OAuth2单点登录，前后端不分离架构。

## 技术栈

### 后端
- Spring Boot 3.5.11
- Spring Security + OAuth2 Client
- MyBatis-Plus 3.5.9
- MySQL 8.0+
- Druid数据源
- JWT令牌认证
- Thymeleaf模板引擎

### 前端
- Vue 3 + TypeScript
- Element Plus UI组件库
- Vite构建工具
- Vue Router路由
- Pinia状态管理
- Axios HTTP请求

## 系统架构

```
┌─────────────────┐      ┌─────────────────┐      ┌─────────────────┐
│   浏览器        │◄────►│  JXC系统        │◄────►│  OAuth2服务端   │
│                 │      │  (OAuth2客户端) │      │  (已有)         │
└─────────────────┘      └─────────────────┘      └─────────────────┘
                                │
                                ▼
                         ┌─────────────────┐
                         │   MySQL 8       │
                         │   (业务数据)    │
                         └─────────────────┘
```

## 核心功能模块

### 1. 系统管理
- 用户管理（支持OAuth2用户同步）
- 部门管理
- 角色权限管理
- 操作日志

### 2. 采购管理
- 采购订单管理
- 采购入库管理
- 采购退货管理
- 供应商管理

### 3. 销售管理
- 销售订单管理
- 销售出库管理
- 销售退货管理
- 客户管理

### 4. 库存管理
- 库存查询
- 库存盘点
- 库存预警
- 库存调拨

### 5. 基础数据
- 商品管理
- 商品分类
- 商品单位
- 品牌管理
- 仓库管理

## 快速开始

### 1. 数据库初始化

```bash
# 创建数据库并导入初始化脚本
mysql -u root -p < sql/jxc_init.sql
```

### 2. 配置修改

修改 `src/main/resources/application.yml` 中的配置：

```yaml
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/jxc_db
    username: root
    password: your_password

  security:
    oauth2:
      client:
        registration:
          jxc-client:
            client-id: your-client-id
            client-secret: your-client-secret
        provider:
          oauth2-server:
            issuer-uri: http://your-oauth2-server
```

### 3. 启动后端

```bash
mvn clean install
mvn spring-boot:run
```

访问地址：http://localhost:8080

默认管理员账号：
- 用户名：admin
- 密码：admin123

### 4. 启动前端（开发模式）

```bash
cd frontend
npm install
npm run dev
```

前端开发服务器地址：http://localhost:5173

### 5. 构建前端

```bash
cd frontend
npm run build
```

构建后的文件将输出到 `src/main/resources/static/vue` 目录，集成到Spring Boot项目中。

## OAuth2单点登录配置

系统已集成Spring Security OAuth2 Client，支持OAuth2单点登录：

1. 配置OAuth2服务端的issuer-uri
2. 配置客户端ID和密钥
3. 配置回调地址
4. 用户首次登录会自动同步到本地数据库

## 项目结构

```
jxc/
├── src/main/java/com/jxc/
│   ├── config/                 # 配置类
│   ├── security/               # 安全模块
│   ├── controller/             # 控制器层
│   ├── service/                # 业务逻辑层
│   ├── mapper/                 # 数据访问层
│   ├── entity/                 # 实体类
│   ├── dto/                    # 数据传输对象
│   ├── common/                 # 公共组件
│   └── JxcApplication.java     # 启动类
├── src/main/resources/
│   ├── templates/              # Thymeleaf模板
│   ├── static/                 # 静态资源
│   └── application.yml         # 配置文件
├── frontend/                   # 前端Vue项目
│   ├── src/
│   │   ├── api/                # API接口
│   │   ├── components/         # 公共组件
│   │   ├── views/              # 页面视图
│   │   ├── router/             # 路由配置
│   │   └── utils/              # 工具函数
│   └── package.json
├── sql/                        # SQL脚本
└── pom.xml                     # Maven配置
```

## 开发规范

### 后端开发
- 使用MyBatis-Plus进行数据访问
- 统一使用Result作为响应格式
- 使用BusinessException抛出业务异常
- Controller仅负责参数校验和路由，业务逻辑在Service层

### 前端开发
- 使用TypeScript开发
- 使用Element Plus UI组件
- API请求统一封装在@/api目录
- 组件按功能模块划分

## 部署说明

### Docker部署

```bash
# 构建镜像
docker build -t jxc-system:latest .

# 运行容器
docker run -d -p 8080:8080 \
  -e MYSQL_HOST=mysql \
  -e MYSQL_DB=jxc_db \
  -e MYSQL_USER=root \
  -e MYSQL_PASSWORD=123456 \
  jxc-system:latest
```

### 传统部署

```bash
# 打包
mvn clean package -DskipTests

# 运行
java -jar target/jxc-system-1.0.0.jar
```

## 常见问题

### OAuth2登录失败

检查以下配置：
1. OAuth2服务端地址是否正确
2. 客户端ID和密钥是否正确
3. 回调地址是否已注册到OAuth2服务端
4. 网络是否畅通

### 数据库连接失败

检查以下配置：
1. MySQL服务是否启动
2. 数据库是否已创建
3. 用户名密码是否正确
4. 网络是否畅通

## 贡献指南

欢迎提交Issue和Pull Request！

## 许可证

MIT License

## 联系方式

- 邮箱：support@jxc.com
- 文档：http://docs.jxc.com

---

© 2024 JXC进销存管理系统
