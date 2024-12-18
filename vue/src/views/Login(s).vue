<template>
  <div class="login-container">
    <div class="login-box">
      <!-- 修改 template 部分的动画容器 -->
      <div class="illustration-wrapper">
        <div class="animation-container">
          <img src="../assets/image.gif" alt="animation" class="animated-gif">
          <div class="animated-placeholder"></div>
        </div>
      </div>
      <div class="form-wrapper">
        <h2 class="title">黑 塔 空 间 站</h2>
        <p class="subtitle">Herta Space Station</p>

        <el-form :model="user" :rules="rules" ref="userForm" class="login-form">
          <el-form-item prop="username">
            <el-input
                size="medium"
                v-model="user.username"
                placeholder="用户名"
                class="custom-input">
              <template #prefix>
                <i class="fas fa-user"></i>
              </template>
            </el-input>
          </el-form-item>

          <el-form-item prop="password">
            <el-input
                size="medium"
                show-password
                v-model="user.password"
                placeholder="密码"
                class="custom-input">
              <template #prefix>
                <i class="fas fa-lock"></i>
              </template>
            </el-input>
          </el-form-item>

          <div class="button-group">
            <el-button
                type="primary"
                class="login-btn"
                @click="login">
              登录
            </el-button>
            <el-button
                class="register-btn"
                @click="$router.push('/register')">
              注册账号
            </el-button>
          </div>
        </el-form>
      </div>
    </div>
  </div>
</template>

<script>
import { setRoutes } from "@/router";

export default {
  name: "Login",
  data() {
    return {
      user: {},
      rules: {
        username: [
          {required: true, message: '请输入用户名', trigger: 'blur'},
          {min: 3, max: 10, message: '长度在 3 到 10 个字符', trigger: 'blur'}
        ],
        password: [
          {required: true, message: '请输入密码', trigger: 'blur'},
          {min: 1, max: 20, message: '长度在 1 到 20 个字符', trigger: 'blur'}
        ],
      }
    }
  },
  methods: {
    login() {
      this.$refs['userForm'].validate((valid) => {
        if (valid) {
          this.request.post("/user/login", this.user).then(res => {
            if (res.code === '200') {
              localStorage.setItem("user", JSON.stringify(res.data))
              localStorage.setItem("menus", JSON.stringify(res.data.menus))
              setRoutes()
              this.$message.success("登录成功")

              if (res.data.role === 'ROLE_STUDENT') {
                this.$router.push("/front/home")
              } else {
                this.$router.push("/")
              }
            } else {
              this.$message.error(res.msg)
            }
          })
        }
      });
    }
  }
}
</script>

<style scoped>
.login-container {
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

.login-box {
  width: 1000px;
  height: 600px;
  background: white;
  border-radius: 20px;
  box-shadow: 0 15px 30px rgba(0,0,0,0.1);
  display: flex;
  overflow: hidden;
}

.illustration-wrapper {
  flex: 1;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  display: flex;
  align-items: center;
  justify-content: center;
}

/* 修改和添加相关样式 */
.animation-container {
  width: 100%;
  height: 100%;
  position: relative; /* 添加相对定位 */
}

.animated-gif {
  position: absolute; /* 绝对定位 */
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: cover; /* 确保图片正确填充 */
  border-radius: 10px;
  z-index: 1; /* 确保图片在上层 */
}

.animated-placeholder {
  position: absolute; /* 绝对定位 */
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(255,255,255,0.1);
  border-radius:5px;
  animation: pulse 2s infinite;
  z-index: 0; /* 确保在图片下层 */
}
.animated-placeholder {
  width: 100%;
  height: 100%;
  background: rgba(255,255,255,0.1);
  border-radius: 10px;
  animation: pulse 2s infinite;
}

.form-wrapper {
  flex: 1;
  padding: 50px;
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.title {
  font-size: 32px;
  color: #333;
  margin-bottom: 10px;
  font-weight: 600;
}

.subtitle {
  color: #666;
  margin-bottom: 40px;
}

.login-form {
  width: 100%;
}

.custom-input :deep(.el-input__inner) {
  height: 50px;
  border-radius: 25px;
  padding-left: 45px;
  border: 1px solid #ddd;
  transition: all 0.3s ease;
}

.custom-input :deep(.el-input__inner):focus {
  border-color: #764ba2;
  box-shadow: 0 0 0 2px rgba(118,75,162,0.2);
}

.custom-input :deep(.el-input__prefix) {
  left: 15px;
  color: #666;
}

.button-group {
  margin-top: 30px;
  display: flex;
  flex-direction: column;
  gap: 15px;
}

.login-btn {
  width: 100%;
  height: 50px;
  border-radius: 25px;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  border: none;
  font-size: 16px;
  font-weight: 500;
  transition: all 0.3s ease;
}

.login-btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 5px 15px rgba(118,75,162,0.3);
}

.register-btn {
  width: 100%;
  height: 50px;
  border-radius: 25px;
  background: transparent;
  border: 1px solid #764ba2;
  color: #764ba2;
  font-size: 16px;
  font-weight: 500;
  transition: all 0.3s ease;
}

.register-btn:hover {
  background: rgba(118,75,162,0.1);
}

@keyframes pulse {
  0% {
    transform: scale(0.95);
    opacity: 0.7;
  }
  50% {
    transform: scale(1);
    opacity: 0.9;
  }
  100% {
    transform: scale(0.95);
    opacity: 0.7;
  }
}

/* 响应式设计 */
@media (max-width: 1024px) {
  .login-box {
    width: 90%;
    height: auto;
    flex-direction: column;
  }

  .illustration-wrapper {
    display: none;
  }

  .form-wrapper {
    padding: 30px;
  }
}
</style>