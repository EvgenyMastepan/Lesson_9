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

/*  Задача 1: Создайте класс Shape с методом area(), который возвращает площадь фигуры. */

class Shape {
    let unit: Double
    init(unit: Double){
        self.unit=unit
    }
    func area() -> Double {
        unit * unit
    }
}

let box = Shape(unit: 15)
print("Площадь = \(box.area())")

/* Задача 2: Создайте подкласс Rectangle, который наследует Shape, и переопределите метод area(), чтобы возвращать площадь прямоугольника. */

class Rectangle: Shape {
    let unit2: Double
    init(unit: Double, unit2: Double) {
        self.unit2 = unit2
        super.init(unit: unit)
    }
    override func area() -> Double {
        unit * unit2
    }
}

let rectangle = Rectangle(unit: 5, unit2: 7)
print("Площадь = \(rectangle.area())")

/* Задача 3: Создайте класс Circle, который также наследует Shape и реализует метод area() для круга. */

class Circle: Shape {
    override func area() -> Double {
        Double.pi * super.area()
    }
}

let circle = Circle(unit: 7)
print("Площадь = \(circle.area())")

/*  Домашнее задание (hard coding)
 Домашнее задание: Создание системы учёта студентов и сотрудников университета Описание задачи:
 1. Создайте базовый класс Person, который будет представлять общие свойства и методы для людей.
 ○ Свойства:
 ■ name: String — имя человека.
 ■ age: Int — возраст человека.
 ○ Инициализатор:
 ■ Используйте guard для проверки, что имя не пустое, а возраст больше нуля. Если данные некорректные, инициализатор должен возвращать nil.
 ○ Метод:
 ■ describe() — метод, который выводит информацию о человеке.
 */

class Person {
    let name: String
    let age: Int
    
    init?(name: String, age: Int){
        self.name = name
        guard name != "" else {
            print("Имя не может быть пустым.")
            return nil
        }
        self.age = age
        guard age > 0 else {
            print("Возраст должен быть положительным числом.")
            return nil
        }
    }
    
    func describe() {
        print("Гражданин \(name), в возрасте лет \(age).")
    }
}

/* Создайте класс Student, который наследует класс Person: ○ Дополнительное свойство:
 ■ studentID: String — идентификатор студента. ○ Инициализатор:
 ■ Помимо проверки имени и возраста, используйте guard для проверки, что studentID не пустой. ○ Переопределённый метод:
 ■ Переопределите метод describe(), чтобы выводить дополнительную информацию о студенте, включая его studentID.
   */

class Student: Person {
    let studentID: String
    
    init?(name:String, age: Int, studentID: String){
        self.studentID = studentID
        guard studentID != "" else {
            print("Идентификатор студента не может быть пустым.")
            return nil
        }
        super.init(name:name, age:age)
    }
    override func describe() {
        super.describe()
        print("Идентификатор студента: \(studentID)")
    }
}

/* Создайте класс Professor, который также наследует класс Person:
 ○ Дополнительное свойство:
 ■ subject: String — предмет, который преподаёт профессор.
 ○ Инициализатор:
 ■ Используйте guard, чтобы проверить, что имя не пустое, возраст больше нуля, и предмет также не пустой.
 ○ Переопределённый метод:
 ■ Переопределите метод describe(), чтобы выводить информацию о профессоре и предмете, который он
 преподаёт. */

class Professor: Person {
    let subject: String
 
    init?(name:String, age: Int, subject: String){
        self.subject = subject
        guard subject != "" else {
            print("Наименование предмета не может быть пустым.")
            return nil
        }
        super.init(name:name, age:age)
    }
    override func describe() {
        super.describe()
        print("Преподаваемый предмет: \(subject)")
    }
}

/* 1. Создайте несколько объектов классов Student и Professor.
   2. Выведите информацию о каждом человеке с помощью метода describe().
 */


//Функция работы классов. Для проверки обработки ошибко расскоментить отладочные строки.

func exam (){
    let studentsTemp: [(String, Int, String)] =   [("Родион Романович Раскольников", 23, "S56891"),
                                                   ("Заметов Александр Григорьевич", 22, "S55780"),
                                                   ("Разумихин Дмитрий Прокофьевич", 23, "S01466"),
//                                                 ("Амалия Ивановна Липпевехзель", 0, "O01240"),
                                                   ("Софья Семёновна Мармеладова", 18, "P68869"),
                                                   ("Авдотья Романовна Раскольникова", 22, "S56890")]
    
    let professorsTemp: [(String, Int, String)] = [("Лужин Пётр Петрович", 45, "Гражданское право"),
                                                   ("Свидригайлов Аркадий Иванович", 50, "Теория игр"),
                                                   ("Лебезятников Андрей Семёнович", 41, "Административное право"),
//                                                 ("", 56, "Теория множеств и дискретная математика"),
                                                   ("Докучаев Порфирий Петрович", 35, "Уголовное право")]
    
    for studentString in studentsTemp {
        guard let temp = Student(name: studentString.0, age: studentString.1, studentID: studentString.2) else {
            print("Ошибка вводных данных.")// Шеуф всё пропало, они сымают гыпс!
            return
        }
        temp.describe()
    }
    for professorString in professorsTemp {
        guard let temp = Professor(name: professorString.0, age: professorString.1, subject: professorString.2) else {
            print ("Ошибка вводных данных. Stop in code, stop programma, it's my life...")
            return
        }
        temp.describe()
    }
}

exam()
