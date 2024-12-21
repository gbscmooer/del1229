<template>
  <div class="header-container">
    <div class="header-left">
      <span :class="collapseBtnClass" class="collapse-btn" @click="collapse"></span>
      <el-breadcrumb separator="/" class="breadcrumb">
        <el-breadcrumb-item :to="'/'">首页</el-breadcrumb-item>
        <el-breadcrumb-item>{{ currentPathName }}</el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <el-dropdown class="user-dropdown">
      <div class="avatar-container">
        <img :src="user.avatarUrl" alt="" class="avatar">
        <span class="nickname">{{ user.nickname }}</span>
        <i class="el-icon-arrow-down"></i>
      </div>
      <el-dropdown-menu slot="dropdown" class="dropdown-menu">
        <el-dropdown-item>
          <router-link to="/password">修改密码</router-link>
        </el-dropdown-item>
        <el-dropdown-item>
          <router-link to="/person">个人信息</router-link>
        </el-dropdown-item>
        <el-dropdown-item>
          <span @click="logout">退出</span>
        </el-dropdown-item>
      </el-dropdown-menu>
    </el-dropdown>
  </div>
</template>

<script>
export default {
  name: "Header",
  props: {
    collapseBtnClass: String,
    user: Object
  },
  computed: {
    currentPathName () {
      return this.$store.state.currentPathName;　　//需要监听的数据
    }
  },
  data() {
    return {

    }
  },
  methods: {
    collapse() {
      // this.$parent.$parent.$parent.$parent.collapse()  // 通过4个 $parent 找到父组件，从而调用其折叠方法
      this.$emit("asideCollapse")
    },
    logout() {
      this.$store.commit("logout")
      this.$message.success("退出成功")
    }
  }
}
</script>


<style scoped>
.header-container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 20px;
  height: 60px;
  background: linear-gradient(135deg, rgba(99, 102, 241, 0.84) 0%, rgba(251, 0, 133, 0.78) 100%);
  box-shadow: 0 2px 12px 0 rgba(255, 219, 219, 0.1);
  position: relative;
  overflow: hidden;
}

.header-left {
  display: flex;
  align-items: center;
  flex: 1;
}

.collapse-btn {
  font-size: 18px;
  color: white;
  cursor: pointer;
  transition: all 0.3s;
}

.collapse-btn:hover {
  transform: scale(1.2);
  color: #f472b6;
}

.breadcrumb {
  margin-left: 10px;
}

/* Vue2深度选择器 */
>>> .el-breadcrumb__inner {
  color: white !important;
  font-weight: normal !important;
  transition: all 0.3s;
}

>>> .el-breadcrumb__item:last-child .el-breadcrumb__inner {
  color: #ffffff !important;
  text-shadow: 0 0 5px rgba(244, 114, 182, 0.5);
}

.user-dropdown {
  margin-left: 20px;
}

.avatar-container {
  display: flex;
  align-items: center;
  cursor: pointer;
}

.avatar {
  width: 30px;
  height: 30px;
  border-radius: 50%;
  border: 2px solid rgba(255, 255, 255, 0.5);
  transition: all 0.3s;
  margin-right: 8px;
}

.nickname {
  color: white;
  margin-right: 5px;
}

.el-icon-arrow-down {
  color: white;
  transition: all 0.3s;
}

.avatar-container:hover .avatar {
  transform: scale(1.1);
  box-shadow: 0 0 10px rgba(244, 114, 182, 0.5);
}

.avatar-container:hover .el-icon-arrow-down {
  transform: rotate(180deg);
}

>>> .el-dropdown-menu {
  background: rgba(255, 255, 255, 0.9) !important;
  backdrop-filter: blur(10px);
  border: 1px solid rgba(244, 114, 182, 0.2);
  padding: 5px 0;
}

>>> .el-dropdown-menu__item {
  padding: 8px 20px;
  transition: all 0.3s;
}

>>> .el-dropdown-menu__item:hover {
  background: rgba(99, 102, 241, 0.1) !important;
}

>>> .el-dropdown-menu__item a {
  color: #606266;
  text-decoration: none;
}>>> .el-dropdown-menu__item:hover a {
   color: rgba(99, 102, 241, 0.16);
 }

/* 动态光效 */
.header-container::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: radial-gradient(circle at 10% 20%, rgba(255, 255, 255, 0.2) 0%, transparent 20%);
  animation: shine 15s infinite linear;
  pointer-events: none;
}

@keyframes shine {
  0% {
    transform: translateX(-100%) rotate(0deg);
    opacity: 0;
  }
  50% {
    opacity: 1;
  }
  100% {
    transform: translateX(100%) rotate(360deg);
    opacity: 0;
  }
}

@media screen and (max-width: 768px) {
  .breadcrumb {
    display: none;
  }
  .nickname {
    display: none;
  }
}
</style>