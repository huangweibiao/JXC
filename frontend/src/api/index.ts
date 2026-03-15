import request from '@/utils/request'

/**
 * 用户相关接口
 */
export const userApi = {
  // 获取当前用户信息
  getCurrentUser() {
    return request.get<any>('/user/current')
  }
}

/**
 * 商品相关接口
 */
export const productApi = {
  // 获取商品列表
  getList(params: any) {
    return request.get<any>('/products', { params })
  },
  // 获取商品详情
  getDetail(id: number) {
    return request.get<any>(`/products/${id}`)
  },
  // 创建商品
  create(data: any) {
    return request.post<any>('/products', data)
  },
  // 更新商品
  update(id: number, data: any) {
    return request.put<any>(`/products/${id}`, data)
  },
  // 删除商品
  delete(id: number) {
    return request.delete<any>(`/products/${id}`)
  }
}

/**
 * 采购订单相关接口
 */
export const purchaseOrderApi = {
  // 获取采购订单列表
  getList(params: any) {
    return request.get<any>('/purchase/orders', { params })
  },
  // 获取采购订单详情
  getDetail(id: number) {
    return request.get<any>(`/purchase/orders/${id}`)
  },
  // 创建采购订单
  create(data: any) {
    return request.post<any>('/purchase/orders', data)
  },
  // 更新采购订单
  update(id: number, data: any) {
    return request.put<any>(`/purchase/orders/${id}`, data)
  },
  // 删除采购订单
  delete(id: number) {
    return request.delete<any>(`/purchase/orders/${id}`)
  },
  // 审核采购订单
  approve(id: number) {
    return request.post<any>(`/purchase/orders/${id}/approve`)
  }
}

/**
 * 销售订单相关接口
 */
export const salesOrderApi = {
  // 获取销售订单列表
  getList(params: any) {
    return request.get<any>('/sales/orders', { params })
  },
  // 获取销售订单详情
  getDetail(id: number) {
    return request.get<any>(`/sales/orders/${id}`)
  },
  // 创建销售订单
  create(data: any) {
    return request.post<any>('/sales/orders', data)
  },
  // 更新销售订单
  update(id: number, data: any) {
    return request.put<any>(`/sales/orders/${id}`, data)
  },
  // 删除销售订单
  delete(id: number) {
    return request.delete<any>(`/sales/orders/${id}`)
  },
  // 审核销售订单
  approve(id: number) {
    return request.post<any>(`/sales/orders/${id}/approve`)
  }
}

/**
 * 库存相关接口
 */
export const inventoryApi = {
  // 获取库存列表
  getList(params: any) {
    return request.get<any>('/inventory', { params })
  },
  // 获取库存详情
  getDetail(id: number) {
    return request.get<any>(`/inventory/${id}`)
  },
  // 库存盘点
  stocktake(data: any) {
    return request.post<any>('/inventory/stocktake', data)
  }
}

/**
 * 供应商相关接口
 */
export const supplierApi = {
  // 获取供应商列表
  getList(params: any) {
    return request.get<any>('/suppliers', { params })
  },
  // 创建供应商
  create(data: any) {
    return request.post<any>('/suppliers', data)
  },
  // 更新供应商
  update(id: number, data: any) {
    return request.put<any>(`/suppliers/${id}`, data)
  },
  // 删除供应商
  delete(id: number) {
    return request.delete<any>(`/suppliers/${id}`)
  }
}

/**
 * 客户相关接口
 */
export const customerApi = {
  // 获取客户列表
  getList(params: any) {
    return request.get<any>('/customers', { params })
  },
  // 创建客户
  create(data: any) {
    return request.post<any>('/customers', data)
  },
  // 更新客户
  update(id: number, data: any) {
    return request.put<any>(`/customers/${id}`, data)
  },
  // 删除客户
  delete(id: number) {
    return request.delete<any>(`/customers/${id}`)
  }
}
