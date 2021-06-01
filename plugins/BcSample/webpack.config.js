const path = require("path");
const glob = require("glob");
const { VueLoaderPlugin } = require('vue-loader');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');

var entries = {};
glob.sync("./webroot/src/**/*.js").map(function(file){
    entries[file.replace('./webroot/src/', '').split('.').shift()] = file;
});
module.exports = {
    mode: 'production',
	entry: entries,
    devtool: 'source-map',
    output: {
    	path: path.resolve(__dirname, './webroot/js'),
		filename: "[name].bundle.js"
    },
    optimization: {
        splitChunks: {
			name: 'common',
			chunks: 'initial',
        }
    },
    plugins: [
    	new VueLoaderPlugin(),
		new MiniCssExtractPlugin({
		  filename: '../css/[name].bundle.css'
		})
    ],
    module: {
        rules: [
            {
                test: /\.js$/,
                exclude: /node_modules/,
                use: {
                    loader: 'babel-loader',
                    options: {
                        presets: ['@babel/preset-env']
                    }
                }
            },
            {
            	test: /\.vue$/,
            	loader: 'vue-loader',
				options: {
					extractCSS: true
				}
			},
			{
				test: /\.(sc|c|sa)ss$/,
				use: [
					MiniCssExtractPlugin.loader,
					'css-loader',
				]
			}
        ]
    },
    resolve: {
        alias: {
            'vue': 'vue/dist/vue',
        }
    }
};
