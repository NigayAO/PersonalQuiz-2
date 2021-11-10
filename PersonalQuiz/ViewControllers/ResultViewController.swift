//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Nikita Zharinov on 01/11/2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var arrayOfAnswer: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        whatsTheAnimal()
    }

    func whatsTheAnimal() {
        var storageResult: [PersonalQuiz.AnimalType: Int] = [:]
        let animals = arrayOfAnswer.map { $0.type }
        
        for animal in animals {
            if let animalCount = storageResult[animal] {
                storageResult.updateValue(animalCount + 1, forKey: animal)
            } else {
                storageResult[animal] = 1
            }
        }
        let sortedAnswers = storageResult.sorted { $0.value < $1.value }
        guard let totalAnimal = sortedAnswers.last?.key else { return }
        updateUI(animal: totalAnimal)
    }
    
    private func updateUI(animal: PersonalQuiz.AnimalType) {
        emojiLabel.text = "Вы - \(animal.rawValue)"
        descriptionLabel.text = animal.definition
    }
}
