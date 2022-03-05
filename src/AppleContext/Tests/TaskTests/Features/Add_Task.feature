Feature: Add tasks to the ToDo list

Users can add new tasks to the to-do list as long as
the list is not full of tasks and the description task length is correct
    
Scenario: User adds new task to an empty list
    Given a user who wants to add a new task to an empty ToDo list
    When he creates the task
    Then the task is added to the list

Scenario: User adds new task to an non-empty list and the list is not full
    Given a user who wants to add a new task to an non-empty ToDo list which is not full
    When he creates the task
    Then the task is added to the list
    
Scenario: User can't add new task when the to-do list is full with 5 tasks
    Given a user who wants to add a new task to a full ToDo list of 5 tasks
    When he creates the task
    Then the task is not added to the list
    
Scenario: Full list error is thrown when adding new task to a to-do list with 5 tasks
    Given a user who wants to add a new task to a full ToDo list of 5 tasks
    When he creates the task
    Then an error message is thrown indicating task list is full
    
Scenario: User can't add new task when the description task length is not correct
    Given a user who wants to add a new task to the to-do list with an incorrect description length
    When he creates the task
    Then the task is not added to the list
    
Scenario: Incorrect description task error is thrown when adding new task which description length is not correct
    Given a user who wants to add a new task to the to-do list with an incorrect description length
    When he creates the task
    Then an error message is thrown indicating task description length is not correct
