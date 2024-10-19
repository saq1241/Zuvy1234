const cucumber = require('cypress-cucumber-preprocessor');

module.exports = (on, config) => {
on('file:preprocessor', cucumber());
return config;
};

// cypress/plugins/index.js
module.exports = (on, config) => {
    config.env = config.env || {};
    config.env.JWT_TOKEN = process.env.JWT_TOKEN;
    return config;
  };