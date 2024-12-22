<template>
  <div class="center-wrapper">
    <el-card class="password-card">
      <el-form label-width="120px" size="small" :model="form" :rules="rules" ref="pass">
        <el-form-item label="原密码" prop="password">
          <el-input v-model="form.password" autocomplete="off" show-password></el-input>
        </el-form-item>
        <el-form-item label="新密码" prop="newPassword">
          <el-input v-model="form.newPassword" autocomplete="off" show-password></el-input>
        </el-form-item>
        <el-form-item label="确认新密码" prop="confirmPassword">
          <el-input v-model="form.confirmPassword" autocomplete="off" show-password></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="save">确 定</el-button>
        </el-form-item>
      </el-form>
    </el-card>
  </div>
</template>

<script>
export default {
  name: "Password",
  data() {
    return {
      form: {},
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {},
      rules: {
        password: [
          { required: true, message: '请输入原密码', trigger: 'blur' },
          { min: 3, message: '长度不少于3位', trigger: 'blur' }
        ],
        newPassword: [
          { required: true, message: '请输入新密码', trigger: 'blur' },
          { min: 3, message: '长度不少于3位', trigger: 'blur' }
        ],
        confirmPassword: [
          { required: true, message: '请输入密码', trigger: 'blur' },
          { min: 3, message: '长度不少于3位', trigger: 'blur' }
        ],
      }
    }
  },
  created() {
    this.form.username = this.user.username
  },
  methods: {
    save() {
      this.$refs.pass.validate((valid) => {
        if (valid) {
          if (this.form.newPassword !== this.form.confirmPassword) {
            this.$message.error("2次输入的新密码不相同")
            return false
          }
          this.request.post("/user/password", this.form).then(res => {
            if (res.code === '200') {
              this.$message.success("修改成功")
              this.$store.commit("logout")
            } else {
              this.$message.error(res.msg)
            }
          })
        }
      })
    },
  }
}
</script>


<style>
.center-wrapper {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: calc(100vh - 60px);
  background: linear-gradient(135deg, #a5b4fc 0%, #ff6363 100%);
  padding: 20px;
}

.password-card {
  width: 600px !important; /* 增加宽度 */
  padding: 20px;
  margin: 0 20px;
  border: none !important;
  border-radius: 12px;
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
  background: rgba(255, 255, 255, 0.9);
  backdrop-filter: blur(12px);
  animation: floatIn 0.5s ease;
  transition: all 0.3s ease;
}

/* 表单容器样式 */
.el-form {
  width: 100%;
  box-sizing: border-box;
}

.password-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 12px 36px rgba(165, 180, 252, 0.2);
}

/* 输入框样式 */
.el-input__inner {
  border-radius: 8px;
  border: 2px solid rgba(165, 180, 252, 0.2);
  transition: all 0.3s;
  background: rgba(255, 255, 255, 0.9);
}

.el-input__inner:focus {
  border-color: #a5b4fc;
  box-shadow: 0 0 12px rgba(165, 180, 252, 0.3);
  transform: translateY(-2px);
}

/* 表单项样式 */
.el-form-item__label {
  color: #6b7280;
  font-weight: 500;
  background: linear-gradient(45deg, #a5b4fc, #fca5a5);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

/* 按钮样式 */
.el-button--primary {
  background: linear-gradient(45deg, #a5b4fc, #fca5a5);
  border: none;
  border-radius: 8px;
  padding: 12px 28px;
  transition: all 0.3s;
  position: relative;
  overflow: hidden;
}

.el-button--primary::before {
  content: '';
  position: absolute;
  top: 0;
  left: -100%;
  width: 100%;
  height: 100%;
  background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
  transition: 0.5s;
}

.el-button--primary:hover::before {
  left: 100%;
}

.el-button--primary:hover {
  transform: translateY(-3px);
  box-shadow: 0 8px 20px rgba(165, 180, 252, 0.4);
}

/* 增强动画效果 */
@keyframes floatIn {
  0% {
    opacity: 0;
    transform: translateY(-30px) scale(0.9);
  }
  50% {
    transform: translateY(10px) scale(1.02);
  }
  100% {
    opacity: 1;
    transform: translateY(0) scale(1);
  }
}

@keyframes shimmer {
  0% { background-position: -200% 0; }
  100% { background-position: 200% 0; }
}

/* 响应式布局 */
@media screen and (max-width: 768px) {
  .password-card {
    width: 95% !important;
    padding: 15px;
    margin: 0 10px;
  }

  .el-form-item__label {
    float: none;
    text-align: left;
    padding: 0 0 10px;
  }
}
</style>