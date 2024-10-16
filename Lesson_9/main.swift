//
//  swift. 9th stream
//  Lesson_9
//
//  Created by Evgeny Mastepan on 16.10.2024.
//

import Foundation

/* 1. Создайте базовый класс Employee:
 ○ Свойства:
 ■ name: String — имя сотрудника.
 ■ salary: Double — зарплата сотрудника.
 ○ Инициализатор:
 ■ Используйте guard, чтобы проверить, что имя не пустое, а зарплата больше нуля. ○ Метод:
 ■ describe() — выводит информацию о сотруднике: его имя и зарплату. */

class Employee {
    let name: String
    let salary: Double
    
    init?(name: String, salary: Double){
        self.name = name
        guard name != "" else {
            print("Пустое имя недопустимо.")
            return nil
        }
        self.salary = salary
        guard salary > 0 else {
            print("Сотрудник должен иметь неотрицательную зарплату.")
            return nil
        }
    }
    func describe(){
        print("Сотрудник \(name) с заработной платой \(salary)")
    }
}

/* 2. Создайте подкласс Manager, который наследует от Employee:
 ○ Дополнительное свойство:
 ■ teamSize: Int — размер команды менеджера.
 ○ Инициализатор:
 ■ Используйте guard, чтобы проверить, что размер команды больше нуля.
 ■ Вызовите инициализатор суперкласса с помощью super.
 ○ Переопределите метод describe(), добавив информацию о размере команды (вызовите super.describe() и добавьте новые данные). */

class Manager: Employee {
    let teamSize: Int
    init?(name: String, salary: Double, teamSize: Int){
        self.teamSize = teamSize
        guard teamSize > 0 else {
            print("Команда должна быть больше нуля.")
            return nil
        }
        super.init(name: name, salary: salary)
    }
    override func describe() {
        super.describe()
        print("Размер команды данного менеджера - \(teamSize) чел.")
    }
}

/* Создайте подкласс Director, который также наследует от Manager:
 ○ Дополнительное свойство:
 ■ budget: Double — бюджет директора.
 ○ Инициализатор:
 ■ Используйте guard, чтобы убедиться, что бюджет больше нуля.
 ■ Вызовите инициализатор суперкласса.
 ○ Переопределите метод describe(), добавив информацию о бюджете (вызовите super.describe() и добавьте новые данные).
 Пример использования:
 Создайте объекты классов Employee, Manager и Director. Вызовите метод describe() для каждого из них. Ожидаемое поведение:
 ● При создании объекта класса Employee, должно выводиться имя и зарплата.
 ● При создании объекта класса Manager, должно выводиться имя, зарплата и размер команды.
 ● При создании объекта класса Director, должно выводиться имя, зарплата, размер команды и бюджет. */

class Director: Manager {
    let budget: Double
    init?(name: String, salary: Double, teamSize: Int, budget: Double){
        self.budget = budget
        guard budget > 0 else {
            print("Бюджет должен быть положительным.")
            return nil
        }
        super.init(name: name, salary: salary, teamSize: teamSize)
    }
    override func describe() {
        super.describe()
        print("Размер бюджета - \(budget).")
    }
}

func example() {
    guard let worker = Employee(name: "Привалов Александр Иванович", salary: 5000) else {
        print ("Неверный ввод данных")
        return
    }
    guard let manager = Manager(name: "Горыныч Наина Киевна", salary: 10000, teamSize: 21) else {
        print ("Неверный ввод данных")
        return
    }
    guard let director = Director(name: "Выбегалло Амвросий Амбруазович", salary: 25000, teamSize: 237, budget: 500000) else {
        print ("Неверный ввод данных")
        return
    }
    worker.describe()
    manager.describe()
    director.describe()
}

example()
