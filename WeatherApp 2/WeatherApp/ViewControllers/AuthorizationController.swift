import UIKit
import Firebase

class AuthorizationController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        Auth.auth().addStateDidChangeListener { [weak self](auth, user) in
            if user != nil {
                self?.performSegue(withIdentifier: "MainView", sender: nil)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        emailTextField.text = ""
        loginTextField.text = ""
    }
    
    fileprivate func setup() {
        setupView()
        setupButtons()
    }
    
    fileprivate func setupView() {
        view.backgroundColor = UIColor.appColor(.background_white_nightblue)
    }
    
    fileprivate func setupButtons() {
        loginButton.backgroundColor = .green
        loginButton.layer.cornerRadius = 8
        loginButton.backgroundColor = UIColor.appColor(.button_blue_darkblue)
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        guard
            let email = emailTextField.text,
            let password = loginTextField.text,
            email != "",
            password != ""
        else {
            self.presentAlert(title: "Ошибка", message: "Информация о пользователе некорректна", actions: [UIAlertAction(title: "Хорошо", style: .default, handler: nil)])
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (user, error) in
            if error != nil {
                self?.presentAlert(title: "Ошибка", message: "Неверные логин или пароль", actions: [UIAlertAction(title: "Хорошо", style: .default, handler: nil)])
                return
            }
            if user != nil {
                self?.performSegue(withIdentifier: "MainView", sender: nil)
                return
            }
            
            self?.presentAlert(title: "Ошибка", message: "Такой пользователь не зарегестрирован", actions: [UIAlertAction(title: "Хорошо", style: .default, handler: nil)])
        }
    }
    
    
    @IBAction func registerTapped(_ sender: Any) {
        guard
            let email = emailTextField.text,
            let password = loginTextField.text,
            email != "",
            password != ""
        else {
            self.presentAlert(title: "Ошибка", message: "Некорректная информация о пользователе", actions: [UIAlertAction(title: "Хорошо", style: .default, handler: nil)])
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (user, error) in
            if error == nil {
                if user != nil {
                    //self?.performSegue(withIdentifier: (self?.segueIdentifier)!, sender: nil)
                } else {
                    self?.presentAlert(title: "Ошибка", message: "Пользователь не был создан", actions: [UIAlertAction(title: "Хорошо", style: .default, handler: nil)])
                }
            } else {
                self?.presentAlert(title: "Ошибка", message: "Некорректные данные", actions: [UIAlertAction(title: "Хорошо", style: .default, handler: nil)])
            }
        }
    }
    
    private func presentAlert(title: String, message: String, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach { (action) in
            alert.addAction(action)
        }
        present(alert, animated: true, completion: nil)
    }
}
