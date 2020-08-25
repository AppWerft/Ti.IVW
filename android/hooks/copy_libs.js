exports.id = 'gradle_plugins';
exports.cliVersion = '>=3.2';
exports.init = init;

const path = require('path');
const fs = require('fs');

/**
 * Main entry point for our plugin which looks for the platform specific
 * plugin to invoke.
 *
 * @param {Object} logger The logger instance.
 * @param {Object} config The hook config.
 * @param {Object} cli The Titanium CLI instance.
 * @param {Object} appc The Appcelerator CLI instance.
 */
// eslint-disable-next-line no-unused-vars
function init(logger, config, cli, appc) {
	cli.on('build.pre.build', {
		post: function () {
			// Copy the .aar file
			const aarFile = 'infonlinelib_2.1.2.aar';
			const fileSrc = path.resolve('./infonline_aar/' + aarFile);
			const fileDest = path.resolve('./build/android/libs/' + aarFile);

			if (!fs.existsSync(fileSrc)) {
				logger.error('Missing INFOnline file "' + aarFile + '" in ./infonline_aar/' + aarFile);
				process.exit(1);
			}

			fs.copyFileSync(fileSrc, fileDest);
			console.warn('COPIED! ' + fileDest);
		}
	});
}
