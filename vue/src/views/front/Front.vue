<template>
  <div>
<!--    头部-->
    <div style="display: flex; align-items: center; height: 80px; border-bottom: 1px solid #eee">
      <div style="width: 300px; display: flex; align-items: center; padding-left: 30px">
        <div style="width: 90px">
          <img
              src="../../assets/World_Herta_Space_Station.webp"
              alt="黑塔空间站"
              style="width: 80px; height: 70px; object-fit: contain"
          >
        </div>
        <div style="font-size: 20px; font-weight: 500; color: #333">
          黑塔空间站
        </div>
      </div>
      <div style="flex: 1">


        <el-menu :default-active="'1'" class="el-menu-demo" mode="horizontal" router>
          <el-menu-item index="/front/home">首页</el-menu-item>
          <el-menu-item index="/front/article">空间站论坛</el-menu-item>

        </el-menu>
      </div>
      <div style="width: 200px">
        <div v-if="!user.username" style="text-align: right; padding-right: 30px">
          <el-button @click="$router.push('/login')">登录</el-button>
          <el-button @click="$router.push('/register')">注册</el-button>
        </div>
        <div v-else>
          <el-dropdown style="width: 150px; cursor: pointer; text-align: right">
            <div style="display: inline-block">
              <img :src="user.avatarUrl" alt=""
                   style="width: 30px; border-radius: 50%; position: relative; top: 10px; right: 5px">
              <span>{{ user.nickname }}</span><i class="el-icon-arrow-down" style="margin-left: 5px"></i>
            </div>
            <el-dropdown-menu slot="dropdown" style="width: 100px; text-align: center">
              <el-dropdown-item style="font-size: 14px; padding: 5px 0">
                <router-link to="/front/password">修改密码</router-link>
              </el-dropdown-item>
              <el-dropdown-item style="font-size: 14px; padding: 5px 0">
                <router-link to="/front/person">个人信息</router-link>
              </el-dropdown-item>
              <el-dropdown-item style="font-size: 14px; padding: 5px 0">
                <span style="text-decoration: none" @click="logout">退出</span>
              </el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
        </div>
      </div>
    </div>

    <div style="width: 1000px; margin: 0 auto">
      <router-view />
    </div>
  </div>
</template>

<script>
export default {
  name: "Front",
  data() {
    return {
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {}
    }
  },
  created() {

  },
  methods: {
    logout() {
      this.$store.commit("logout")
      this.$message.success("退出成功")
    }
  }
}
</script>

<style scoped>
/* 页面整体样式 */
.front-container {
  min-height: 100vh;
  background: linear-gradient(135deg, #f5f7fa 0%, #ffffff 100%);
}

/* 顶部导航样式 */
.header {
  background: rgba(255, 255, 255, 0.95);
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  backdrop-filter: blur(10px);
  transition: all 0.3s ease;
}

/* Logo区域 */
.logo-section {
  transition: all 0.3s ease;
}

.logo-section:hover {
  transform: translateX(5px);
}

.logo-image {
  transition: all 0.3s ease;
}

.logo-image:hover {
  transform: scale(1.05);
}

/* 导航菜单 */
/deep/ .el-menu {
  border: none !important;
  background: transparent !important;
}

/deep/ .el-menu-item {
  font-size: 16px;
  color: #333;
  transition: all 0.3s ease !important;
}

/deep/ .el-menu-item:hover {
  background: linear-gradient(135deg, #e6f7ff 0%, #f0f5ff 100%) !important;
  color: #1890ff !important;
  transform: translateY(-2px);
}

/deep/ .el-menu-item.is-active {
  color: #1890ff !important;
  font-weight: bold;
  border-bottom: 2px solid #1890ff !important;
}

/* 按钮样式 */
/deep/ .el-button {
  border-radius: 20px;
  padding: 8px 20px;
  transition: all 0.3s ease;
}

/deep/ .el-button:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}

/* 用户区域 */
.user-section {
  padding-right: 30px;
}

.user-avatar {
  width: 35px;
  height: 35px;
  border-radius: 50%;
  border: 2px solid #fff;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
  transition: all 0.3s ease;
}

.user-avatar:hover {
  transform: scale(1.1);
}

/* 下拉菜单样式 */
/deep/ .el-dropdown-menu {
  border-radius: 8px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  overflow: hidden;
}

/deep/ .el-dropdown-menu__item {
  transition: all 0.3s ease;
  line-height: 35px;
}

/deep/ .el-dropdown-menu__item:hover {
  background: linear-gradient(135deg, #e6f7ff 0%, #f0f5ff 100%);
  color: #1890ff;
  transform: translateX(5px);
}

/* 主内容区域 */
.main-content {
  width: 1000px;
  margin: 20px auto;
  padding: 20px;
  background: rgba(255, 255, 255, 0.8);
  border-radius: 12px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
  transition: all 0.3s ease;
}

.main-content:hover {
  transform: translateY(-5px);
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
}

/* 动画效果 */
@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(-20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.router-view-container {
  animation: fadeIn 0.3s ease-out;
}
</style>