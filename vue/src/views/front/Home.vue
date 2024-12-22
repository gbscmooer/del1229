<template>
  <div class="space-home">
    <div class="content-container">
      <!-- 轮播图区域 -->
      <div class="carousel-section">
        <el-carousel height="450px" :interval="10000">
          <el-carousel-item v-for="item in imgs" :key="item">
            <img :src="item" alt="" class="carousel-image">
          </el-carousel-item>
        </el-carousel>
      </div>

      <div class="intro-section">
        <h2 class="section-title">探索黑塔空间站</h2>
        <p class="section-subtitle">开启你的星际探索之旅</p>

        <el-row :gutter="20">
          <el-col :span="6" v-for="item in files.slice(0, 3)" :key="item.id">
            <div class="station-card">
              <div class="card-image">
                <img :src="item.url" alt="图片展示">
              </div>
              <div class="card-content">
                <h3>{{ item.name }}</h3>
              </div>
            </div>
          </el-col>
        </el-row>
      </div>
 -->
      <div class="image-gallery">

        <el-row :gutter="20">
          <el-col :span="6" v-for="item in files.slice(3, 6)" :key="item.id">
            <div class="station-card">
              <div class="card-image">
                <img :src="item.url" alt="更多展示图片">
              </div>
              <div class="card-content">
                <h3>{{ item.name }}</h3>
              </div>
            </div>
          </el-col>
        </el-row>
      </div>

      <!-- 黑塔空间站介绍部分 -->
      <div class="space-station-intro">
        <h2 class="section-title">欢迎来到「黑塔」空间站！</h2>
        <p class="section-content">
          无论是追寻银河深处未解的谜团，还是探索宇宙间那一抹未曾触及的光辉，「黑塔」空间站都将是您求知之旅的起点。这里，我们不仅搜寻着天文物理的真理，也在不断挖掘着古老文明遗失的知识和科技的奥秘。无数的科学家、工程师、学者和探险家们，肩负着承前启后的使命，在这座围绕湛蓝星公转的太空堡垒中，探索未知的边界。
        </p>
        <p class="section-content">
          「黑塔」空间站，作为跨星际科研中心，不仅仅是一个科研阵地，它更是一个无尽知识和智慧的汇聚地。这里，记录着无数生命形态、文明碎片、科技遗产的过去与未来。
        </p>
        <p class="section-content">
          我们为您准备了精彩纷呈的参观体验：
        </p>
        <ul>
          <li>太空电梯：在这里，您可以感受到穿越太空的震撼体验，观赏到远离地球、近距离接触银河星辰的绝美景象。</li>
          <li>接待大厅：进入这个充满现代与未来科技感的区域，您可以了解「黑塔」空间站的历史背景，研究团队的最新进展，以及即将揭开面纱的未来探索项目。</li>
        </ul>
        <p class="section-content">
          每位访客在接待大厅将有30分钟的参观时间，届时我们的导览人员将带领您领略这座空间站的辉煌与奥秘。请您尊重空间站的科研秩序，暂时无法进入涉及机密研究的区域。
        </p>
        <p class="section-content">
          特别提醒： 由于申请参观的人员较多，我们的回访时间大约为180个工作日，敬请耐心等待。
        </p>
        <p class="section-content">
          「黑塔」空间站，您探索宇宙奥秘、追寻真理的最佳起点。我们期待与您共同见证这一切的未来。
        </p>

        <h3>入站申请</h3>
        <p>请按照官网的申请模板发送邮件，我们将尽快安排您的参观时间。</p>
      </div>

    </div>
  </div>
</template>

<script>
export default {
  name: "FrontHome",
  data() {
    return {
      imgs: [
        require("../../assets/1600px-1.3寰宇蝗灾.png"),
        require("../../assets/g1.jpg")// 轮播图图片
      ],
      files: [
      ]
    }
  }
}
</script>

<style scoped>
.space-home {
  width: 100%;
  background-color: #f4f4f4;
}

.content-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
}

.carousel-section {
  margin-bottom: 30px;
}

.carousel-image {
  width: 100%;
  height: 450px;
  object-fit: cover;
}

.intro-section {
  margin-bottom: 30px;
}

.section-title {
  font-size: 2rem;
  font-weight: bold;
  margin-bottom: 10px;
}

.section-subtitle {
  font-size: 1.2rem;
  margin-bottom: 20px;
}

.station-card {
  background: #fff;
  border-radius: 10px;
  overflow: hidden;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.card-image img {
  width: 100%;
  height: 200px;
  object-fit: cover;
}

.card-content {
  padding: 10px;
}

.card-content h3 {
  font-size: 1.2rem;
  font-weight: 600;
  text-align: center;
}

.video-section {
  margin-top: 50px;
}

.video-container {
  display: flex;
  justify-content: center;
  align-items: center;
}

.image-gallery {
  margin-top: 50px;
}

.space-station-intro {
  margin-top: 50px;
}

.space-station-intro ul {
  padding-left: 20px;
  list-style-type: disc;
}

.space-station-intro h3 {
  font-size: 1.5rem;
  font-weight: bold;
  margin-top: 20px;
}

.space-station-intro p,
.space-station-intro ul {
  font-size: 1rem;
  line-height: 1.6;
}
</style>