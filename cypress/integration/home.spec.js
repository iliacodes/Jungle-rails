describe('home page', () => {
  it('visits homepage', () => {
    cy.visit('http://localhost:3000');
  });

  it("There is products on the page", () => {
    cy.debug();
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.debug();
    cy.get(".products article").should("have.length", 12);
  });
});