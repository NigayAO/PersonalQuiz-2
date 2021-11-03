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
    
    //Логика унылая, но ничего лучше придумать пока что не смог
    func whatsTheAnimal() {
        
        var rabbit = 0
        var cat = 0
        var dog = 0
        var turtle = 0
        
        for answer in arrayOfAnswer {
            
            switch answer.type {
            case PersonalQuiz.AnimalType.dog:
                dog += 1
            case PersonalQuiz.AnimalType.cat:
                cat += 1
            case PersonalQuiz.AnimalType.turtle:
                turtle += 1
            case PersonalQuiz.AnimalType.rabbit:
                rabbit += 1
            }
        }
        
        if dog > cat && dog > rabbit && dog > turtle {
            emojiLabel.text = "Вы - \(PersonalQuiz.AnimalType.dog.rawValue)"
            descriptionLabel.text = PersonalQuiz.AnimalType.dog.definition
        } else if cat > dog && cat > rabbit && cat > turtle {
            emojiLabel.text = "Вы - \(PersonalQuiz.AnimalType.cat.rawValue)"
            descriptionLabel.text = PersonalQuiz.AnimalType.cat.definition
        } else if rabbit > dog && rabbit > cat && rabbit > turtle {
            emojiLabel.text = "Вы - \(PersonalQuiz.AnimalType.rabbit.rawValue)"
            descriptionLabel.text = PersonalQuiz.AnimalType.rabbit.definition
        } else {
            emojiLabel.text = "Вы - \(PersonalQuiz.AnimalType.turtle.rawValue)"
            descriptionLabel.text = PersonalQuiz.AnimalType.turtle.definition
        }
    }
}
