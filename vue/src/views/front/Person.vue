<template>
  <div class="center-wrapper">
    <el-card class="person-card">
      <el-form label-width="80px" size="small">
  <el-card style="width: 500px;">
    <el-form label-width="80px" size="small">

      <el-upload
          class="avatar-uploader"
          :action="'http://' + serverIp +':9090/file/upload'"
          :show-file-list="false"
          :on-success="handleAvatarSuccess"
      >
        <img v-if="form.avatarUrl" :src="form.avatarUrl" class="avatar">
        <i v-else class="el-icon-plus avatar-uploader-icon"></i>
      </el-upload>

      <el-form-item label="用户名">
        <el-input v-model="form.username" disabled autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="昵称">
        <el-input v-model="form.nickname" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="邮箱">
        <el-input v-model="form.email" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="电话">
        <el-input v-model="form.phone" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="地址">
        <el-input type="textarea" v-model="form.address" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="save">确 定</el-button>
      </el-form-item>
    </el-form>
  </el-card>
      </el-form>
    </el-card>
  </div>
</template>

<script>
import {serverIp} from "../../../public/config";

export default {
  name: "Person",
  data() {
    return {
      serverIp: serverIp,
      form: {},
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {}
    }
  },
  created() {
    this.getUser().then(res => {
      console.log(res)
      this.form = res
    })
  },
  methods: {
    async getUser() {
      return (await this.request.get("/user/username/" + this.user.username)).data
    },
    save() {
      this.request.post("/user", this.form).then(res => {
        if (res.code === '200') {
          this.$message.success("保存成功")

          // 触发父级更新User的方法
          this.$emit("refreshUser")

          // 更新浏览器存储的用户信息
          this.getUser().then(res => {
            res.token = JSON.parse(localStorage.getItem("user")).token
            localStorage.setItem("user", JSON.stringify(res))
          })

        } else {
          this.$message.error("保存失败")
        }
      })
    },
    handleAvatarSuccess(res) {
      this.form.avatarUrl = res
    }
  }
}
</script>




<style>
.center-wrapper {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: calc(100vh - 60px);
  background: linear-gradient(135deg, #a5b4fc 0%, #fca5a5 100%);
  padding: 20px;
}

.person-card {
  width: 600px !important;
  padding: 20px;
  border: none !important;
  border-radius: 12px;
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
  background: rgba(255, 255, 255, 0.9);
  backdrop-filter: blur(12px);
  animation: floatIn 0.5s ease;
  transition: all 0.3s ease;
}

.person-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 12px 36px rgba(165, 180, 252, 0.2);
}

/* 头像上传样式 */
.avatar-uploader {
  text-align: center;
  padding: 20px 0;
}

.avatar-uploader .el-upload {
  border: 2px dashed rgba(165, 180, 252, 0.3);
  border-radius: 12px;
  overflow: hidden;
  transition: all 0.3s;
  cursor: pointer;
}

.avatar-uploader .el-upload:hover {
  border-color: #a5b4fc;
  transform: translateY(-2px);
  box-shadow: 0 8px 20px rgba(165, 180, 252, 0.2);
}

.avatar-uploader-icon {
  font-size: 28px;
  color: #a5b4fc;
  width: 138px;
  height: 138px;
  line-height: 138px;
  text-align: center;
  transition: all 0.3s;
}

.avatar {
  width: 138px;
  height: 138px;
  border-radius: 12px;
  display: block;
  transition: all 0.3s;
}

.avatar:hover {
  transform: scale(1.05);
}

/* 表单样式 */
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

.el-textarea__inner {
  border-radius: 8px;
  border: 2px solid rgba(165, 180, 252, 0.2);
  transition: all 0.3s;
}

.el-textarea__inner:focus {
  border-color: #a5b4fc;
  box-shadow: 0 0 12px rgba(165, 180, 252, 0.3);
}

.el-form-item__label {
  color: #6b7280;
  font-weight: 500;
  background: linear-gradient(45deg, #a5b4fc, #fca5a5);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

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

@media screen and (max-width: 768px) {
  .person-card {
    width: 95% !important;
    margin: 0 10px;
  }
}
</style>