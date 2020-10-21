const path                        = require('path');
const { VueLoaderPlugin }         = require('vue-loader');
const HtmlWebpackPlugin           = require('html-webpack-plugin');
const FriendlyErrorsWebpackPlugin = require('friendly-errors-webpack-plugin');

module.exports = (env = {}) => ({
  mode: env.prod ? 'production' : 'development',
  devServer: {
    hot: true,
    port: 9090,
    // contentBase: path.join(__dirname, 'dist'),
    historyApiFallback: true,
  },
  entry: path.resolve(__dirname, 'src/index.ts'),
  output: {
    path: path.resolve(__dirname, '../app/public'),
    // filename: '[hash]-index.js',
    filename: 'index.js',
    // publicPath: '/dist/'
  },
  module: {
    rules: [
      {
        test: /\.vue$/,
        use: 'vue-loader'
      },
      {
        test: /\.ts$/,
        loader: 'ts-loader',
        options: {
          appendTsSuffixTo: [/\.vue$/],
        }
      },
      {
        test: /\.css$/,
        use: [
          {
            loader: 'style-loader'
          },
          {
            loader: 'css-loader',
            options: { importLoaders: 1 }
          },
          {
            loader: 'postcss-loader',
          },
        ]
      },
      {
        test: /\.(jpe?g|png|gif|mp3|ogg)$/i,
        loader:'file-loader'
      },
      {
        test: /\.svg$/,
        use: [
          'svg-sprite-loader'
        ]
      }
    ]
  },
  resolve: {
    extensions: ['.ts', '.js', '.vue', '.json'],
    alias: {
      'vue': '@vue/runtime-dom'
    }
  },
  plugins: [
    new VueLoaderPlugin(),
    new HtmlWebpackPlugin({
      template: path.resolve(__dirname, 'index.html')
    }),
    new FriendlyErrorsWebpackPlugin(),
  ],
});
