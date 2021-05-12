//
//  ViewController.swift
//  Quiz
//
//  Created by Romir Malik on 30/01/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var A: UIButton!
    @IBOutlet weak var B: UIButton!
    @IBOutlet weak var C: UIButton!
    @IBOutlet weak var D: UIButton!
    
    @IBAction func A(_ sender: Any) {
        score = score - 1
        loadNextQuestion()
    }
    
    @IBAction func B(_ sender: Any) {
        score = score - 2
        loadNextQuestion()
    }
    
    @IBAction func C(_ sender: Any) {
        score = score - 3
        loadNextQuestion()
    }
    
    @IBAction func D(_ sender: Any) {
        score = score - 4
        loadNextQuestion()
    }
    
    
    struct Question {
        let question: String
        let answers: [String]
    }
    var questions: [Question] = [
        Question(question: "Little interest or pleasure in doing things?", answers: ["Not at all", "Several days", "More than half of the days", "Nearly every day"]),
        Question(question: "Feeling down, depressed, or hopeless?", answers: ["Not at all","Several days","More than half the days", "Nearly every day"]),
        Question(question: "Trouble falling or staying asleep, or sleeping too much?", answers: ["Not at all","Several days","More than half the days", "Nearly every day"]),
        Question(question: "Feeling tired or having little energy?", answers: ["Not at all","Several days","More than half the days", "Nearly every day"]),
        Question(question: "Poor appetite or overeating ?", answers: ["Not at all","Several days","More than half the days", "Nearly every day"]),
        Question(question: "Feeling bad about yourself - or that you are a failure or have let yourself or your family down?", answers: ["Not at all","Several days","More than half the days", "Nearly every day"]),
        Question(question: "Trouble concentrating on things, such as reading the newspaper or watching television?", answers: ["Not at all","Several days","More than half the days", "Nearly every day"]),
        Question(question: "Moving or speaking so slowly that other people could have noticed ?", answers: ["Not at all","Several days","More than half the days", "Nearly every day"]),
        Question(question: "Thoughts that you would be better off dead, or of hurting yourself?", answers: ["Not at all","Several days","More than half the days", "Nearly every day"]),
        Question(question: "If you've had any days with issues above, how difficult have these problems made it for you at work, home, school, or with other people??", answers: ["Not at all","Several days","More than half the days", "Nearly every day"]),
    ]
    
    var currentQuestion: Question?
    var score = 50
    var currentQuestionPosition: Int = 0
    
    
    func loadNextQuestion() {
        if (currentQuestionPosition + 1 < questions.count) {
            currentQuestionPosition += 1
            currentQuestion = questions[currentQuestionPosition]
            setQuestions()
        } else {
            performSegue(withIdentifier: "sgShowResults", sender: nil)
        }
    }
    func setQuestions() {
        questionLabel.text = currentQuestion!.question
        A.setTitle(currentQuestion!.answers[0], for: .normal)
        B.setTitle(currentQuestion!.answers[1], for: .normal)
        C.setTitle(currentQuestion!.answers[2], for: .normal)
        D.setTitle(currentQuestion!.answers[3], for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.layer.cornerRadius = 10
        questionLabel.clipsToBounds = true
        
        currentQuestion = questions[0]
        setQuestions()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "sgShowResults") {
            print("begun")
            let vc = segue.destination as! ResultViewController
            if(score<10){
                vc.adviceLabel = "Rest In Piece"
            }
            
            else if(score<=20 && score>10)
            {
                vc.adviceLabel = "Immidiate Medical Attention Required"
            }
            
            else if(score<=30 && score>20)
            {
                vc.adviceLabel = "Medical Attention Required"
            }
            
            else if(score>30 && score<=40)
            {
                vc.adviceLabel = "You Are Mentally Fit"
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
