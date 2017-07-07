//
//  ViewController.swift
//  demo
//
//  Created by Andrey Bobkov on 06.07.17.
//  Copyright © 2017 White Tiger Soft. All rights reserved.
//

import UIKit
import MBProgressHUD

class LoginViewController: BaseViewController {

    @IBOutlet weak var textViewEmail: UITextField!
    @IBOutlet weak var textViewPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textViewEmail.becomeFirstResponder()
    }
    
    func showWeather() {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        let weatherApi = WeatherApi()
        weatherApi.loadWeather { weatherInfo in
            hud.hide(animated: true)
            if (weatherInfo == nil) {
                self.showAlert(title: "Погода в Москве", message: "Не удалось загрузить данные о погоде. Попробуйте в другой раз")
                return;
            }
            let mainWeatherInfo = weatherInfo?.mainWeatherInfo
            let temp = mainWeatherInfo?.temp
            let minTemp = mainWeatherInfo?.minTemp;
            let maxTemp = mainWeatherInfo?.maxTemp;
            
            let message =  String(format: "Средняя температура %.2f°C, минмальная %.2f°C, максимальная %.2f°C", temp!, minTemp!, maxTemp!)
            self.showAlert(title: "Погода в Москве", message: message)
        }
    }
    
    @IBAction func onLoginButtonTouched(_ sender: Any) {
        let loginForm = LoginForm()
        loginForm.email = self.textViewEmail.text
        loginForm.password = self.textViewPassword.text
        loginForm.validate()
        if (loginForm.hasErrors()) {
            showAlert(title: "Ошибка", message: loginForm.firstError())
        } else {
            self.view.endEditing(true)
            //TODO: show prognosis
            showWeather()
        }
    }
}
