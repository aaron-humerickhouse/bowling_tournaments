describe('More Rails using factory bot examples', function() {
  beforeEach(() => {
    cy.app('clean') // have a look at cypress/app_commands/clean.rb
  })

  it('using response from factory bot', function() {
    cy.appFactories([['create_list', 'tournament', 2 ]]).then((results) => {
      let tournaments = results[0]
      cy.visit(`/tournaments`)

      cy.get('.table').contains(tournaments[0].name).should('be.visible')
      cy.get('.table').contains(tournaments[1].name).should('be.visible')

      cy.get('.table tr').should('have.length', tournaments.length + 1)
    });
  })

  // it('using response from multiple factory bot', function() {
  //   cy.appFactories([
  //     ['create', 'post', { title: 'My First Post'} ],
  //     ['create', 'post', { title: 'My Second Post'} ]
  //   ]).then((results) => {
  //     cy.visit(`/posts/${results[0].id}`);
  //     cy.contains("My First Post")
  //
  //     cy.visit(`/posts/${results[1].id}`);
  //     cy.contains("My Second Post")
  //   });
  // })
})
