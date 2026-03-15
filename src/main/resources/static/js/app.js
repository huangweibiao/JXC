// JXC系统前端JavaScript

// 页面加载完成后初始化
document.addEventListener('DOMContentLoaded', function() {
    initNavigation();
    initForms();
    initAjax();
});

// 初始化导航
function initNavigation() {
    const currentPath = window.location.pathname;
    const navLinks = document.querySelectorAll('.nav-menu a');

    navLinks.forEach(link => {
        const linkPath = new URL(link.href).pathname;
        if (currentPath.startsWith(linkPath) && linkPath !== '/') {
            link.classList.add('active');
        }
    });
}

// 初始化表单
function initForms() {
    const forms = document.querySelectorAll('form[data-ajax]');
    forms.forEach(form => {
        form.addEventListener('submit', handleFormSubmit);
    });
}

// 处理表单提交
async function handleFormSubmit(event) {
    event.preventDefault();
    const form = event.target;
    const formData = new FormData(form);
    const data = Object.fromEntries(formData.entries());

    const url = form.action;
    const method = form.method || 'POST';

    try {
        const response = await fetch(url, {
            method: method,
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(data),
        });

        const result = await response.json();

        if (result.code === 200) {
            alert(result.message || '操作成功');
            if (form.dataset.redirect) {
                window.location.href = form.dataset.redirect;
            }
        } else {
            alert(result.message || '操作失败');
        }
    } catch (error) {
        console.error('请求失败:', error);
        alert('网络错误，请稍后重试');
    }
}

// 初始化AJAX请求
function initAjax() {
    // 为所有带有 data-api 属性的元素绑定事件
    const apiElements = document.querySelectorAll('[data-api]');
    apiElements.forEach(element => {
        element.addEventListener('click', handleApiCall);
    });
}

// 处理API调用
async function handleApiCall(event) {
    event.preventDefault();
    const element = event.target;
    const url = element.dataset.api;
    const method = element.dataset.method || 'GET';
    const confirm = element.dataset.confirm;

    if (confirm && !window.confirm(confirm)) {
        return;
    }

    try {
        const response = await fetch(url, {
            method: method,
            headers: {
                'Content-Type': 'application/json',
            },
        });

        const result = await response.json();

        if (result.code === 200) {
            alert(result.message || '操作成功');
            if (element.dataset.refresh) {
                window.location.reload();
            }
        } else {
            alert(result.message || '操作失败');
        }
    } catch (error) {
        console.error('API调用失败:', error);
        alert('网络错误，请稍后重试');
    }
}

// 工具函数：格式化日期
function formatDate(date) {
    if (!date) return '';
    const d = new Date(date);
    const year = d.getFullYear();
    const month = String(d.getMonth() + 1).padStart(2, '0');
    const day = String(d.getDate()).padStart(2, '0');
    return `${year}-${month}-${day}`;
}

// 工具函数：格式化金额
function formatMoney(amount) {
    if (!amount) return '¥0.00';
    return '¥' + parseFloat(amount).toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 工具函数：显示消息提示
function showMessage(message, type = 'info') {
    const toast = document.createElement('div');
    toast.className = `toast toast-${type}`;
    toast.textContent = message;
    document.body.appendChild(toast);

    setTimeout(() => {
        toast.classList.add('show');
    }, 10);

    setTimeout(() => {
        toast.classList.remove('show');
        setTimeout(() => {
            document.body.removeChild(toast);
        }, 300);
    }, 3000);
}

// 导出工具函数
window.JXC = {
    formatDate,
    formatMoney,
    showMessage
};
