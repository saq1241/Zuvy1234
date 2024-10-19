const { Given, Then, When } = require('@badeball/cypress-cucumber-preprocessor');

// Step to open the Zuvy home page
Given('I open the Zuvy home page', () => {
  cy.visit('https://dev.app.zuvy.org/'); // Navigates to the base URL defined in cypress.config.js
});

// Step to verify the specific text on the home page
Then('I should see the text "Embark your learning journey with Zuvy in Seconds."', () => {
  cy.contains("Embark your learning journey with Zuvy in Seconds.").should('be.visible');
});

// Step to log in using a JWT
When('I login with JWT', () => {
  cy.loginWithJwt(); // Ensure this command handles authentication and possible redirection
});

// Step to verify redirection to the admin courses page
Then('I should be redirected to the admin courses page', () => {
  cy.url().should('eq', 'https://dev.app.zuvy.org/admin/courses'); // Checks that the URL matches the expected admin courses page
});

// Step to verify the presence of the 'Courses' text in an h1 tag on the courses page
Then('I should see an h1 tag with the text "Courses"', () => {
  cy.get('h1').should('have.text', 'Courses'); // Ensures the h1 tag exactly contains the text 'Courses'
});
