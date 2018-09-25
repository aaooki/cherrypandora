const path              = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const VueLoaderPlugin   = require('vue-loader/lib/plugin');

module.exports = {
  entry: path.resolve(__dirname, 'frontend/index.js'),
  output: {
    path: path.resolve(__dirname, 'app/public'),
    filename: '[hash]-index.js'
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: path.resolve(__dirname, 'frontend', 'index.html')
    }),
    new VueLoaderPlugin()
  ],
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader"
        }
      },
      {
        test: /\.vue$/,
        loader: 'vue-loader'
      },
      {
        test: /\.css$/,
        use: [
          'vue-style-loader',
          {
            loader: 'css-loader',
            options: { importLoaders: 1 }
          },
          'postcss-loader'
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
  }
};

if (process.env.NODE_ENV === 'test') {
  module.exports.externals = [require('webpack-node-externals')()];
  module.exports.devtool   = 'inline-cheap-module-source-map';
}
