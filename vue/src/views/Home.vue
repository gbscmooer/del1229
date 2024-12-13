<template>
  <div class="space-station">
    <div class="content-container">
      <!-- 头部区域 -->
      <div class="header">
        <h1 class="title">黑塔空间站</h1>
        <p class="subtitle">星际科研中心</p>
      </div>

      <!-- 主要展示卡片 -->
      <div class="main-card">
        <div class="card-image">
          <img src="../assets/g1.jpg" height="450" width="1920"/></div>
        <div class="card-content">
          <h2>欢迎来到黑塔空间站</h2>
          <p class="description">
            这是一座围绕湛蓝星公转运行的空间站，是游戏中开拓者来到的第一个区域。
            这里汇集了天才俱乐部成员、星际和平公司员工及各方学者，致力于从银河各处
            收集遗器和奇物，建立系统的观测与研究方法。
          </p>
          <div class="features">
            <div class="feature">
              <h3>研究项目</h3>
              <p>异星文物收集与研究</p>
            </div>
            <div class="feature">
              <h3>设施概况</h3>
              <p>博物馆式星际舰船</p>
            </div>
            <div class="feature">
              <h3>科研团队</h3>
              <p>跨星际研究人员</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'SpaceStation'
}
</script>

<style scoped>
.space-station {
  min-height: 100vh;
  background: linear-gradient(135deg, #e0f3ff 0%, #fff0f9 100%);
  padding: 40px 20px;
}

.content-container {
  max-width: 1200px;
  margin: 0 auto;
}

.header {
  text-align: center;
  margin-bottom: 60px;
}

.title {
  font-size: 48px;
  font-weight: 700;
  color: #2b4d7e;
  margin-bottom: 12px;
}

.subtitle {
  font-size: 24px;
  color: #6e8bb7;
}

.main-card {
  background: rgba(255, 255, 255, 0.7);
  backdrop-filter: blur(20px);
  border-radius: 30px;
  overflow: hidden;
  transition: all 0.3s ease;
  border: 1px solid rgba(148, 190, 233, 0.3);
}

.main-card:hover {
  transform: translateY(-6px);
  box-shadow: 0 20px 40px rgba(116, 169, 224, 0.15);
}

.card-image {
  height: 400px;
  background: #eef4ff;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #6e8bb7;
}

.card-content {
  padding: 40px;
}

.card-content h2 {
  font-size: 32px;
  color: #2b4d7e;
  margin-bottom: 20px;
}

.description {
  font-size: 16px;
  color: #6e8bb7;
  line-height: 1.8;
  margin-bottom: 40px;
}

.features {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 30px;
}

.feature {
  padding: 20px;
  background: rgba(255, 255, 255, 0.5);
  border-radius: 15px;
  border: 1px solid rgba(148, 190, 233, 0.2);
}

.feature h3 {
  font-size: 20px;
  color: #2b4d7e;
  margin-bottom: 10px;
}

.feature p {
  font-size: 16px;
  color: #6e8bb7;
}

@media (max-width: 768px) {
  .title {
    font-size: 36px;
  }

  .subtitle {
    font-size: 20px;
  }

  .card-image {
    height: 300px;
  }

  .card-content {
    padding: 30px;
  }
}
</style>