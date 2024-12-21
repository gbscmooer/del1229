<template>
  <div class="center-container">
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
  </div>
</template>

<script>
import {serverIp} from "../../public/config";

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

/* 居中容器 */
.center-container {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: calc(100vh - 60px); /* 减去顶部导航栏高度 */
  padding: 20px;
  background: linear-gradient(135deg, rgba(244, 114, 182, 0.34) 0%, rgba(244, 114, 182, 0.23) 100%);
}
.el-card {
  /* 添加动画效果 */
  animation: slideIn 0.3s ease-out;
}
/* 卡片样式 */
.el-card {
  border: none !important;
  border-radius: 8px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1) !important;
  background: rgba(255, 255, 255, 0.95);
  backdrop-filter: blur(10px);
}

/* 头像上传样式 */
.avatar-uploader {
  text-align: center;
  padding: 20px 0;
}

.avatar-uploader .el-upload {
  border: 2px dashed rgba(99, 102, 241, 0.2);
  border-radius: 8px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
  transition: all 0.3s;
}

.avatar-uploader .el-upload:hover {
  border-color: #6366f1;
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(99, 102, 241, 0.2);
}

.avatar-uploader-icon {
  font-size: 28px;
  color: #6366f1;
  width: 138px;
  height: 138px;
  line-height: 138px;
  text-align: center;
  transition: all 0.3s;
}

.avatar {
  width: 138px;
  height: 138px;
  display: block;
  border-radius: 8px;
  transition: all 0.3s;
}

.avatar:hover {
  transform: scale(1.05);
}

/* 表单样式 */
.el-form-item {
  margin-bottom: 20px;
}

.el-input__inner {
  border-radius: 4px;
  border: 1px solid rgba(99, 102, 241, 0.2);
  transition: all 0.3s;
}

.el-input__inner:focus {
  border-color: #6366f1;
  box-shadow: 0 0 8px rgba(99, 102, 241, 0.2);
}

.el-textarea__inner {
  border-radius: 4px;
  border: 1px solid rgba(99, 102, 241, 0.2);
  transition: all 0.3s;
}

.el-textarea__inner:focus {
  border-color: #6366f1;
  box-shadow: 0 0 8px rgba(99, 102, 241, 0.2);
}

/* 按钮样式 */
.el-button--primary {
  background: linear-gradient(135deg, #6366f1 0%, #818cf8 100%);
  border: none;
  border-radius: 4px;
  padding: 10px 24px;
  transition: all 0.3s;
}

.el-button--primary:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(99, 102, 241, 0.3);
}

/* 表单标签样式 */
.el-form-item__label {
  color: #6366f1;
  font-weight: 500;
}

/* 禁用输入框样式 */
.el-input.is-disabled .el-input__inner {
  background: rgba(99, 102, 241, 0.05);
  border-color: rgba(99, 102, 241, 0.1);
  color: #6366f1;
}

/* 动画效果 */
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
@keyframes slideIn {
  from {
    opacity: 0;
    transform: translateY(-20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
.el-card {
  animation: fadeIn 0.3s ease-out;
}


@media screen and (max-width: 768px) {
  .el-card {
    width: 95% !important;
    margin: 0 10px;
  }
}
</style>
