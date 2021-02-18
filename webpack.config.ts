import * as webpack from "webpack";
import * as ManifestPlugin from "webpack-manifest-plugin";

const config: webpack.Configuration = {
  // Other webpack configuration options...
  plugins: [
    // Other plugins...
    new ManifestPlugin()
  ]
};

module.exports = config;