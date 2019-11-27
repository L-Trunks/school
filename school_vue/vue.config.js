module.exports = {
  // 基本路径
  // baseUrl: './',
  // 输出文件目录
  lintOnSave:false,
  outputDir: 'dist',
  runtimeCompiler: true,
  publicPath: './', // 设置打包文件相对路径
  devServer: {
    port: 8080,
    // open: true, //配置自动启动浏览器 
    proxy: {
      '/api': {
        target: 'http://localhost:7788/api/school', //对应自己的接口
        changeOrigin: true,
        ws: true,
        pathRewrite: {
          '^/api': ''
        }
      }
    }
  },
}