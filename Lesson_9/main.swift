//
//  main.swift
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

func myEmp() {
    guard let my = Manager(name: "гражданин Сухомлинский Пётр Кузьмич", salary: 10000, teamSize: 20) else {
        print ("Неверный ввод данных")
        return
    }
    my.describe()
}

myEmp()
