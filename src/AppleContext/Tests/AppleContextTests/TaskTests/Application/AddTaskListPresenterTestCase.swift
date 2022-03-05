import XCTest
import XCTest_Gherkin
import AppleContext

//@testable import AppleContext

final class AppleContextTests: XCTestCase {
    
    func testUserAddsNewTaskToAnEmptyList() throws {
        guard let path = Bundle.module.path(forResource: "Add_Task", ofType: "feature"),
              let module = Bundle(for: type(of: self)).resourceURL?.path else {
            return XCTFail("Features file didn't found")
        }

        let featuresFilePath = String(path.suffix(from: module.endIndex))
        NativeRunner.runScenario(featureFile: featuresFilePath,
                                 scenario: "User adds new task to an empty list",
                                 testCase: self)
    }

    func testUserAddsNewTaskToAnNonEmptyListAndTheListIsNotFull() throws {
        guard let path = Bundle.module.path(forResource: "Add_Task", ofType: "feature"),
              let module = Bundle(for: type(of: self)).resourceURL?.path else {
            return XCTFail("Features file didn't found")
        }

        let featuresFilePath = String(path.suffix(from: module.endIndex))
        NativeRunner.runScenario(featureFile: featuresFilePath,
                                 scenario: "User adds new task to an non-empty list and the list is not full",
                                 testCase: self)
    }

    func testUserCantAddNewTaskWhenTheToDoListIsFullOfTasks() throws {
        guard let path = Bundle.module.path(forResource: "Add_Task", ofType: "feature"),
              let module = Bundle(for: type(of: self)).resourceURL?.path else {
            return XCTFail("Features file didn't found")
        }

        let featuresFilePath = String(path.suffix(from: module.endIndex))
        NativeRunner.runScenario(featureFile: featuresFilePath,
                                 scenario: "User can't add new task when the to-do list is full with 5 tasks",
                                 testCase: self)
    }
    
    func testFullListErrorIsIndicatedWhenAddingNewTaskToAToDoListWith5Tasks() throws {
        guard let path = Bundle.module.path(forResource: "Add_Task", ofType: "feature"),
              let module = Bundle(for: type(of: self)).resourceURL?.path else {
            return XCTFail("Features file didn't found")
        }

        let featuresFilePath = String(path.suffix(from: module.endIndex))
        NativeRunner.runScenario(featureFile: featuresFilePath,
                                 scenario: "Full list error is thrown when adding new task to a to-do list with 5 tasks",
                                 testCase: self)
    }

    func testUserCantAddNewTaskWhenTheDescriptionTaskLengthIsNotCorrect() throws {
        guard let path = Bundle.module.path(forResource: "Add_Task", ofType: "feature"),
              let module = Bundle(for: type(of: self)).resourceURL?.path else {
            return XCTFail("Features file didn't found")
        }

        let featuresFilePath = String(path.suffix(from: module.endIndex))
        NativeRunner.runScenario(featureFile: featuresFilePath,
                                 scenario: "User can't add new task when the description task length is not correct",
                                 testCase: self)
    }
    
    func testIncorrectDescriptionTaskErrorIsThrownWhenAddingNewTaskWhichDescriptionLengthIsNotCorrect() throws {
        guard let path = Bundle.module.path(forResource: "Add_Task", ofType: "feature"),
              let module = Bundle(for: type(of: self)).resourceURL?.path else {
            return XCTFail("Features file didn't found")
        }

        let featuresFilePath = String(path.suffix(from: module.endIndex))
        NativeRunner.runScenario(featureFile: featuresFilePath,
                                 scenario: "Incorrect description task error is thrown when adding new task which description length is not correct",
                                 testCase: self)
    }

    // Methods mapping from Gherkin file to code
    final class StepsDefinition: StepDefiner {
        private var taskDescription: String = ""
        private var taskRepository: SpyTaskRepository? = nil
        private var addTaskListPresenter: AddTaskListPresenter? = nil
        private var spyAddTaskListPresenterOutput: SpyAddTaskListPresenterOutput? = nil
        
        override func defineSteps() {
            step("a user who wants to add a new task to an empty ToDo list") {
                self.taskRepository = SpyTaskRepository(tasksList: [])
                self.spyAddTaskListPresenterOutput = SpyAddTaskListPresenterOutput()
                self.addTaskListPresenter = AddTaskListPresenter(addTaskListPresenterOutput: self.spyAddTaskListPresenterOutput!, repository: self.taskRepository!)
                self.addTaskListPresenter?.updateTaskDescription(TaskDescriptionMother.random().getValue())
            }

            step("he creates the task") {
                self.addTaskListPresenter?.addTask()
            }

            step("the task is added to the list") {
                XCTAssertEqual(self.taskRepository?.numberOfTimesAddMethodCalled, 1)
            }

            step("a user who wants to add a new task to an non-empty ToDo list which is not full") {
                self.taskRepository = SpyTaskRepository(tasksList: [TaskMother.create()])
                self.spyAddTaskListPresenterOutput = SpyAddTaskListPresenterOutput()
                self.addTaskListPresenter = AddTaskListPresenter(addTaskListPresenterOutput: self.spyAddTaskListPresenterOutput!,
                                                                 repository: self.taskRepository!)
                self.addTaskListPresenter?.updateTaskDescription(TaskDescriptionMother.random().getValue())
            }

            step("a user who wants to add a new task to a full ToDo list of 5 tasks") {
                let tasksList = [TaskMother.create(),
                                 TaskMother.create(),
                                 TaskMother.create(),
                                 TaskMother.create(),
                                 TaskMother.create()
                ]
                self.taskRepository = SpyTaskRepository(tasksList: tasksList)
                self.spyAddTaskListPresenterOutput = SpyAddTaskListPresenterOutput()
                self.addTaskListPresenter = AddTaskListPresenter(addTaskListPresenterOutput: self.spyAddTaskListPresenterOutput!,
                                                                 repository: self.taskRepository!)
                self.addTaskListPresenter?.updateTaskDescription(TaskDescriptionMother.random().getValue())
            }

            step("the task is not added to the list") {
                XCTAssertEqual(self.taskRepository?.numberOfTimesAddMethodCalled, 0)
            }

            step("a user who wants to add a new task to the to-do list with an incorrect description length") {
                self.taskDescription = "abcdefghijklmnopqrstuvwxyzabcdefghijklmnwosptuvwxyz"
                self.taskRepository = SpyTaskRepository(tasksList: [])
                self.spyAddTaskListPresenterOutput = SpyAddTaskListPresenterOutput()
                self.addTaskListPresenter = AddTaskListPresenter(addTaskListPresenterOutput: self.spyAddTaskListPresenterOutput!,
                                                                 repository: self.taskRepository!)
                self.addTaskListPresenter?.updateTaskDescription(self.taskDescription)
            }
            
            step("an error message is thrown indicating task list is full") {
                XCTAssertEqual(self.spyAddTaskListPresenterOutput?.numberOfTimesShowFullListErrorCalled, 1)
            }
            
            step("an error message is thrown indicating task description length is not correct") {
                XCTAssertEqual(self.spyAddTaskListPresenterOutput?.numberOfTimesShowTaskDescriptionErrorCalled, 1)
            }
        }
    }
}
