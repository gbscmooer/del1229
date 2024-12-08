<template>
  <div class="wrapper">
    <div class="register-box">
      <div class="title"><b>新用户注册</b></div>
      <el-form :model="user" :rules="rules" ref="userForm">
        <el-form-item prop="username">
          <el-input
              placeholder="请输入账号"
              size="medium"
              prefix-icon="el-icon-user"
              v-model="user.username">
          </el-input>
        </el-form-item>
        <el-form-item prop="password">
          <el-input
              placeholder="请输入密码"
              size="medium"
              prefix-icon="el-icon-lock"
              show-password
              v-model="user.password">
          </el-input>
        </el-form-item>
        <el-form-item prop="confirmPassword">
          <el-input
              placeholder="请确认密码"
              size="medium"
              prefix-icon="el-icon-lock"
              show-password
              v-model="user.confirmPassword">
          </el-input>
        </el-form-item>
        <el-form-item class="btn-group">
          <el-button type="primary" size="small" @click="login" class="register-btn">注 册</el-button>
          <el-button size="small" @click="$router.push('/login')" class="back-btn">返回登录</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
// 保持原有的 script 部分不变
export default {
  name: "Login",
  data() {
    return {
      user: {},
      rules: {
        username: [
          { required: true, message: '请输入用户名', trigger: 'blur' },
          { min: 3, max: 10, message: '长度在 3 到 5 个字符', trigger: 'blur' }
        ],
        password: [
          { required: true, message: '请输入密码', trigger: 'blur' },
          { min: 1, max: 20, message: '长度在 1 到 20 个字符', trigger: 'blur' }
        ],
        confirmPassword: [
          { required: true, message: '请输入密码', trigger: 'blur' },
          { min: 1, max: 20, message: '长度在 1 到 20 个字符', trigger: 'blur' }
        ],
      }
    }
  },
  methods: {
    login() {
      this.$refs['userForm'].validate((valid) => {
        if (valid) {
          if (this.user.password !== this.user.confirmPassword) {
            this.$message.error("两次输入的密码不一致")
            return false
          }
          this.request.post("/user/register", this.user).then(res => {
            if(res.code === '200') {
              this.$message.success("注册成功")
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
.wrapper {
  height: 100vh;
  background: linear-gradient(135deg, #ff9a9e, #67b3ff);
  display: flex;
  align-items: center;
  justify-content: center;
}

.register-box {
  background: rgba(255, 255, 255, 0.92);
  width: 380px;
  padding: 30px;
  border-radius: 15px;
  box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
  backdrop-filter: blur(10px);
  transition: all 0.3s ease;
}

.register-box:hover {
  transform: translateY(-5px);
  box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
}

.title {
  text-align: center;
  font-size: 26px;
  color: #2c82ff;
  margin-bottom: 30px;
  letter-spacing: 2px;
  position: relative;
}

.title::after {
  content: '';
  position: absolute;
  bottom: -8px;
  left: 50%;
  transform: translateX(-50%);
  width: 50px;
  height: 3px;
  background: linear-gradient(90deg, #ff9a9e, #67b3ff);
  border-radius: 3px;
}

.btn-group {
  margin-top: 25px;
  text-align: center;
}

.register-btn {
  width: 140px;
  background: linear-gradient(45deg, #ff9a9e, #67b3ff);
  border: none;
  transition: all 0.3s ease;
}

.register-btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 5px 15px rgba(103, 179, 255, 0.4);
}

.back-btn {
  width: 140px;
  background: #fff;
  border: 1px solid #67b3ff;
  color: #67b3ff;
  margin-left: 20px;
  transition: all 0.3s ease;
}

.back-btn:hover {
  background: #67b3ff;
  color: #fff;
  transform: translateY(-2px);
}

:deep(.el-input__inner) {
  border-radius: 20px;
  transition: all 0.3s ease;
}

:deep(.el-input__inner:focus) {
  border-color: #67b3ff;
  box-shadow: 0 0 8px rgba(103, 179, 255, 0.4);
}

:deep(.el-button) {
  border-radius: 20px;
  height: 40px;
}

@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.register-box {
  animation: fadeIn 0.6s ease-out;
}
</style>