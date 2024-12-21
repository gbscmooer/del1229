<template>
  <div class="wrapper">
    <div class="bg-animation">
      <div id="stars"></div>
      <div id="stars2"></div>
    </div>
    <el-card class="form-card">
      <div class="card-title">修改密码</div>
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
        <el-form-item class="btn-wrapper">
          <el-button type="primary" @click="save" class="submit-btn">确认修改</el-button>
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
      form: {
        username: '',
        password: '',
        newPassword: '',
        confirmPassword: ''
      },
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
            this.$message.error("两次输入的新密码不相同")
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

<style scoped>
.wrapper {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: calc(100vh - 60px);
  padding: 20px;
  position: relative;
  overflow: hidden;
  background: linear-gradient(45deg, #FF8DAA, #8E9BFF, #B49BFF); /* 粉蓝紫渐变 */
  background-size: 400% 400%;
  animation: gradient 15s ease infinite;
}

.bg-animation {
  position: absolute;
  width: 100%;
  height: 100%;
}

.glass-effect {
  background: rgb(255, 234, 234) !important;
  backdrop-filter: blur(10px);
  -webkit-backdrop-filter: blur(10px);
  border: 1px solid rgba(255, 255, 255, 0.18);
}

.form-card {
  width: 500px;
  border-radius: 16px;
  box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
  transition: all 0.3s ease;
}

.form-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 12px 40px 0 rgba(31, 38, 135, 0.45);
}

.card-title {
  font-size: 24px;
  font-weight: 600;
  color: #225290;
  text-align: center;
  margin-bottom: 30px;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
}

/* 使用 ::v-deep 来穿透样式 */
::v-deep .el-form-item__label {
  color: #2154aa;
  font-weight: 500;
}

::v-deep .el-input__inner {
  background: rgb(255, 234, 234);
  border: none;
  border-radius: 8px;
  height: 42px;
  color: #fff;
  transition: all 0.3s ease;
}

::v-deep .el-input__inner:focus {
  background: rgb(255, 234, 234);
  box-shadow: 0 0 15px rgba(255, 255, 255, 0.2);
}

.submit-btn {
  width: 180px;
  height: 42px;
  border-radius: 21px;
  background: linear-gradient(45deg, #FF6B6B, #4ECDC4);
  border: none;
  font-weight: 600;
  letter-spacing: 1px;
  transition: all 0.3s ease;
}

.submit-btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
}

@keyframes gradient {
  0% { background-position: 0% 50%; }
  50% { background-position: 100% 50%; }
  100% { background-position: 0% 50%; }
}

@media screen and (max-width: 768px) {
  .form-card {
    width: 95%;
    margin: 0 auto;
  }

  .submit-btn {
    width: 100%;
  }
}

#stars {
  width: 1px;
  height: 1px;
  background: transparent;
  box-shadow:
      1804px 1265px #FFF, 365px 332px #FFF, 86px 1888px #FFF, 1888px 484px #FFF,
      200px 500px #FFF, 1500px 1000px #FFF, 500px 1800px #FFF, 100px 1200px #FFF,
      1800px 800px #FFF, 1000px 1100px #FFF, 200px 400px #FFF, 1000px 1900px #FFF;
  animation: animateStars 50s linear infinite;
}

#stars2 {
  width: 4px;
  height: 4px;
  background: transparent;
  box-shadow:
      1804px 1265px #FFF, 365px 332px #FFF, 86px 1888px #FFF, 1888px 484px #FFF,
      1000px 200px #FFF, 1200px 800px #FFF, 600px 1400px #FFF, 200px 1000px #FFF,
      1300px 500px #FFF, 300px 600px #FFF, 1800px 200px #FFF, 600px 1500px #FFF;
  animation: animateStars 78s linear infinite;
}

@keyframes animateStars {
  from { transform: translateY(0px); }
  to { transform: translateY(-2000px); }
}
</style>