Feature: Fines
   As a librarian, 
   I want to assess fines for books returned late,
   So that we can encourage maximum book availability.
   
Background:
   Given a library system with a branch named "East"

Scenario: Due date for book is 21 days after checkout
   Given an available book
   When a patron checks out the book on 2017/3/1
   Then the due date is 2017/3/22
   
Scenario: Book incurs no fine when returned on due date
   Given an available book
   And a patron checks out the book on 2017/4/1
   When the book is returned on 2017/4/22
   Then the patron's fine balance is 0
   
Scenario: Book incurs fine when returned after due date
   Given an available book
   And a patron checks out the book on 2017/5/1
   When the book is returned on 2017/5/23
   Then the patron's fine balance is 10

Scenario: Late book fine balance is multiple of days
   Given an available book
   And a patron checks out the book on 2017/5/1
   When the book is returned on 2017/5/25
   Then the patron's fine balance is 30