const { Given, When, Then } = require('@cucumber/cucumber');

// Visiting the homepage
Given('I visit the homepage', () => {
  cy.visit('https://dev.app.zuvy.org/');
});

// Logging in with a JSON Web Token
When('I login with JWT', () => {
  cy.loginWithJwt(); // Make sure this custom command is defined in your Cypress commands file.
});

// Checking the URL to ensure redirection is correct after login
Then('I should be redirected to the admin courses page', () => {
  cy.url().should('equal', 'https://dev.app.zuvy.org/admin/courses');
});

// Verifying the presence of a welcome message
Then('I should see a welcome message on the courses page', () => {
  cy.get('h1').should('contain', 'Courses'); // Confirm 'h1' contains 'Courses'
});
