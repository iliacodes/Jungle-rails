describe('add to cart', () => {

  it('can visit the homepage', () => {
    cy.visit('/')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Selects item to add to cart", () => {
    cy.visit('/')
    cy.get(".products div button").first().click({force: true})
    cy.get('#cart-size').contains("(1)")
  })
});

