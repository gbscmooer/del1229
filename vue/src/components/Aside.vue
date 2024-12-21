<template>
  <el-menu :default-openeds="opens"
           style="min-height: 100%; overflow-x: hidden"
           background-color="#6366f1"
           text-color="#fff"
           active-text-color="#f472b6"
           :collapse-transition="false"
           :collapse="isCollapse"
           router
  >
    <div class="logo-container">
      <img src="../assets/g3.webp" alt="" class="logo-img">
      <b class="logo-text" v-show="logoTextShow">管 理</b>
    </div>
    <div v-for="item in filteredMenus" :key="item.id">
      <div v-if="item.path">
        <el-menu-item :index="item.path" class="menu-item">
          <i :class="item.icon"></i>
          <span slot="title">{{ item.name }}</span>
        </el-menu-item>
      </div>
      <div v-else>
        <el-submenu :index="item.id + ''" class="submenu">
          <template slot="title">
            <i :class="item.icon"></i>
            <span slot="title">{{ item.name }}</span>
          </template>
          <div v-for="subItem in item.children" :key="subItem.id">
            <el-menu-item :index="subItem.path" class="menu-item">
              <i :class="subItem.icon"></i>
              <span slot="title">{{ subItem.name }}</span>
            </el-menu-item>
          </div>
        </el-submenu>
      </div>
    </div>
  </el-menu>
</template>
<script>

export default {
  name: "Aside",
  // 正确定义Vue2的props
  props: {
    isCollapse: {
      type: Boolean,
      default: false
    },
    logoTextShow: {
      type: Boolean,
      default: true
    }
  },
  data() {
    return {
      menus: localStorage.getItem("menus") ? JSON.parse(localStorage.getItem("menus")) : [],
      opens: localStorage.getItem("menus") ? JSON.parse(localStorage.getItem("menus")).map(item => item.id + '') : []
    }
  },
  mounted() {
    this.createStars();
  },
  methods: {
    createStars() {
      const menu = document.querySelector('.el-menu');
      for(let i = 0; i < 20; i++) {
        const star = document.createElement('div');
        star.className = 'star';
        star.style.left = Math.random() * 100 + '%';
        star.style.animationDelay = Math.random() * 3 + 's';
        menu.appendChild(star);
      }
    }
  },
  computed: {
    filteredMenus() {
      return this.menus.filter(item => ![40, 42, 43, 9].includes(item.id));
    }
  }
}
</script>


<style>
/* 基础渐变背景 */
.el-menu {
  background: linear-gradient(135deg, rgba(99, 102, 241, 0.38) 0%, rgba(244, 114, 182, 0.52) 100%) !important;
  border-right: none !important;
  position: relative;
  overflow: hidden;
}

/* 星星动画 */
.star {
  position: absolute;
  background: white;
  width: 2px;
  height: 2px;
  border-radius: 50%;
  animation: starFloat 3s linear infinite;
}

@keyframes starFloat {
  0% {
    transform: translateY(0) rotate(0deg);
    opacity: 0;
  }
  50% {
    opacity: 1;
  }
  100% {
    transform: translateY(-100px) rotate(360deg);
    opacity: 0;
  }
}

/* Logo区域 */
.logo-container {
  height: 60px;
  line-height: 60px;
  text-align: center;
  transition: all 0.3s;
  background: rgba(99, 102, 241, 0.43);
  margin-bottom: 10px;
  position: relative;
  overflow: hidden;
  backdrop-filter: blur(5px);
}

.logo-img {
  width: 50px;
  position: relative;
  top: 10px;
  transition: transform 0.3s;
}

.logo-img:hover {
  transform: scale(1.1) rotate(10deg);
  filter: drop-shadow(0 0 8px rgba(244, 114, 182, 0.52));
}

.logo-text {
  color: white;
  margin-left: 5px;
  font-size: 16px;
  transition: all 0.3s;
  text-shadow: 0 0 5px rgba(255, 255, 255, 0.23);
}

/* 菜单项样式 */
.el-menu-item {
  transition: all 0.3s !important;
  border-radius: 0 25px 25px 0;
  margin: 4px 10px 4px 0;
  position: relative;
  overflow: hidden;
  backdrop-filter: blur(5px);
}

.el-menu-item::after {
  content: '';
  position: absolute;
  top: 0;
  left: -100%;
  width: 100%;
  height: 100%;
  background: linear-gradient(90deg, transparent, rgb(33, 84, 170), transparent);
  transition: 0.5s;
}

.el-menu-item:hover::after {
  left: 100%;
}

.el-menu-item.is-active {
  background: rgba(244, 114, 182, 0.2) !important;
  box-shadow: 0 0 15px rgba(195, 113, 156, 0.3);
}

.el-menu-item:hover {
  background: rgba(99, 102, 241, 0.2) !important;
  transform: translateX(5px);
}

/* 子菜单样式 */
.el-submenu__title {
  transition: all 0.3s !important;
  position: relative;
  overflow: hidden;
}

.el-submenu__title:hover {
  background: rgba(99, 102, 241, 0.2) !important;
}

.el-submenu .el-menu {
  background: rgba(99, 102, 241, 0.34) !important;
  backdrop-filter: blur(5px);
}

.el-submenu.is-opened > .el-submenu__title {
  background: rgba(255, 255, 255, 0.23) !important;
}

/* 图标动画 */
.el-menu-item i,
.el-submenu__title i {
  transition: all 0.3s;
  position: relative;
}

.el-menu-item:hover i,
.el-submenu__title:hover i {
  transform: scale(1.2) rotate(360deg);
  color: rgba(244, 114, 182, 0.38);
}

/* 呼吸灯效果 */
@keyframes breathe {
  0% { opacity: 0.8; }
  50% { opacity: 1; }
  100% { opacity: 0.8; }
}

.el-menu-item.is-active i {
  animation: breathe 2s infinite;
}

/* 确保折叠时文字隐藏 */
.el-menu--collapse span {
  visibility: hidden;
}

/* 全局动画时间 */
* {
  transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
}
</style>