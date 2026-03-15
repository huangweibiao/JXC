# JXC前端项目

## 技术栈

- Vue 3 + TypeScript + Vite
- Element Plus UI组件库
- Vue Router 路由
- Pinia 状态管理
- Axios HTTP请求

## 开发

```bash
# 安装依赖
npm install

# 启动开发服务器
npm run dev

# 构建生产版本
npm run build
```

## 项目结构

```
src/
├── api/          # API接口
├── assets/       # 静态资源
├── components/   # 公共组件
├── router/       # 路由配置
├── stores/       # 状态管理
├── utils/        # 工具函数
├── views/        # 页面视图
├── App.vue       # 根组件
└── main.ts       # 入口文件
```

## 开发说明

### 环境变量

在`.env.development`和`.env.production`中配置环境变量

### API请求

所有API请求都通过`@/utils/request.ts`进行封装，支持请求/响应拦截

### 路由

路由配置在`@/router/index.ts`中，支持路由守卫

## 构建部署

构建后的文件将输出到`../src/main/resources/static/vue`目录，直接集成到Spring Boot项目中

```bash
npm run build
```

## 注意事项

1. 本项目与Spring Boot后端不分离，开发时使用代理访问后端API
2. 构建后的Vue应用集成到Spring Boot的静态资源目录
3. 使用Thymeleaf进行服务端渲染，Vue组件作为SPA补充
