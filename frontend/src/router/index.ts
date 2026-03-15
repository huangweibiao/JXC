import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router'

const routes: Array<RouteRecordRaw> = [
  {
    path: '/',
    name: 'Dashboard',
    component: () => import('@/views/Dashboard.vue'),
    meta: { title: '首页' }
  },
  {
    path: '/purchase',
    name: 'Purchase',
    component: () => import('@/views/purchase/Index.vue'),
    meta: { title: '采购管理' },
    children: [
      {
        path: 'orders',
        name: 'PurchaseOrders',
        component: () => import('@/views/purchase/Orders.vue'),
        meta: { title: '采购订单' }
      }
    ]
  },
  {
    path: '/sales',
    name: 'Sales',
    component: () => import('@/views/sales/Index.vue'),
    meta: { title: '销售管理' },
    children: [
      {
        path: 'orders',
        name: 'SalesOrders',
        component: () => import('@/views/sales/Orders.vue'),
        meta: { title: '销售订单' }
      }
    ]
  },
  {
    path: '/inventory',
    name: 'Inventory',
    component: () => import('@/views/inventory/Index.vue'),
    meta: { title: '库存管理' },
    children: [
      {
        path: 'list',
        name: 'InventoryList',
        component: () => import('@/views/inventory/List.vue'),
        meta: { title: '库存查询' }
      }
    ]
  },
  {
    path: '/products',
    name: 'Products',
    component: () => import('@/views/products/Index.vue'),
    meta: { title: '商品管理' },
    children: [
      {
        path: 'list',
        name: 'ProductList',
        component: () => import('@/views/products/List.vue'),
        meta: { title: '商品列表' }
      }
    ]
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

// 路由守卫
router.beforeEach((to, from, next) => {
  // 设置页面标题
  document.title = to.meta.title ? `${to.meta.title} - JXC进销存系统` : 'JXC进销存系统'
  next()
})

export default router
