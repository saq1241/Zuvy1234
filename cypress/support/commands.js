// ***********************************************
// This example commands.js shows you how to
// create various custom commands and overwrite
// existing commands.
//
// For more comprehensive examples of custom
// commands please read more here:
// https://on.cypress.io/custom-commands
// ***********************************************
//


//login with JWT token
Cypress.Commands.add('loginWithJwt', () => {
  cy.request({
    method: 'POST',
    url: 'https://merd-api.merakilearn.org/users/calendar/tokens',
    headers: {
      Authorization: `Bearer ${Cypress.env('JWT_TOKEN')}`
    },
  }).then((response) => {
    expect(response.status).to.equal(200); // Ensures a successful response

    // Example: Assume the JWT token is part of the response and needs to be stored
    if (response.body.token) {
      window.localStorage.setItem('token', response.body.token); // Set token in local storage
    }

    // Redirect to a specific page after login if necessary
    cy.visit('/admin/courses'); // Adjust this URL based on your application needs
  });
});
