const { defineConfig } = require('cypress');

module.exports = defineConfig({
  e2e: {
    // Function to handle events in the Node.js environment
    setupNodeEvents(on, config) {
      // Node event listeners can be specified here
    },
    // Specify the pattern to match your single test file
    specPattern: 'cypress/firstTest.cy.js',
    // Since no baseUrl is preferred, it is omitted
    chromeWebSecurity: false,
    supportFile: false,
    video: false, // Video recording is disabled for faster test execution
    screenshotOnRunFailure: true,
    defaultCommandTimeout: 10000,
    pageLoadTimeout: 60000
  }
});