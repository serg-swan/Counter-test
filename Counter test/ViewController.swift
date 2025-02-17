//
//  ViewController.swift
//  Counter
//
//  Created by Сергей Лебедь on 16.02.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelCounter: UILabel! //Табло счетчика
    private var count = 0  {
        didSet {
            labelCounter.text = "Значение счетчика: \(count)"
        }
    }// Переменная значения счетчика
    @IBOutlet weak var historyChange: UITextView! //История
    @IBOutlet weak var plusButton: UIButton! // Кнопка +
    @IBOutlet weak var minusButton: UIButton! // Кнопка -
    @IBOutlet weak var resetButton: UIButton! // Кнопка сброса
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyChange.isEditable = false //Запрет редактирования данных пользователем
        labelCounter.text = "Значение счетчика: \(count)" //Предварительная настройка счетчика
        historyChange.text = "История изменений:\n" //Предварительная настройка истории
        // Do any additional setup after loading the view.
    }
    func addMessage(_ message: String) { //Функция добавления новой строки истории
        let currentDate = Date() // Получаем текущую дату и время
        let dateFormatter = DateFormatter() // Переменная установки формата
           dateFormatter.dateFormat = "yyyy.MM.dd HH:mm" // Установка формата
           let dateString = dateFormatter.string(from: currentDate) // Форматируем дату и время в строку
        historyChange.text += "\(dateString) \(message)\n"   // Добавляем сообщение с датой и временем

           
           let range = NSRange(location:  historyChange.text.count - 1, length: 1) //Переменная прокрутки
        historyChange.scrollRangeToVisible(range) // Прокручиваем  вниз
       }

    @IBAction func plusButtonDidTap(_ sender: Any) {
        count += 1
        addMessage(": Значение изменено на +1 \n")
    }
    
    @IBAction func minusButtonDidTap(_ sender: Any) {
        if count >= 1 {
            count -= 1
            addMessage(": Значение изменено на -1 \n")
        } else if count == 1 {
            count -= 1
            addMessage(": Значение сброшено \n")
        } else { addMessage(": Попытка уменьшить значение счётчика ниже 0 \n")
        }
    }
    
    @IBAction func rasetDidTap(_ sender: Any) {
        count = 0
        addMessage(": Значение сброшено \n")
    }
    
}

