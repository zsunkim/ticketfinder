const webpack = require('webpack');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const OptimizeCSSAssetsPlugin = require('optimize-css-assets-webpack-plugin');

const path = require('path');
const glob = require('glob');

let jsSrc = glob.sync('./js/*.js');
let cssSrc = glob.sync('./css/*.css');
let fileSrc = jsSrc.concat(cssSrc);

module.exports = {
	mode : 'production',
	entry : {
		common : fileSrc
	},
	output : {
		filename : '[name].js',
		path : path.resolve(__dirname, './common')
	},
	module : {
		rules : [ {
			test : /\.css$/,
			use : [ MiniCssExtractPlugin.loader, {
				loader : 'css-loader',
				options : {
					url : false,
					sourceMap : true
				}
			} ]
		} ]
	},
	plugins : [ 
		new MiniCssExtractPlugin({ 
			filename : 'style.css' 
		})
	],
	optimization : {
		minimize : true,
		concatenateModules : true
	},
	resolve : {
		modules : [ 'node_modules' ],
		extensions : [ '.js', '.json', '.jsx', '.css' ],
	}
};
