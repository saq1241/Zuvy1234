const { defineConfig } = require('cypress');
const createBundler = require('@bahmutov/cypress-esbuild-preprocessor');
const addCucumberPreprocessorPlugin =
  require('@badeball/cypress-cucumber-preprocessor').addCucumberPreprocessorPlugin;
const createEsbuildPlugin =
  require('@badeball/cypress-cucumber-preprocessor/esbuild').createEsbuildPlugin;

module.exports = defineConfig({
  e2e: {
    async setupNodeEvents(on, config) {
      await addCucumberPreprocessorPlugin(on, config);

      on(
        'file:preprocessor',
        createBundler({
          plugins: [createEsbuildPlugin(config)],
        })
      );

      // Uncomment this if you need to ignore certain exceptions
      // on('uncaught:exception', (err, runnable) => {
      //   return false;
      // });

      return config;
    },
    specPattern: './cypress/e2e/features/**/*.feature',
    baseUrl: 'https://dev.app.zuvy.org/', // Update this to your application's base URL if different
    stepDefinitions: './cypress/support/step_definitions/**/*.{js,mjs,ts,tsx}',
  },
});
