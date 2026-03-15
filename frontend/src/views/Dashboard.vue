<template>
  <div class="dashboard">
    <el-row :gutter="20" class="stats">
      <el-col :xs="24" :sm="12" :md="6">
        <el-card class="stat-card">
          <div class="stat-label">今日采购额</div>
          <div class="stat-value">¥12,580</div>
          <div class="stat-trend up">
            <el-icon><ArrowUp /></el-icon>
            <span>15.3%</span>
          </div>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="12" :md="6">
        <el-card class="stat-card">
          <div class="stat-label">今日销售额</div>
          <div class="stat-value">¥28,690</div>
          <div class="stat-trend up">
            <el-icon><ArrowUp /></el-icon>
            <span>22.7%</span>
          </div>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="12" :md="6">
        <el-card class="stat-card">
          <div class="stat-label">库存预警</div>
          <div class="stat-value">23</div>
          <div class="stat-trend down">
            <el-icon><ArrowDown /></el-icon>
            <span>5 件</span>
          </div>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="12" :md="6">
        <el-card class="stat-card">
          <div class="stat-label">待处理订单</div>
          <div class="stat-value">8</div>
          <div class="stat-trend">待处理</div>
        </el-card>
      </el-col>
    </el-row>

    <el-row :gutter="20" class="content">
      <el-col :xs="24" :md="16">
        <el-card>
          <template #header>
            <span>最近动态</span>
          </template>
          <el-timeline>
            <el-timeline-item timestamp="10分钟前">
              采购订单 PO20240315001 已审核通过
            </el-timeline-item>
            <el-timeline-item timestamp="30分钟前">
              客户 张三 完成付款 ¥15,000
            </el-timeline-item>
            <el-timeline-item timestamp="1小时前">
              库存预警：商品 iPhone 15 库存低于安全库存
            </el-timeline-item>
          </el-timeline>
        </el-card>
      </el-col>
      <el-col :xs="24" :md="8">
        <el-card>
          <template #header>
            <span>快捷操作</span>
          </template>
          <div class="quick-actions">
            <el-button type="primary" @click="goTo('/purchase/orders/create')">
              创建采购订单
            </el-button>
            <el-button type="success" @click="goTo('/sales/orders/create')">
              创建销售订单
            </el-button>
            <el-button type="info" @click="goTo('/inventory/list')">
              库存查询
            </el-button>
            <el-button type="warning" @click="goTo('/products/create')">
              新增商品
            </el-button>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script setup lang="ts">
import { ArrowUp, ArrowDown } from '@element-plus/icons-vue'
import { useRouter } from 'vue-router'

const router = useRouter()

const goTo = (path: string) => {
  router.push(path)
}
</script>

<style scoped>
.dashboard {
  padding: 20px;
}

.stats {
  margin-bottom: 20px;
}

.stat-card {
  text-align: center;
}

.stat-label {
  color: #909399;
  font-size: 14px;
  margin-bottom: 10px;
}

.stat-value {
  font-size: 28px;
  font-weight: bold;
  color: #303133;
  margin-bottom: 10px;
}

.stat-trend {
  font-size: 14px;
}

.stat-trend.up {
  color: #67c23a;
}

.stat-trend.down {
  color: #f56c6c;
}

.content {
  margin-top: 20px;
}

.quick-actions {
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.quick-actions .el-button {
  width: 100%;
}
</style>
